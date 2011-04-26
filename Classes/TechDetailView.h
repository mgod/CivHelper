//
//  TechDetailView.h
//  CivHelper
//
//  Created by Marshall Weir on 3/27/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CHTech;

@interface TechDetailView : UIViewController {
    CHTech *_tech;
    UILabel *_techLabel;
}

@property (nonatomic,retain) CHTech *tech;

@end
