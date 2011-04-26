// 
//  CHTradeCard.m
//  CivHelper
//
//  Created by Marshall Weir on 4/26/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import "CHTradeCard.h"


@interface CHTradeCard (PrimitiveAccessors)
@property (nonatomic, retain) NSNumber *primitiveValue;
@property (nonatomic, retain) NSNumber *primitiveTradeCardID;
@property (nonatomic, retain) NSNumber *primitiveSetLimit;
@end

@implementation CHTradeCard 

@dynamic value;
@dynamic tradeCardID;
@dynamic name;

- (NSInteger)cardValueForSet:(NSInteger)setCount; {
    if (setCount < 0 || setCount > self.setLimit) {
        return 0;
    }
    return self.value * setCount * setCount;
}

- (NSInteger)nextValueForSet:(NSInteger)currentSetCount; {
    NSInteger currentValue = [self cardValueForSet:currentSetCount];
    NSInteger nextValue = [self cardValueForSet:currentSetCount + 1];
    
    if (nextValue == 0)
        return 0;
    
    return nextValue - currentValue;
}

#pragma mark -
#pragma mark Core Data overrides

- (NSInteger)value {
    [self willAccessValueForKey:@"value"];
    NSNumber *tt = [self primitiveValue];
    [self didAccessValueForKey:@"value"];
    return [tt integerValue];
}

- (void)setValue:(NSInteger)value {
    [self willChangeValueForKey:@"value"];
    [self setPrimitiveValue:[NSNumber numberWithInt:value]];
    [self didChangeValueForKey:@"value"];
}

- (NSInteger)tradeCardID {
    [self willAccessValueForKey:@"tradeCardID"];
    NSNumber *tt = [self primitiveTradeCardID];
    [self didAccessValueForKey:@"tradeCardID"];
    return [tt integerValue];
}

- (void)setTradeCardID:(NSInteger)tradeCardID {
    [self willChangeValueForKey:@"tradeCardID"];
    [self setPrimitiveTradeCardID:[NSNumber numberWithInt:tradeCardID]];
    [self didChangeValueForKey:@"tradeCardID"];
}

- (NSInteger)setLimit {
    [self willAccessValueForKey:@"setLimit"];
    NSNumber *tt = [self primitiveSetLimit];
    [self didAccessValueForKey:@"setLimit"];
    return [tt integerValue];
}

- (void)setSetLimit:(NSInteger)setLimit {
    [self willChangeValueForKey:@"setLimit"];
    [self setPrimitiveSetLimit:[NSNumber numberWithInt:setLimit]];
    [self didChangeValueForKey:@"setLimit"];
}


@end
