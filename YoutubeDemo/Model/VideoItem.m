//
//  VideoItem.m
//  YoutubeDemo
//
//  Created by Hoang Son on 3/18/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "VideoItem.h"

@implementation VideoItem

- (void)parseData{
    self.videoId = self.jsonData[@"id"][@"videoId"];
    self.titleVideo = self.jsonData[@"snippet"][@"title"];
    self.descriptionVideo = self.jsonData[@"snippet"][@"description"];
    self.thumbnailsUrl = self.jsonData[@"snippet"][@"thumbnails"][@"medium"][@"url"];
}

@end
