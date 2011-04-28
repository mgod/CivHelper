//
//  CHGame.h
//  CivHelper
//
//  Created by Marshall Weir on 4/26/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CHTech, CHTradeCard;

@interface CHGame :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSMutableArray *tradeCardCounts;
@property (nonatomic, retain) NSSet* techs;

- (void)addTradeCard:(CHTradeCard *)card;
- (void)removeTradeCard:(CHTradeCard *)card;
- (NSInteger)getCardCount:(CHTradeCard *)card;
- (NSInteger)totalCardValue;

@end


@interface CHGame (CoreDataGeneratedAccessors)
- (void)addTechsObject:(CHTech *)value;
- (void)removeTechsObject:(CHTech *)value;
- (void)addTechs:(NSSet *)value;
- (void)removeTechs:(NSSet *)value;

@end

