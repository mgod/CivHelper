//
//  CHTradeCardDetailView.h
//  CivHelper
//
//  Created by Marshall Weir on 4/26/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CHTradeCard;

@interface CHTradeCardDetailView: UIView {
    CHTradeCard *_tradeCard;
    UIButton *_plusButton;
    UIButton *_minusButton;
    UILabel *_cardLabel;
    UILabel *_valueLabel;
}

@property (nonatomic,retain) CHTradeCard *tradeCard;

@end
