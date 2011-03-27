//
//  CivHelperAppDelegate.m
//  CivHelper
//
//  Created by Marshall Weir on 3/26/11.
//  Copyright 2011 Mobiata, LLC. All rights reserved.
//

#import "CivHelperAppDelegate.h"
#import "TechListController.h"

@implementation CivHelperAppDelegate

#pragma mark -
#pragma mark Application lifecycle


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    _splitViewController = [[UISplitViewController alloc] init];
    UIViewController *tempView = [[[TechListController alloc] init] autorelease];
    tempView.view.backgroundColor = [UIColor purpleColor];
    _splitViewController.viewControllers = [NSArray arrayWithObjects:
                                            [[[TechListController alloc] init] autorelease],
                                            tempView, nil];
    _splitViewController.view.backgroundColor = [UIColor greenColor];
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]]; 
	[_window addSubview:_splitViewController.view];
    _window.backgroundColor = [UIColor blueColor];
    [_window makeKeyAndVisible];
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


/**
 applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {

}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[_splitViewController release];
	[_window release];

	[super dealloc];
}


@end

