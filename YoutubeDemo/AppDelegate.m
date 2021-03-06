//
//  AppDelegate.m
//  YoutubeDemo
//
//  Created by Hoang Son on 3/19/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "CenterViewController.h"
#import "LeftMenuViewController.h"
#import "YoutubeRequest.h"
#import "Define.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self loadListCategory];
    [self setupRootViewController];
    [self configUI];
    return YES;
}

- (void)setupRootViewController{
    LeftMenuViewController *leftViewController = [[UIStoryboard storyboardWithName:MAIN_STORYBOARD bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([LeftMenuViewController class])];
    CenterViewController *centerViewController = [[UIStoryboard storyboardWithName:MAIN_STORYBOARD bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([CenterViewController class])];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:centerViewController];
    HomeViewController *homeViewController = [[HomeViewController alloc] initWithHomeViewController:nav leftMenu:leftViewController];
    self.window.rootViewController = homeViewController;
}

- (void)configUI{
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0/255.0 green:196/255.0 blue:186/255.0 alpha:0.6]];
    [[UINavigationBar appearance] setTranslucent:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    NSShadow *shadow = [NSShadow new];
    [shadow setShadowColor: [UIColor clearColor]];
    [shadow setShadowOffset: CGSizeMake(0.0f, 1.0f)];
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIFont systemFontOfSize:17.0], NSFontAttributeName,
                                                          [UIColor whiteColor], NSForegroundColorAttributeName,
                                                          shadow, NSShadowAttributeName,nil]];
    
}

- (void)loadListCategory{
    [[YoutubeRequest request] listCategory:^(NSArray *results) {
        self.listCategory = results;
        [[NSNotificationCenter defaultCenter] postNotificationName:REFRESH_LIST_VIDEO_NOTIFI object:self.listCategory];
    } failure:^(NSError *error, NSString *message) {
    }];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
