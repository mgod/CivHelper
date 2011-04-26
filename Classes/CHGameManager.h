//
//  CHGameManager.h
//  CivHelper
//
//  Created by Marshall Weir on 4/23/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CHTech, CHGame;

@interface CHGameManager : NSObject {
    NSManagedObjectContext *_managedObjectContext;
    NSManagedObjectModel *_managedObjectModel;
    NSPersistentStoreCoordinator *_persistentStoreCoordinator;
    
    CHGame *_game;
    NSArray *_techList;
}

//State change calls
+ (void)setGame:(NSString *)gameName;

+ (NSArray *)techList;
+ (NSSet *)ownedTechs;

+ (void)buyTech:(CHTech *)tech;
+ (void)sellTech:(CHTech *)tech;

@end
