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
    self.view = [[UIView alloc] initWithFrame:CGRectMake(320, 0, 704, 748)];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _techLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 500, 40)];
    _techLabel.text = @"12345477657898-90-0 agsdhjkfasjhdg;lkjaks;dflajsdkl;fajskl;dfjk";
    [self.view addSubview:_techLabel];
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

- (void)setTech:(CHTech *)tech {
    if (tech != _tech) {
        
    }
}

@end
