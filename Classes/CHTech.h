//
//  CHTech.h
//  CivHelper
//
//  Created by Marshall Weir on 4/24/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CHTechDiscount;

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
} TechID;

@interface CHTech :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * techID;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSString * techName;
@property (nonatomic, retain) NSString * rules;
@property (nonatomic, retain) NSSet* calamityMods;
@property (nonatomic, retain) NSSet* discounts;
@property (nonatomic, retain) NSSet* providesDiscounts;
@property (nonatomic, retain) NSSet* types;

@property (readonly,nonatomic) UIColor *primaryColor;
@property (readonly,nonatomic) UIColor *secondaryColor;
@property (readonly,nonatomic) NSArray *typeNames; //Alphabetical order

- (NSInteger)priceWithPurchases:(NSSet *)ownedTechs;


@end


