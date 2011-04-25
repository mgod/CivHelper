//
//  CHGameManager.m
//  CivHelper
//
//  Created by Marshall Weir on 4/23/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import "CHGameManager.h"
#import "CHGame.h"
#import "CHTech.h"
#import "CHTechDiscount.h"
#import "CHTechType.h"
#import "JSONKit.h"

static CHGameManager *sharedManagerInstance;
static NSString *defaultGame = @"default";

@interface CHGameManager ()

+ (CHGameManager *)sharedInstance;
- (NSURL *)applicationDocumentsDirectory;
- (void)setGame:(NSString *)gameName;
- (void)preloadIfNecessary;

@property (nonatomic,readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic,readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end


@implementation CHGameManager

- (id)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(saveDataOnNotification:)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(saveDataOnNotification:)
                                                     name:UIApplicationWillTerminateNotification
                                                   object:nil];
         
        [self preloadIfNecessary];
        [self setGame:defaultGame];
    }
    
    return self;
}

#pragma mark -
#pragma mark Game state methods

- (void)setGame:(NSString *)gameName; {
    if (!_game || _game.name != gameName) {
        [_game release];
        
        NSError *error = nil;
        NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
        NSEntityDescription *desc = [NSEntityDescription entityForName:@"CHGame"
                                                inManagedObjectContext:[self managedObjectContext]];
        [fetch setEntity:desc];

        NSArray *objects = [[self managedObjectContext] executeFetchRequest:fetch error:&error];
        if (error) {
            NSLog(@"error: %@", error);
        }
        
        _game = [[objects objectAtIndex:0] retain];
        NSLog(@"game: %@", _game);
    }
}

+ (void)setGame:(NSString *)gameName; {
    [[CHGameManager sharedInstance] setGame:gameName];
}

+ (NSArray *)techList {
    CHGameManager *mgr = [CHGameManager sharedInstance];
    if (!mgr->_techList || mgr->_techList.count == 0) {
        NSError *error;
        NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
        NSEntityDescription *desc = [NSEntityDescription entityForName:@"CHTech"
                                                inManagedObjectContext:[mgr managedObjectContext]];
        [fetch setEntity:desc];
        NSArray *sort = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"techID" ascending:YES]];
        [fetch setSortDescriptors:sort];
        mgr->_techList = [[[mgr managedObjectContext] executeFetchRequest:fetch error:&error] retain];
    }

    return mgr->_techList;
}

+ (NSArray *)ownedTechs {
    return [[CHGameManager sharedInstance]->_game.techs allObjects];
}

+ (void)buyTech:(CHTech *)tech; {
    if (![[CHGameManager sharedInstance]->_game.techs containsObject:tech]) {
        [[CHGameManager sharedInstance]->_game addTechsObject:tech];
    }
}

+ (void)sellTech:(CHTech *)tech; {
    [[CHGameManager sharedInstance]->_game removeTechsObject:tech];
}

#pragma mark -
#pragma mark Core Data stack

- (void)preloadIfNecessary; {
    if ([CHGameManager techList].count == 0) {
        NSManagedObjectContext *ctx = [self managedObjectContext];
        
        JSONDecoder *decoder = [[JSONDecoder alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Tech" ofType:@"json"];
        NSDictionary *techDict = [decoder objectWithData:[NSData dataWithContentsOfFile:path]];
        
        NSMutableArray *techs = [NSMutableArray array];
        for (NSArray *techArr in [techDict objectForKey:@"techs"]) {
            CHTech *tech = [NSEntityDescription insertNewObjectForEntityForName:@"CHTech"
                                                         inManagedObjectContext:ctx];
            tech.techID = [techArr objectAtIndex:0];
            tech.techName = [techArr objectAtIndex:1];
            tech.price = [techArr objectAtIndex:2];
            tech.rules = [techArr objectAtIndex:4];
            [techs addObject:tech];
        }
        
        for (NSArray *discountArr in [techDict objectForKey:@"discounts"]) {
            CHTechDiscount *discount = [NSEntityDescription insertNewObjectForEntityForName:@"CHTechDiscount"
                                                                     inManagedObjectContext:ctx];
            discount.tech = [techs objectAtIndex:[[discountArr objectAtIndex:0] intValue]];
            discount.ownedTech = [techs objectAtIndex:[[discountArr objectAtIndex:1] intValue]];
            discount.discount = [discountArr objectAtIndex:2];
        }
        
        for (NSArray *typeArr in [techDict objectForKey:@"types"]) {
            CHTechType *techType = [NSEntityDescription insertNewObjectForEntityForName:@"CHTechType"
                                                                 inManagedObjectContext:ctx];
            techType.tech = [techs objectAtIndex:[[typeArr objectAtIndex:0] intValue]];
            techType.techType = [typeArr objectAtIndex:1];
        }
        
        _game = [NSEntityDescription insertNewObjectForEntityForName:@"CHGame"
                                              inManagedObjectContext:[self managedObjectContext]];
        _game.name = defaultGame;
        
        NSError *error;
        [[self managedObjectContext] save:&error];
        if (error) {
            NSLog(@"Unable to load tech data: %@", error);
        }
    }
}


- (void)saveDataOnNotification:(NSNotification *)notification {
    
    NSError *error = nil;
	NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

- (NSManagedObjectContext *)managedObjectContext {
    
    if (_managedObjectContext == nil) {
        NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
        if (coordinator != nil) {
            _managedObjectContext = [[NSManagedObjectContext alloc] init];
            [_managedObjectContext setPersistentStoreCoordinator:coordinator];
        }
    }

    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel {
    
    if (_managedObjectModel == nil) {
        _managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];    
    }
    return _managedObjectModel;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CivHelper.sqlite"];
    NSLog(@"store url: %@", storeURL);
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


#pragma mark -
#pragma mark Singleton methods

+ (CHGameManager *)sharedInstance
{
    if (sharedManagerInstance == nil) {
        @synchronized(self) {
            if (sharedManagerInstance == nil) {
                sharedManagerInstance = [[CHGameManager alloc] init];
            }
        }
    }
    
    return sharedManagerInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if (sharedManagerInstance == nil) {
            sharedManagerInstance = [super allocWithZone:zone];
            return sharedManagerInstance;  // assignment and return on first allocation
        }
    }
    
    return nil; // on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (unsigned)retainCount
{
    return NSUIntegerMax;  // denotes an object that cannot be released
}

- (void)release
{
    //do nothing
}

- (id)autorelease
{
    return self;
}

@end
