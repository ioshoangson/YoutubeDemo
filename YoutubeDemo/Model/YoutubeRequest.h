//
//  YoutubeRequest.h
//  YoutubeDemo
//
//  Created by Hoang Son on 3/18/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPRequestOperationManager.h>

typedef void (^Failure)(NSError *error, NSString *message);

@interface YoutubeRequest : AFHTTPRequestOperationManager
+ (YoutubeRequest *)request;

@end
