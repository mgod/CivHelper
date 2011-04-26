// 
//  CHGame.m
//  CivHelper
//
//  Created by Marshall Weir on 4/26/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import "CHGame.h"

#import "CHTech.h"
#import "CHTradeCard.h"

@implementation CHGame 

@dynamic name;
@dynamic tradeCardCounts;
@dynamic techs;

- (BOOL)isValidCard:(CHTradeCard *)card {
    if (self.tradeCardCounts.count > card.tradeCardID) {
        return YES;
    } else {
        NSLog(@"Invalid trade card");
        return NO;
    }
}

- (void)setCardCount:(NSInteger)cardCount forCard:(CHTradeCard *)card; {
    if (cardCount < 0 || cardCount > card.setLimit || ![self isValidCard:card])
        return;
    
    [self.tradeCardCounts replaceObjectAtIndex:card.tradeCardID
                                    withObject:[NSNumber numberWithInteger:cardCount]];
}

- (void)addTradeCard:(CHTradeCard *)card; {
    [self setCardCount:[self getCardCount:card] + 1 forCard:card];
}

- (void)removeTradeCard:(CHTradeCard *)card; {
    [self setCardCount:[self getCardCount:card] - 1 forCard:card];

}

- (NSInteger)getCardCount:(CHTradeCard *)card; {
    if ([self isValidCard:card]) {
        return [[self.tradeCardCounts objectAtIndex:card.tradeCardID] integerValue];
    }
    return 0;
}

@end
