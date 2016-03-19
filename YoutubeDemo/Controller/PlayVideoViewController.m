//
//  PlayVideoViewController.m
//  YoutubeDemo
//
//  Created by Hoang Son on 3/18/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "PlayVideoViewController.h"
#import <YTPlayerView.h>
#import "VideoItem.h"

@interface PlayVideoViewController ()<YTPlayerViewDelegate>
@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;

@end

@implementation PlayVideoViewController

#pragma mark- Life View Cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.playerView.delegate = self;
    [self playVideoWithId:self.videoItem.videoId];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


#pragma mark - Play Control
- (void)playVideoWithId:(NSString *)videId{
   [self.playerView loadWithVideoId:videId];
   [self.playerView playVideo];
}

#pragma mark - Play Delegate
/**
 * Invoked when the player view is ready to receive API calls.
 *
 * @param playerView The YTPlayerView instance that has become ready.
 */
- (void)playerViewDidBecomeReady:(YTPlayerView *)playerView{
    
}

/**
 * Callback invoked when player state has changed, e.g. stopped or started playback.
 *
 * @param playerView The YTPlayerView instance where playback state has changed.
 * @param state YTPlayerState designating the new playback state.
 */
- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state{
    switch (state) {
        case kYTPlayerStatePlaying:
            NSLog(@"Started playback");
            break;
        case kYTPlayerStatePaused:
            NSLog(@"Paused playback");
            break;
        default:
            break;
    }
}

/**
 * Callback invoked when playback quality has changed.
 *
 * @param playerView The YTPlayerView instance where playback quality has changed.
 * @param quality YTPlaybackQuality designating the new playback quality.
 */
- (void)playerView:(YTPlayerView *)playerView didChangeToQuality:(YTPlaybackQuality)quality{
    
}

/**
 * Callback invoked when an error has occured.
 *
 * @param playerView The YTPlayerView instance where the error has occurred.
 * @param error YTPlayerError containing the error state.
 */
- (void)playerView:(YTPlayerView *)playerView receivedError:(YTPlayerError)error{
    
}

/**
 * Callback invoked frequently when playBack is plaing.
 *
 * @param playerView The YTPlayerView instance where the error has occurred.
 * @param playTime float containing curretn playback time.
 */
- (void)playerView:(YTPlayerView *)playerView didPlayTime:(float)playTime{
    
}

/**
 * Callback invoked when setting up the webview to allow custom colours so it fits in
 * with app color schemes. If a transparent view is required specify clearColor and
 * the code will handle the opacity etc.
 */
- (UIColor *)playerViewPreferredWebViewBackgroundColor:(YTPlayerView *)playerView{
    return [UIColor redColor];
}

@end
