//
//  HomeViewController.h
//  YoutubeDemo
//
//  Created by Hoang Son on 3/18/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "BaseViewController.h"

@interface HomeViewController : BaseViewController
+ (HomeViewController *)share;
- (id)initWithHomeViewController:(UIViewController *)centerViewController
                        leftMenu:(UIViewController *)leftMenuViewController;
- (void)showMenu:(void (^)(void))complete;
- (void)hideMenu:(void (^)(void))complete;

@end
