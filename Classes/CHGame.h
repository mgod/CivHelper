//
//  CHGame.h
//  CivHelper
//
//  Created by Marshall Weir on 4/24/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CHTech;

@interface CHGame :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* techs;

@end


@interface CHGame (CoreDataGeneratedAccessors)
- (void)addTechsObject:(CHTech *)value;
- (void)removeTechsObject:(CHTech *)value;
- (void)addTechs:(NSSet *)value;
- (void)removeTechs:(NSSet *)value;

@end

