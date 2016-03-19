//
//  CategoryCell.m
//  YoutubeDemo
//
//  Created by Hoang Son on 3/19/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "CategoryCell.h"
#import "CategoryItem.h"

@implementation CategoryCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selected) {
        UIView * selectedBackgroundView = [[UIView alloc] init];
        self.titleCategoryLabel.textColor = [UIColor whiteColor];
        [selectedBackgroundView setBackgroundColor:[UIColor colorWithRed:255/255.0f green:52/255.0f blue:0.0f alpha:0.8]];
        [self setSelectedBackgroundView:selectedBackgroundView];
    }else{
        UIView * selectedBackgroundView = [[UIView alloc] init];
        self.titleCategoryLabel.textColor = [UIColor lightGrayColor];
        [selectedBackgroundView setBackgroundColor:[UIColor clearColor]];
        [self setSelectedBackgroundView:selectedBackgroundView];
    }

}

- (void)setData:(CategoryItem *)categoryItem{
    self.titleCategoryLabel.text = categoryItem.titleCategory;
}

- (void)setFirstSelect:(BOOL)firstSelect{
    _firstSelect = firstSelect;
    self.firstSelectView.hidden = !_firstSelect;
}

@end
