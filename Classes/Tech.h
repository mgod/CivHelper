//
//  Tech.h
//  CivHelper
//
//  Created by Marshall Weir on 3/27/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Pottery,
    ClothMaking,
    Metalworking,
    Agriculture,
    Roadbuilding,
    Mining,
    Engineering,
    Astronomy,
    Coinage,
    Medicine,
    Mathematics,
    DramaPoetry,
    Music,
    Architecture,
    Literacy,
    Law,
    Democracy,
    Military,
    Philosophy,
    Mysticism,
    Deism,
    Enlightenment,
    Monotheism,
    Theology
} TechName;

typedef enum {
    Craft,
    Science,
    Art,
    Civic,
    Religion
} TechType;

@interface Tech : NSObject {
    TechName _techName;
}

+ (id)techWithName:(TechName)techName;
- (NSInteger)priceWithPurchases:(NSArray *)ownedTechs;
+ (NSArray *)techList;
- (NSArray *)filteredList:(NSArray *)list ByType:(TechType)techType;

@property (readonly,nonatomic) TechName techName;
@property (readonly,nonatomic) NSString *name;
@property (readonly,nonatomic) NSArray *types;
@property (readonly,nonatomic) NSInteger price;
@property (readonly,nonatomic) UIColor *primaryColor;
@property (readonly,nonatomic) UIColor *secondaryColor;

@end
