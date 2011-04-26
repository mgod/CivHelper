// 
//  CHTechType.m
//  CivHelper
//
//  Created by Marshall Weir on 4/25/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import "CHTechType.h"

#import "CHTech.h"

@interface CHTechType (PrimitiveAccessors)
@property (nonatomic, retain) NSNumber *primitiveTechType;
@end

@implementation CHTechType 

@dynamic tech;

- (TechType)techType {
    [self willAccessValueForKey:@"techType"];
    NSNumber *tt = [self primitiveTechType];
    [self didAccessValueForKey:@"techType"];
    return (TechType)[tt intValue];
}

- (void)setTechType:(TechType)techType {
    [self willChangeValueForKey:@"techType"];
    [self setPrimitiveTechType:[NSNumber numberWithInt:(NSInteger)techType]];
    [self didChangeValueForKey:@"techType"];
}

- (NSString *)typeName {
    switch (self.techType) {
        case Craft:
            return @"Craft";
        case Science:
            return @"Science";
        case Art:
            return @"Art";
        case Civic:
            return @"Civic";
        case Religion:
            return @"Religion";
        default:
            return nil;
    }
}

@end
