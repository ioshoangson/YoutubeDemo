//
//  CenterViewController.h
//  YoutubeDemo
//
//  Created by Hoang Son on 3/19/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "BaseViewController.h"

@class CategoryItem;
@interface CenterViewController : BaseViewController
@property (nonatomic, copy) void (^clickMenuBlock)(void);
- (void)refreshListVideoByCategoryFromYoutubeWithId:(CategoryItem *)categoryItem;

@end
