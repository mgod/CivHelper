//
//  CHTechType.h
//  CivHelper
//
//  Created by Marshall Weir on 4/25/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CHTech;

@interface CHTechType :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * techType;
@property (nonatomic, retain) CHTech * tech;

@end



