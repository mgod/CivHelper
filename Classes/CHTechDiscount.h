//
//  CHTechDiscount.h
//  CivHelper
//
//  Created by Marshall Weir on 4/25/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CHTech;

@interface CHTechDiscount :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * discount;
@property (nonatomic, retain) CHTech * ownedTech;
@property (nonatomic, retain) CHTech * tech;

@end



