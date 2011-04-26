//
//  CHGameManager.h
//  CivHelper
//
//  Created by Marshall Weir on 4/23/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CHTech, CHGame, CHTradeCard;

@interface CHGameManager : NSObject {
    NSManagedObjectContext *_managedObjectContext;
    NSManagedObjectModel *_managedObjectModel;
    NSPersistentStoreCoordinator *_persistentStoreCoordinator;
    
    CHGame *_game;
    NSArray *_techList;
    NSArray *_tradeCardList;
}

//State change calls
+ (void)setGame:(NSString *)gameName;

//Tech
+ (NSArray *)techList;
+ (NSSet *)ownedTechs;
+ (void)buyTech:(CHTech *)tech;
+ (void)sellTech:(CHTech *)tech;

//Trade cards
+ (NSArray *)tradeCardList;
+ (NSInteger)countForTradeCard:(CHTradeCard *)card;
+ (void)addTradeCard:(CHTradeCard *)card;
+ (void)removeTradeCard:(CHTradeCard *)card;

@end
