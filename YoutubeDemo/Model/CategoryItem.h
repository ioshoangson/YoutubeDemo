//
//  CategoryItem.h
//  YoutubeDemo
//
//  Created by Hoang Son on 3/18/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "BaseObject.h"

@interface CategoryItem : BaseObject
@property (nonatomic, assign) int categoryId;
@property (nonatomic, copy) NSString *titleCategory;
@property (nonatomic, copy) NSString *channelId;

@end
