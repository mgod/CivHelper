//
//  CHTechType.h
//  CivHelper
//
//  Created by Marshall Weir on 4/25/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CHTech;

typedef enum {
    Craft = 0,
    Science,
    Art,
    Civic,
    Religion
} TechType;

@interface CHTechType :  NSManagedObject  
{
}

@property (nonatomic, assign) TechType techType;
@property (nonatomic, readonly) NSString *typeName;
@property (nonatomic, retain) CHTech * tech;

@end



