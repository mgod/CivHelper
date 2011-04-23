//
//  TechTableViewCell.h
//  CivHelper
//
//  Created by Marshall Weir on 4/23/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Tech;

@interface TechTableViewCell : UITableViewCell {
    Tech *_tech;
    
    UILabel *_priceLabel;
    UIView *_secondColorView;
}

@property (nonatomic,retain) Tech *tech;

@end
