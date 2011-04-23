//
//  Tech.m
//  CivHelper
//
//  Created by Marshall Weir on 3/27/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import "Tech.h"

static NSArray *techList;

@implementation Tech

@synthesize techName=_techName, name=_name, types=_types, price=_price;

+ (id)techWithName:(TechName)name {
    Tech *tech = [[Tech alloc] init];
    tech->_techName = name;
    return [tech autorelease];
}

+ (NSArray *)techList; {
    if (!techList) {
        techList = [[NSArray alloc] initWithObjects:
            [Tech techWithName:Pottery],
            [Tech techWithName:ClothMaking],
            [Tech techWithName:Metalworking],
            [Tech techWithName:Agriculture],
            [Tech techWithName:Roadbuilding],
            [Tech techWithName:Mining],
            [Tech techWithName:Engineering],
            [Tech techWithName:Astronomy],
            [Tech techWithName:Coinage],
            [Tech techWithName:Medicine],
            [Tech techWithName:Mathematics],
            [Tech techWithName:DramaPoetry],
            [Tech techWithName:Music],
            [Tech techWithName:Architecture],
            [Tech techWithName:Literacy],
            [Tech techWithName:Law],
            [Tech techWithName:Democracy],
            [Tech techWithName:Military],
            [Tech techWithName:Philosophy],
            [Tech techWithName:Mysticism],
            [Tech techWithName:Deism],
            [Tech techWithName:Enlightenment],
            [Tech techWithName:Monotheism],
            [Tech techWithName:Theology],
            nil];
    }
    return techList;
}

- (NSString *)name {
    switch (_techName) {
        case Pottery:
            return @"Pottery";
        case ClothMaking:
            return @"Cloth Making";
        case Metalworking:
            return @"Metalworking";
        case Agriculture:
            return @"Agriculture";
        case Roadbuilding:
            return @"Roadbuilding";
        case Mining:
            return @"Mining";
        case Engineering:
            return @"Engineering";
        case Astronomy:
            return @"Astronomy";
        case Coinage:
            return @"Coinage";
        case Medicine:
            return @"Medicine";
        case Mathematics:
            return @"Mathematics";
        case DramaPoetry:
            return @"Drama & Poetry";
        case Music:
            return @"Music";
        case Architecture:
            return @"Architecture";
        case Literacy:
            return @"Literacy";
        case Law:
            return @"Law";
        case Democracy:
            return @"Democracy";
        case Military:
            return @"Military";
        case Philosophy:
            return @"Philosophy";
        case Mysticism:
            return @"Mysticism";
        case Deism:
            return @"Deism";
        case Enlightenment:
            return @"Enlightenment";
        case Monotheism:
            return @"Monotheism";
        case Theology:
            return @"Theology";
    };
    
    return nil;
}

- (NSArray *)types; {
    switch (_techName) {
        case Pottery:
        case ClothMaking:
        case Metalworking:
        case Agriculture:
        case Roadbuilding:
        case Mining:
            return [NSArray arrayWithObject:[NSNumber numberWithInt:Craft]];
        case Engineering:
            return [NSArray arrayWithObjects:[NSNumber numberWithInt:Science],
                    [NSNumber numberWithInt:Craft], nil];
        case Astronomy:
        case Coinage:
        case Medicine:
            return [NSArray arrayWithObject:[NSNumber numberWithInt:Science]];
        case Mathematics:
            return [NSArray arrayWithObjects:[NSNumber numberWithInt:Art],
                    [NSNumber numberWithInt:Science], nil];
        case DramaPoetry:
        case Music:
        case Architecture:
            return [NSArray arrayWithObject:[NSNumber numberWithInt:Art]];
        case Literacy:
            return [NSArray arrayWithObjects:[NSNumber numberWithInt:Civic],
                    [NSNumber numberWithInt:Art], nil];
        case Law:
        case Democracy:
        case Military:
        case Philosophy:
            return [NSArray arrayWithObject:[NSNumber numberWithInt:Civic]];
        case Mysticism:
            return [NSArray arrayWithObjects:[NSNumber numberWithInt:Religion],
                    [NSNumber numberWithInt:Art], nil];
        case Deism:
        case Enlightenment:
        case Monotheism:
        case Theology:
            return [NSArray arrayWithObject:[NSNumber numberWithInt:Religion]];
    }
    
    return nil;
}

- (NSInteger) price; {
    /*
    switch (_techName) {
        case Pottery:
        case ClothMaking:
        case Metalworking:
        case Agriculture:
        case Roadbuilding:
        case Mining:
        case Engineering:
        case Astronomy:
        case Coinage:
        case Medicine:
        case Mathematics:
        case DramaPoetry:
        case Music:
        case Architecture:
        case Literacy:
        case Law:
        case Democracy:
        case Military:
        case Philosophy:
        case Mysticism:
        case Deism:
        case Enlightenment:
        case Monotheism:
        case Theology:
    }*/

    return 0;
}

- (UIColor *)colorForType:(TechType)techType {
    switch (techType) {
        case Craft:
            return [UIColor orangeColor];
        case Science:
            return [UIColor greenColor];
        case Art:
            return [UIColor blueColor];
        case Civic:
            return [UIColor redColor];
        case Religion:
            return [UIColor yellowColor];
    }

    return nil;
}

- (UIColor *)primaryColor {
    return [self colorForType:[[self.types objectAtIndex:0] intValue]];
}


- (UIColor *)secondaryColor; {
    if (self.types.count > 1) {
        return [self colorForType:[[self.types objectAtIndex:1] intValue]];
    }
    
    return nil;
}

#pragma mark -
#pragma mark Utility methods

    
- (NSInteger)priceWithPurchases:(NSArray *)ownedTechs {
    /*switch (_techName) {
     case Pottery:
     case ClothMaking:
     case Metalworking:
     case Agriculture:
     case Roadbuilding:
     case Mining:
     case Engineering:
     case Astronomy:
     case Coinage:
     case Medicine:
     case Mathematics:
     case DramaPoetry:
     case Music:
     case Architecture:
     case Literacy:
     case Law:
     case Democracy:
     case Military:
     case Philosophy:
     case Mysticism:
     case Deism:
     case Enlightenment:
     case Monotheism:
     case Theology:
     };*/
    return 0;
}
    
    
- (NSArray *)filteredList:(NSArray *)list ByType:(TechType)techType {
    
    return [list filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"%@ in types", techType]];
}

- (BOOL)isEqual:(id)object{
    if ([object isKindOfClass:[Tech class]]) {
        Tech *obj = (Tech *)object;
        return obj.techName == self.techName;
    }
    return NO;
}

@end
