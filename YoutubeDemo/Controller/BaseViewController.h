//
//  BaseViewController.h
//  YoutubeDemo
//
//  Created by Hoang Son on 3/18/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property (nonatomic, strong) UIBarButtonItem *menuBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *backBarButtonItem;

#pragma mark - Public Methods
- (void)showAlert:(NSString *)title message:(NSString *)message;
- (void)showHud;
- (void)hideHud;
- (void)menuHandler;
- (void)backHandle;


@end
