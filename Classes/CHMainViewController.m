//
//  CHMainViewController.m
//  CivHelper
//
//  Created by Marshall Weir on 4/23/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import "CHMainViewController.h"


@implementation CHMainViewController

- (void)loadView {
    
    self.view = [[UIView alloc] init];
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.jpg"]];
    [self.view addSubview:background];
    [background release];
    
    _detailViewController = [[TechDetailView alloc] init];
    _listViewController = [[TechListController alloc] init];
    _tradeCardController = [[CHTradeCardViewController alloc] init];
    
    _listNavController = [[UINavigationController alloc] initWithRootViewController:_listViewController];
    _listNavController.view.frame = CGRectMake(0, 0, 320, 748);
    _listNavController.navigationBar.tintColor = [UIColor colorWithRed:0.7 green:0.6 blue:0.45 alpha:1.0];

    self.viewControllers = [NSArray arrayWithObjects:_listNavController, _tradeCardController, nil];
    [self.view sendSubviewToBack:background];

}

@end
