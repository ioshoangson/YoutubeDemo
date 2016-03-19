//
//  Util.m
//  YoutubeDemo
//
//  Created by Hoang Son on 3/18/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "Util.h"
#import "Define.h"

@implementation Util
+ (NSString *)maxResults{
    if (IS_IPAD) {
        return MAX_RESULTS_IPAD;
    }
    return MAX_RESULTS_IPHONE;
}



@end
