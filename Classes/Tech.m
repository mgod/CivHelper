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

@synthesize techName=_techName;

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
        default:
            return nil;
    }
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
        default:
            return nil;
    }
}

- (NSInteger) price; {
    switch (_techName) {
        case Pottery:
            return 45;
        case ClothMaking:
            return 45;
        case Metalworking:
            return 80;
        case Agriculture:
            return 110;
        case Roadbuilding:
            return 140;
        case Mining:
            return 180;
        case Engineering:
            return 140;
        case Astronomy:
            return 80;
        case Coinage:
            return 110;
        case Medicine:
            return 140;
        case Mathematics:
            return 230;
        case DramaPoetry:
            return 60;
        case Music:
            return 60;
        case Architecture:
            return 120;
        case Literacy:
            return 110;
        case Law:
            return 170;
        case Democracy:
            return 200;
        case Military:
            return 180;
        case Philosophy:
            return 240;
        case Mysticism:
            return 50;
        case Deism:
            return 80;
        case Enlightenment:
            return 150;
        case Monotheism:
            return 220;
        case Theology:
            return 250;
        default:
            return 0;
    }
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
        default:
            return nil;
    }
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

- (NSInteger)priceWithPurchases:(NSArray *)ownedTechs {
    NSInteger aPrice = self.price;
    switch (_techName) {
        case Pottery:
        case ClothMaking:
        case Metalworking:
        case Agriculture:
        case Roadbuilding:
        case Mining:
            aPrice -= [Tech filteredList:ownedTechs byType:Craft excludeTech:self].count * 10;
            break;
        case Engineering:
            aPrice -= [Tech filteredList:ownedTechs byType:Craft excludeTech:self].count * 10;
            if ([ownedTechs containsObject:[Tech techWithName:Roadbuilding]])
                aPrice -= 10;
            if ([ownedTechs containsObject:[Tech techWithName:Mining]])
                aPrice -= 10;
            //Engineering also gets sceince credits
        case Astronomy:
        case Coinage:
        case Medicine:
            aPrice -= [Tech filteredList:ownedTechs byType:Science excludeTech:self].count * 20;
            break;
        case Mathematics:
            aPrice -= [Tech filteredList:ownedTechs byType:Science excludeTech:self].count * 20;
            if ([ownedTechs containsObject:[Tech techWithName:Music]])
                aPrice -= 15; //5 more will be taken off below
        case Literacy:
            if ([ownedTechs containsObject:[Tech techWithName:DramaPoetry]] &&
                self.techName != Mathematics)
                aPrice -= 15; //5 more will get taken off below
        case DramaPoetry:
        case Music:
        case Architecture:
        case Mysticism:
            aPrice -= [Tech filteredList:ownedTechs byType:Art excludeTech:self].count * 5;
            break;
        case Law:
            if ([ownedTechs containsObject:[Tech techWithName:Mathematics]])
                aPrice -= 5;
            if ([ownedTechs containsObject:[Tech techWithName:DramaPoetry]])
                aPrice -= 5;
            if ([ownedTechs containsObject:[Tech techWithName:Music]])
                aPrice -= 5;
            if ([ownedTechs containsObject:[Tech techWithName:Architecture]])
                aPrice -= 15;
            if ([ownedTechs containsObject:[Tech techWithName:Literacy]])
                aPrice -= 25;
            break;
        case Democracy:
            aPrice -= [Tech filteredList:ownedTechs byType:Craft excludeTech:self].count * 10;
            if ([ownedTechs containsObject:[Tech techWithName:DramaPoetry]])
                aPrice -= 10;
            if ([ownedTechs containsObject:[Tech techWithName:Music]])
                aPrice -= 10;
            if ([ownedTechs containsObject:[Tech techWithName:Architecture]])
                aPrice -= 10;
            if ([ownedTechs containsObject:[Tech techWithName:Literacy]])
                aPrice -= 25;
            break;
        case Military:
            if ([ownedTechs containsObject:[Tech techWithName:Metalworking]])
                aPrice -= 20;
            break;
        case Philosophy:
            aPrice -= [Tech filteredList:ownedTechs byType:Science excludeTech:self].count * 20;
            if ([ownedTechs containsObject:[Tech techWithName:Mathematics]])
                aPrice -= 5; //20 got taken off earlier
            if ([ownedTechs containsObject:[Tech techWithName:Music]])
                aPrice -= 20;
            if ([ownedTechs containsObject:[Tech techWithName:Literacy]])
                aPrice -= 25;
            break;
        case Deism:
            if ([ownedTechs containsObject:[Tech techWithName:Mysticism]])
                aPrice -= 15;
            break;
        case Enlightenment:
            aPrice -= [Tech filteredList:ownedTechs byType:Art excludeTech:self].count * 10;
            if ([ownedTechs containsObject:[Tech techWithName:Mysticism]])
                aPrice -= 5; //10 got taken off above
            if ([ownedTechs containsObject:[Tech techWithName:Deism]])
                aPrice -= 15;
            break;
        case Monotheism:
            aPrice -= [Tech filteredList:ownedTechs byType:Craft excludeTech:self].count * 10;
            aPrice -= [Tech filteredList:ownedTechs byType:Religion excludeTech:self].count * 15;
            if ([ownedTechs containsObject:[Tech techWithName:Theology]]) 
                aPrice += 15; //we would have erronously discoujted for theology above
            break;
        case Theology:
            aPrice -= [Tech filteredList:ownedTechs byType:Science excludeTech:self].count * 20;
            if ([ownedTechs containsObject:[Tech techWithName:Mathematics]])
                aPrice -= 5;
            aPrice -= [Tech filteredList:ownedTechs byType:Religion excludeTech:self].count * 15;
            if ([ownedTechs containsObject:[Tech techWithName:Monotheism]]) 
                aPrice += 15; //we would have erronously discoujted for monotheism above
            break;
    }
                        
    return MAX(0, aPrice);
}
    
#pragma mark -
#pragma mark Utility methods

+ (NSArray *)filteredList:(NSArray *)list byType:(TechType)techType excludeTech:(Tech *)tech {
    return [list filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"%@ in types AND techName != %@", 
                                              [NSNumber numberWithInt:techType],
                                              [NSNumber numberWithInt:tech.techName]]];

}

+ (NSArray *)filteredList:(NSArray *)list byType:(TechType)techType {
    return [list filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"%@ in types", [NSNumber numberWithInt:techType]]];
}

- (BOOL)isEqual:(id)object{
    if ([object isKindOfClass:[Tech class]]) {
        Tech *obj = (Tech *)object;
        return obj.techName == self.techName;
    }
    return NO;
}

@end
