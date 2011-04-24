//
//  CHGameManager.m
//  CivHelper
//
//  Created by Marshall Weir on 4/23/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import "CHGameManager.h"

static CHGameManager *sharedManagerInstance;

@interface CHGameManager ()

+ (CHGameManager *)sharedInstance;

@end


@implementation CHGameManager

- (id)init  {
    if (self = [super init]) {
        _ownedTechs = [[NSMutableArray alloc] init];
    }
    
    return self;
}

+ (NSArray *)ownedTechs {
    return [CHGameManager sharedInstance]->_ownedTechs;
}

+ (void)buyTech:(Tech *)tech; {
    if (![[CHGameManager sharedInstance]->_ownedTechs containsObject:tech]) {
        [[CHGameManager sharedInstance]->_ownedTechs addObject:tech];
    }
}

+ (void)sellTech:(Tech *)tech; {
    [[CHGameManager sharedInstance]->_ownedTechs removeObject:tech];
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
