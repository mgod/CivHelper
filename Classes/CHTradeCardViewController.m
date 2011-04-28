    //
//  CHTradeCardView.m
//  CivHelper
//
//  Created by Marshall Weir on 4/26/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CHTradeCardViewController.h"

#import "CHGame.h"
#import "CHGameManager.h"
#import "CHTradeCard.h"
#import "CHTradeCardDetailView.h"

static CGFloat kWidthPadding = 24.0;
static CGFloat kHeightPadding = 24.0;

static CGFloat kWidth = 704.0;
static CGFloat kHeight = 748.0;

@interface CHTradeCardViewController ()
- (void)updateTotal;
@end


@implementation CHTradeCardViewController

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    UIScrollView *sView = [[UIScrollView alloc] initWithFrame:CGRectMake(320, 0, kWidth, kHeight)]; 
    self.view = sView;
    self.view.backgroundColor = [UIColor clearColor];
    
    _totalValue = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 24)];
    _totalValue.font = [UIFont boldSystemFontOfSize:36.0];
    _totalValue.backgroundColor = [UIColor clearColor];
    _totalValue.layer.shadowOffset = CGSizeMake(2, 1);
    _totalValue.layer.shadowOpacity = 0.8;
    _totalValue.layer.shadowColor = [[UIColor whiteColor] CGColor];
    [self.view addSubview:_totalValue];
    [self updateTotal];

    _tradeCardList = [[CHGameManager tradeCardList] retain];
    NSMutableArray *views = [NSMutableArray arrayWithCapacity:_tradeCardList.count];
    CGPoint nextPoint = CGPointMake(kWidthPadding, kHeightPadding + 44);
    CGFloat width = 146;
    CGFloat height = 110;
    
    for (CHTradeCard *card in _tradeCardList) {
        CHTradeCardDetailView *dView = [[CHTradeCardDetailView alloc] initWithFrame:
                                        CGRectMake(nextPoint.x, nextPoint.y, width, height)];
        dView.tradeCard = card;
        [views addObject:dView];
        [self.view addSubview:dView];
        
        nextPoint.x = nextPoint.x + kWidthPadding + width;

        if (views.count % 4 == 0) {
            nextPoint.x = kWidthPadding;
            nextPoint.y = nextPoint.y + (kHeightPadding + height) / 2.0;
        } else if (views.count % 2 == 0) {
            nextPoint.y = nextPoint.y + (kHeightPadding + height) / 2.0;
        }
    }
    _tradeCardViews = [views retain];
    
    sView.scrollEnabled = YES;
    UIView *lastView = [_tradeCardViews lastObject];
    sView.contentSize = CGSizeMake(kWidth, lastView.frame.size.height + lastView.frame.origin.y + kHeightPadding);
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [[CHGameManager game] addObserver:self
                           forKeyPath:@"tradeCardCounts"
                              options:NSKeyValueObservingOptionNew
                              context:nil];
    
    [super viewDidLoad];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

#pragma mark -
#pragma mark KVO

- (void)updateTotal {
    _totalValue.text = [NSString stringWithFormat:@"Total: %i", [CHGameManager tradeCardTotal]];
    [_totalValue sizeToFit];
    
    [self.view setNeedsLayout];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self updateTotal];
}


@end
