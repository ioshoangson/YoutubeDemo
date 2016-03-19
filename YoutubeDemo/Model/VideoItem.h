//
//  VideoItem.h
//  YoutubeDemo
//
//  Created by Hoang Son on 3/18/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "BaseObject.h"

@interface VideoItem : BaseObject
@property (nonatomic, copy) NSString *videoId;
@property (nonatomic, copy) NSString *titleVideo;
@property (nonatomic, copy) NSString *descriptionVideo;
@property (nonatomic, copy) NSString *thumbnailsUrl;

@end
