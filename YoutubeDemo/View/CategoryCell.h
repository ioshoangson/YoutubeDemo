//
//  CategoryCell.h
//  YoutubeDemo
//
//  Created by Hoang Son on 3/19/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CategoryItem;
@interface CategoryCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *titleCategoryLabel;
@property (nonatomic, weak) IBOutlet UIView *firstSelectView;
@property (nonatomic, assign) BOOL firstSelect;
- (void)setData:(CategoryItem *)categoryItem;

@end
