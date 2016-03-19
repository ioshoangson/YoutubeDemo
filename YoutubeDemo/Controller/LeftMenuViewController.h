//
//  LeftMenuViewController.h
//  YoutubeDemo
//
//  Created by Hoang Son on 3/19/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "BaseViewController.h"

@class CategoryItem;
@interface LeftMenuViewController : BaseViewController
@property (nonatomic, copy) void (^clickItemAtIndexBlock)(NSIndexPath *indexPath, CategoryItem *categoryItem);

@end
