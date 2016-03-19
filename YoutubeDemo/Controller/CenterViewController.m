//
//  CenterViewController.m
//  YoutubeDemo
//
//  Created by Hoang Son on 3/19/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "CenterViewController.h"
#import "UIScrollView+InfiniteScroll.h"
#import "PlayVideoViewController.h"
#import <XCDYouTubeVideoPlayerViewController.h>
#import "YoutubeRequest.h"
#import "CategoryItem.h"
#import "VideoItem.h"
#import "VideoCell.h"
#import "Define.h"

static NSString *VideoCellIdentifier = @"VideoCellIdentifier";

@interface CenterViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *videoTableView;
@property (nonatomic, strong) NSMutableArray *videoArray;
@property (nonatomic, strong) XCDYouTubeVideoPlayerViewController *videoPlayerViewController;
@property (nonatomic, strong) CategoryItem *selectedCategoryItem;

@end

@implementation CenterViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.videoTableView addInfiniteScrollWithHandler:^(id scrollView) {
        [self loadMoreWithNextPageToken:self.nextPageToken];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshListVideoByCategoryNotifi:) name:REFRESH_LIST_VIDEO_NOTIFI object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.leftBarButtonItem = self.menuBarButtonItem;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}




- (void)menuHandler{
    if (self.clickMenuBlock) {
        self.clickMenuBlock();
    }
}

#pragma mark - Request Data
- (void)refreshListVideoByCategoryFromYoutubeWithId:(CategoryItem *)categoryItem{
    self.selectedCategoryItem = categoryItem;
    self.title =  self.selectedCategoryItem.titleCategory;
    [self showHud];
    [[YoutubeRequest request] listVideoById:@{@"videoCategoryId" : [NSString stringWithFormat:@"%d",  self.selectedCategoryItem.categoryId]} complete:^(NSArray *results, NSString *nextPageToken) {
        [self hideHud];
        self.nextPageToken = nextPageToken;
        self.videoArray = [results mutableCopy];
        [self.videoTableView reloadData];
    } failure:^(NSError *error, NSString *message) {
        [self hideHud];
    }];
}

- (void)loadMoreWithNextPageToken:(NSString *)nextPageToken{
    [[YoutubeRequest request] listVideoById:@{@"videoCategoryId" : [NSString stringWithFormat:@"%d",  self.selectedCategoryItem.categoryId],
                                              @"nextPageToken": self.nextPageToken} complete:^(NSArray *results, NSString *nextPageToken) {
        self.nextPageToken = nextPageToken;
        [self.videoArray addObjectsFromArray:results];
        [self.videoTableView reloadData];
        [self.videoTableView finishInfiniteScroll];
    } failure:^(NSError *error, NSString *message) {
        [self.videoTableView finishInfiniteScroll];
    }];
}

#pragma mark - TableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.videoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell *videoCell = [tableView dequeueReusableCellWithIdentifier:VideoCellIdentifier forIndexPath:indexPath];
    VideoItem *video = [self.videoArray objectAtIndex:indexPath.row];
    [self configSytleCell:videoCell];
    [videoCell setData:video];
    return videoCell;
}

- (void)configSytleCell:(VideoCell *)cell{
    UIView *myBackView = [[UIView alloc] initWithFrame:cell.frame];
    myBackView.backgroundColor = [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:0.7];
    cell.selectedBackgroundView = myBackView;
}


#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoItem *videoItem = [self.videoArray objectAtIndex:indexPath.row];
    [self playVideo:videoItem.videoId];
}

#pragma mark - XCDYouTubeVideo
- (void)playVideo:(NSString *)videoId
{
    self.videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:videoId];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayerPlaybackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:self.videoPlayerViewController.moviePlayer];
    [self presentMoviePlayerViewControllerAnimated:self.videoPlayerViewController];
}

- (void)moviePlayerPlaybackDidFinish:(NSNotification *)notification
{
    /*
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:notification.object];
    MPMovieFinishReason finishReason = [notification.userInfo[MPMoviePlayerPlaybackDidFinishReasonUserInfoKey] integerValue];
    if (finishReason == MPMovieFinishReasonPlaybackError)
    {
        //NSError *error = notification.userInfo[XCDMoviePlayerPlaybackDidFinishErrorUserInfoKey];
        // Handle error
    }
     */
}

#pragma mark - Notification
- (void)applicationDidEnterBackground:(NSNotification*)note {
    double delayInSeconds = 0.01;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.videoPlayerViewController.moviePlayer play];
    });
}

- (void)refreshListVideoByCategoryNotifi:(NSNotification *)notifi{
    NSArray *categoryArray = (NSArray *)[notifi object];
    CategoryItem *category = [categoryArray firstObject];
    [self refreshListVideoByCategoryFromYoutubeWithId:category];
}

@end
