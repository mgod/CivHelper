//
//  TechDetailView.h
//  CivHelper
//
//  Created by Marshall Weir on 3/27/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Tech;

@interface TechDetailView : UIViewController {
    Tech *_tech;
}

@property (nonatomic,retain) Tech *tech;

@end
