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
    
    
    _detailViewController = [[TechDetailView alloc] init];
    _listViewController = [[TechListController alloc] init];
    
    self.viewControllers = [NSArray arrayWithObjects:_listViewController, _detailViewController, nil];
}

@end
