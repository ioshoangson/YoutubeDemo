//
//  CenterViewController.m
//  YoutubeDemo
//
//  Created by Hoang Son on 3/19/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "CenterViewController.h"

@implementation CenterViewController
- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationItem.leftBarButtonItem = self.menuBarButtonItem;
}

- (void)menuHandler{
    if (self.clickMenuBlock) {
        self.clickMenuBlock();
    }
}

@end
