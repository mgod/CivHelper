//
//  CHTech.h
//  CivHelper
//
//  Created by Marshall Weir on 4/24/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CHTechDiscount;

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

@end


@interface CHTech (CoreDataGeneratedAccessors)

@end

