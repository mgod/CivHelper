    //
//  TechDetailView.m
//  CivHelper
//
//  Created by Marshall Weir on 3/27/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import "TechDetailView.h"
#import "CHTech.h"

@implementation TechDetailView

@synthesize tech=_tech;

#pragma mark -
#pragma mark View lifecycle

- (void)loadView {
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];

}


- (void)dealloc {
    [super dealloc];
}

#pragma mark -
#pragma mark display methods

- (void)setTech:(Tech *)tech {
    if (tech != _tech) {
        
    }
}

@end
