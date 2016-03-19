//
//  VideoCell.h
//  YoutubeDemo
//
//  Created by Hoang Son on 3/19/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VideoItem;
@interface VideoCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *titleVideoLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionVideoLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailsImageView;

- (void)setData:(VideoItem *)videoItem;

@end
