//
//  HomeViewController.m
//  YoutubeDemo
//
//  Created by Hoang Son on 3/18/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "HomeViewController.h"
#import "CenterViewController.h"
#import "LeftMenuViewController.h"
#import "Define.h"

#define TIME_ANIMATE 0.25
#define MARGIN 100

@interface HomeViewController ()
@property (nonatomic, assign) BOOL isShowLeftMenu;
@property (nonatomic, strong) CenterViewController *centerViewController;
@property (nonatomic, strong) LeftMenuViewController *leftViewController;

@end

@implementation HomeViewController
- (id)initWithHomeViewController:(UIViewController *)centerViewController
                        leftMenu:(UIViewController *)leftMenuViewController{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:MAIN_STORYBOARD bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([HomeViewController class])];
    
        self.centerViewController = (CenterViewController *)centerViewController;


        self.leftViewController = (LeftMenuViewController *)leftMenuViewController;
    }
    return self;
}

- (CenterViewController *)findCenterViewController{
    UINavigationController *nav = (UINavigationController *)self.centerViewController;
    CenterViewController *centerViewController = (CenterViewController *)nav.topViewController;
    return centerViewController;
}

#pragma mark - View Life Cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    [self setupMenuUI];
}

#pragma mark - Slider Menu
- (void)setupMenuUI{
    //Add container left menu first
    if (self.leftViewController) {
        [self addChildViewController:self.leftViewController];
        [self.view addSubview:self.leftViewController.view];
        [self.leftViewController didMoveToParentViewController:self];
    }
    
    //Add container center view above left menu
    if (self.centerViewController) {
        [self addChildViewController:self.centerViewController];
        [self.view addSubview:self.centerViewController.view];
        [self.centerViewController didMoveToParentViewController:self];
        
        
        //Handle click menu
        __weak typeof(self) weakself = self;
        [[self findCenterViewController] setClickMenuBlock:^{
            weakself.isShowLeftMenu ? [weakself hideMenu:nil] : [weakself showMenu:nil];
        }];
        
    }
}

- (UIView *)leftMenu{
    UIView *view = [self.leftViewController view];
    return view;
}

- (UIView *)centerView{
    UIView *view = [self.centerViewController view];
    return view;
}

- (void)showMenu:(void (^)(void))complete{
    self.isShowLeftMenu = YES;
    
    //Bring leftview to back
    [self.view sendSubviewToBack:[self leftMenu]];
    
    //Animation for centerview
    [UIView animateWithDuration:TIME_ANIMATE animations:^{
        self.centerViewController.view.frame = CGRectMake(self.centerViewController.view.frame.size.width - MARGIN, 0, self.centerViewController.view.frame.size.width, self.centerViewController.view.frame.size.height);
    } completion:^(BOOL finished) {
        if (finished) {
            if (complete) {
                complete();
            }
        }
    }];
}

- (void)hideMenu:(void (^)(void))complete{
    self.isShowLeftMenu = NO;
    
    //Reset center view
    [UIView animateWithDuration:TIME_ANIMATE animations:^{
        self.centerViewController.view.frame = CGRectMake(0, 0, self.centerViewController.view.frame.size.width, self.centerViewController.view.frame.size.height);
    } completion:^(BOOL finished) {
        if (finished) {
            if (complete) {
                complete();
            }
        }
    }];
}

@end
