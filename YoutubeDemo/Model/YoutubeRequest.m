//
//  YoutubeRequest.m
//  YoutubeDemo
//
//  Created by Hoang Son on 3/18/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "YoutubeRequest.h"
#import "CategoryItem.h"
#import "VideoItem.h"
#import "Define.h"
#import "API.h"
#import "Util.h"

static NSString *const API_YOUTUBE_KEY =  @"AIzaSyCczJSgOuOdkuYa-ub5cXtzEvHFVRN3t74";

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
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error, nil);
    }];
}

#pragma mark - Request
- (void)listCategory:(void (^)(NSArray *results))complete failure:(Failure)failure{
    [self GET:LIST_CATEGORY parameters:@{@"part": @"snippet",
                                         @"regionCode": @"VN",
                                         @"key": API_YOUTUBE_KEY} success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                             if (responseObject) {
                                                 NSMutableArray *results = [NSMutableArray array];
                                                 NSDictionary *itemsDictionary = responseObject[@"items"];
                                                 for (NSDictionary *dict in itemsDictionary) {
                                                     CategoryItem *categoryItem = [CategoryItem instanceFromData:dict];
                                                     [results addObject:categoryItem];
                                                 }
                                                 complete(results);
                                             }
    } memeFailure:^(NSError *error, NSString *message) {
        
    }];
}

- (void)listVideoById:(NSDictionary *)param
             complete:(void (^)(NSArray *results, NSString *nextPageToken))complete failure:(Failure)failure{
    [self GET:SEARCH parameters:@{@"videoCategoryId": param[@"videoCategoryId"],
                                  @"type": @"video",
                                  @"part": @"snippet",
                                  @"maxResults": [Util maxResults],
                                  @"pageToken": (param[@"nextPageToken"]) ? param[@"nextPageToken"] : @"",
                                  @"key": API_YOUTUBE_KEY} success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                      if (responseObject) {
                                          NSMutableArray *results = [NSMutableArray array];
                                          NSDictionary *itemsDictionary = responseObject[@"items"];
                                          for (NSDictionary *dict in itemsDictionary) {
                                              VideoItem *videoItem = [VideoItem instanceFromData:dict];
                                              [results addObject:videoItem];
                                          }
                                          complete(results, responseObject[@"nextPageToken"]);
                                      }
    } memeFailure:^(NSError *error, NSString *message) {
    }];
}


@end
