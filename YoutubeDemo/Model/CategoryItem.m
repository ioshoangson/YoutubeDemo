//
//  CategoryItem.m
//  YoutubeDemo
//
//  Created by Hoang Son on 3/18/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "CategoryItem.h"

@implementation CategoryItem

- (void)parseData{
    self.categoryId    = [self.jsonData[@"id"] intValue];
    self.channelId     = self.jsonData[@"snippet"][@"channelId"];
    self.titleCategory = self.jsonData[@"snippet"][@"title"];
}

@end
