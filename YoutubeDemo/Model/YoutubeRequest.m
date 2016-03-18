//
//  YoutubeRequest.m
//  YoutubeDemo
//
//  Created by Hoang Son on 3/18/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "YoutubeRequest.h"
#import "Define.h"

@implementation YoutubeRequest
+ (YoutubeRequest *)request{
    static YoutubeRequest * requests = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        requests = [[YoutubeRequest alloc] initWithBaseURL:[NSURL URLWithString:API_URL_PRO]];
    });
    return requests;
}

#pragma mark - custom initialization

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self)
    {
        AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
        serializer.removesKeysWithNullValues = YES;
        self.responseSerializer = serializer;
    }
    return self;
}


- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                     parameters:(id)parameters
                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                    memeFailure:(Failure)failure
{
    return [super GET:[NSString stringWithFormat:@"%@", URLString] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error, nil);
    }];
}



@end
