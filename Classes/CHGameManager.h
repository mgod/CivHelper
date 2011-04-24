//
//  CHGameManager.h
//  CivHelper
//
//  Created by Marshall Weir on 4/23/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tech;

@interface CHGameManager : NSObject {
    NSMutableArray *_ownedTechs;
}

+ (NSArray *)ownedTechs;

+ (void)buyTech:(Tech *)tech;
+ (void)sellTech:(Tech *)tech;

@end
