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

@interface CHMainViewController : UISplitViewController {
    TechDetailView *_detailViewController;
    TechListController *_listViewController;
}

@end
