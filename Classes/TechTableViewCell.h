//
//  TechTableViewCell.h
//  CivHelper
//
//  Created by Marshall Weir on 4/23/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CHTech;

@interface TechTableViewCell : UITableViewCell {
    CHTech *_tech;
    
    UILabel *_priceLabel;
    UIView *_secondColorView;
}

@property (nonatomic,retain) CHTech *tech;

- (BOOL)isOwned;

@end
