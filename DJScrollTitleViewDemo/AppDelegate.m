//
//  AppDelegate.m
//  DJScrollTitleViewDemo
//
//  Created by DJSword on 2020/3/5.
//  Copyright © 2020 DJSword. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    [self.window makeKeyAndVisible];
    
    
    return YES;
}



@end
