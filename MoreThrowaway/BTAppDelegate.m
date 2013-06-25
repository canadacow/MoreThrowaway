//
//  BTAppDelegate.m
//  MoreThrowaway
//
//  Created by Dean Beeler on 06/25/2013.
//  Copyright (c) 2013 Avatron. All rights reserved.
//

#import "BTAppDelegate.h"

#import "BTViewController.h"

@implementation BTAppDelegate

- (void) openIn
{
    NSURL* url = [NSURL fileURLWithPath: @"/Users/dean/.hudson/plugins/maven-plugin/goals.html"];
    NSLog(@"url %@", url);
    
    NSURL* alternateUrl = [NSURL URLWithString: @"file://localhost/Users/dean/.hudson/plugins/maven-plugin/goals.html"];
    NSLog(@"alternateUrl %@", alternateUrl);
    
    NSURL* resourceUrl = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource: @"goals" ofType: @"html"]];
    NSLog(@"resourceUrl %@", resourceUrl);
    
    NSURL* remoteURL = [NSURL URLWithString: @"http://www.google.com/"];
    
    NSURLRequest* myFirstURLRequest = [NSURLRequest requestWithURL: resourceUrl];
    
    [self.viewController.myFirstWebView loadRequest: myFirstURLRequest];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[BTViewController alloc] initWithNibName:@"BTViewController_iPhone" bundle:nil];
    } else {
        self.viewController = [[BTViewController alloc] initWithNibName:@"BTViewController_iPad" bundle:nil];
    }
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
     [self performSelector: @selector(openIn) withObject: nil afterDelay: 1];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
