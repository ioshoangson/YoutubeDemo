//
//  VideoCell.m
//  YoutubeDemo
//
//  Created by Hoang Son on 3/19/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "VideoCell.h"
#import "VideoItem.h"
#import <UIImageView+AFNetworking.h>

@implementation VideoCell

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)setData:(VideoItem *)videoItem{
    self.titleVideoLabel.text = videoItem.titleVideo;
    self.descriptionVideoLabel.text = videoItem.descriptionVideo;
    [self.thumbnailsImageView setImageWithURL:[NSURL URLWithString:videoItem.thumbnailsUrl] placeholderImage:nil];
}

@end
