    //
//  CHTradeCardDetailView.m
//  CivHelper
//
//  Created by Marshall Weir on 4/26/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CHTradeCardDetailView.h"

#import "CHTradeCard.h"
#import "CHGameManager.h"

static CGFloat kPadding = 10.0;

@implementation CHTradeCardDetailView

@synthesize tradeCard=_tradeCard;

// Implement loadView to create a view hierarchy programmatically, without using a nib.
-(id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {        
        self.layer.shadowOpacity = 0.8;
        self.layer.shadowOffset = CGSizeMake(1, 2);
        self.layer.cornerRadius = 10.0;
        self.opaque = YES;
                
        _plusButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
        [_plusButton setTitle:@"+" forState:UIControlStateNormal];
        [_plusButton addTarget:self action:@selector(plusPushed) forControlEvents:UIControlEventTouchUpInside];
        
        _minusButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
        [_minusButton setTitle:@"-" forState:UIControlStateNormal];
        [_minusButton addTarget:self action:@selector(minusPushed) forControlEvents:UIControlEventTouchUpInside];
        
        _cardLabel = [[UILabel alloc] init];
        _cardLabel.backgroundColor = [UIColor clearColor];
        _cardLabel.font = [UIFont systemFontOfSize:20.0];
        
        _valueLabel = [[UILabel alloc] init];
        _valueLabel.backgroundColor = [UIColor clearColor];
        _valueLabel.font = [UIFont boldSystemFontOfSize:20.0];

        [self addSubview:_plusButton];
        [self addSubview:_minusButton];
        [self addSubview:_cardLabel];
        [self addSubview:_valueLabel];
        
        _plusButton.frame = CGRectMake(frame.size.width - 44 - kPadding, frame.size.height - 44 - kPadding, 44, 44);
        _minusButton.frame = CGRectMake(kPadding, frame.size.height - 44 - kPadding, 44, 44);
        
        _cardLabel.frame = CGRectMake(kPadding, kPadding / 2.0, 0, 24);
    }
    
    return self;
}


- (void)dealloc {
    [super dealloc];
}

#pragma mark -
#pragma mark View management

- (void)setTradeCard:(CHTradeCard *)card {
    if (_tradeCard != card) {
        [_tradeCard release];
        _tradeCard = [card retain];

        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {
    if ([CHGameManager countForTradeCard:_tradeCard] == 0) {
        self.backgroundColor = [UIColor colorWithRed:0.7 green:0.65 blue:0.60 alpha:1.0];
    } else {
        self.backgroundColor = [UIColor colorWithRed:1.0 green:0.97 blue:0.93 alpha:1.0];
    }
    
    _cardLabel.text = [NSString stringWithFormat:@"%i %@",
                       [CHGameManager countForTradeCard:_tradeCard], _tradeCard.name];
    [_cardLabel sizeToFit];
    
    _valueLabel.text = [NSString stringWithFormat:@"%i",
                        [_tradeCard cardValueForSet:[CHGameManager countForTradeCard:_tradeCard]]];
    [_valueLabel sizeToFit];
    _valueLabel.frame = CGRectMake(self.frame.size.width - kPadding - _valueLabel.frame.size.width,
                                   _cardLabel.frame.origin.y, _valueLabel.frame.size.width,
                                   _valueLabel.frame.size.height);
    if ([_tradeCard cardValueForSet:[CHGameManager countForTradeCard:_tradeCard]] == 0) {
        _valueLabel.hidden = YES;
    } else {
        _valueLabel.hidden = NO;
    }
}

#pragma mark -
#pragma mark buttons

- (void)plusPushed {
    [CHGameManager addTradeCard:_tradeCard];
    [self setNeedsLayout];
}

- (void)minusPushed {
    [CHGameManager removeTradeCard:_tradeCard];
    [self setNeedsLayout];
}


@end
