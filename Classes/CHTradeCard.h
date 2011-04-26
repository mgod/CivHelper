//
//  CHTradeCard.h
//  CivHelper
//
//  Created by Marshall Weir on 4/26/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface CHTradeCard :  NSManagedObject  
{
}

@property (nonatomic, assign) NSInteger value;
@property (nonatomic, assign) NSInteger tradeCardID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, assign) NSInteger setLimit;

- (NSInteger)cardValueForSet:(NSInteger)setCount;
- (NSInteger)nextValueForSet:(NSInteger)currentSetCount;

@end



