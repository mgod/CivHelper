// 
//  CHTech.m
//  CivHelper
//
//  Created by Marshall Weir on 4/24/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import "CHTech.h"
#import "CHTechDiscount.h"
#import "CHTechType.h"

@implementation CHTech 

@dynamic techID;
@dynamic price;
@dynamic techName;
@dynamic rules;
@dynamic calamityMods;
@dynamic discounts;
@dynamic providesDiscounts;
@dynamic types;

- (UIColor *)colorsForName:(NSString *)typeName {
    if ([typeName isEqualToString:@"Craft"])
        return [UIColor orangeColor];
    if ([typeName isEqualToString:@"Science"])
        return [UIColor greenColor];
    if ([typeName isEqualToString:@"Art"])
        return [UIColor blueColor];
    if ([typeName isEqualToString:@"Civic"])
        return [UIColor redColor];
    if ([typeName isEqualToString:@"Religion"])
        return [UIColor yellowColor];
    return nil;

}

- (UIColor *)primaryColor {
    return [self colorsForName:[self.typeNames objectAtIndex:0]];
}


- (UIColor *)secondaryColor; {
    if (self.types.count > 1) {
        return [self colorsForName:[self.typeNames objectAtIndex:1]];
    }
    
    return nil;
}

- (NSArray *)typeNames; {
    NSMutableArray *names = [NSMutableArray array];
    for (CHTechType *tt in self.types) {
        [names addObject:tt.typeName];
    }
    [names sortUsingSelector:@selector(compare:)];
    return names;
}

- (NSInteger)priceWithPurchases:(NSSet *)ownedTechs {
    NSInteger val = [self.price integerValue];
    for (CHTechDiscount *discount in self.discounts) {
        if ([ownedTechs containsObject:discount.ownedTech]) {
            val -= [discount.discount integerValue];
        }
    }
    return MAX(0, val);
}

@end
