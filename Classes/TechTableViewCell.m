    //
//  TechTableViewCell.m
//  CivHelper
//
//  Created by Marshall Weir on 4/23/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import "TechTableViewCell.h"
#import "Tech.h"

static CGFloat kCellWidth = 320.0;
static CGFloat kCellHeight = 44.0;

@implementation TechTableViewCell

@synthesize tech=_tech;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {        
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //_priceLabel.textColor = [UIColor whiteColor];
        _priceLabel.font = [UIFont boldSystemFontOfSize:20.0];
        _priceLabel.backgroundColor = [UIColor clearColor];
        
        _secondColorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kCellWidth / 2.0, kCellHeight)];
        
        [self.contentView addSubview:_secondColorView];
        [self addSubview:_priceLabel];
        
        //self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.font = [UIFont boldSystemFontOfSize:20.0];        
    }
    
    return self;
}

- (void)setTech:(Tech *)tech {
    if (tech != _tech) {
        [_tech release];
        _tech = [tech retain];
        
        _priceLabel.text = [[NSNumber numberWithInt:_tech.price] stringValue];
        self.textLabel.text = _tech.name;
        self.contentView.backgroundColor = self.tech.primaryColor;
        if (self.tech.secondaryColor) {
            _secondColorView.backgroundColor = self.tech.secondaryColor;
        } else {
            _secondColorView.backgroundColor = self.tech.primaryColor;
        }

    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_priceLabel sizeToFit];
    CGRect frame = _priceLabel.frame;
    frame.origin = CGPointMake(kCellWidth - 10 - frame.size.width, (kCellHeight - frame.size.height) / 2.0);
    _priceLabel.frame = frame;
}

@end
