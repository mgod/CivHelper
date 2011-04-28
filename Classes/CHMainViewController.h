//
//  CHMainViewController.h
//  CivHelper
//
//  Created by Marshall Weir on 4/23/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TechListController.h"
#import "TechDetailView.h"
#import "CHTradeCardViewController.h"

@interface CHMainViewController : UISplitViewController {
    CHTradeCardViewController *_tradeCardController;
    TechDetailView *_detailViewController;
    TechListController *_listViewController;
    
    UINavigationController *_listNavController;
}

@end
