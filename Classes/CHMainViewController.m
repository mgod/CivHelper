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
    self.view.backgroundColor = [UIColor blueColor];
    
    _detailViewController = [[TechDetailView alloc] init];
    _listViewController = [[TechListController alloc] init];
    
    _listNavController = [[UINavigationController alloc] initWithRootViewController:_listViewController];
    _detailNavController = [[UINavigationController alloc] initWithRootViewController:_detailViewController];

    _listNavController.view.frame = CGRectMake(0, 0, 320, 748);
    self.viewControllers = [NSArray arrayWithObjects:_listNavController, _detailViewController, nil];
}

@end
