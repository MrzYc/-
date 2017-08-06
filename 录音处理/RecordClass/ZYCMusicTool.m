//
//  ZYCMusicTool.m
//  录音处理
//
//  Created by 赵永闯 on 2017/8/6.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//

#import "ZYCMusicTool.h"

@interface ZYCMusicTool ()
/** 音乐播放器 */
@property (nonatomic ,strong) AVAudioPlayer *player;

@end

@implementation ZYCMusicTool

singtonImplement(ZYCMusicTool)

/**
 *  播放歌曲
 */
- (AVAudioPlayer *)playAudioWith:(NSString *)audioPath
{
    NSURL *url = [NSURL URLWithString:audioPath];
    if (url == nil) {
        url = [[NSBundle mainBundle] URLForResource:audioPath.lastPathComponent withExtension:nil];
    }
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player prepareToPlay];
    [self.player play];
    return self.player;
}

/**
 *  恢复当前歌曲
 */
- (void)resumeCurrentAudio
{
    [self.player play];
}

/**
 *  暂停歌曲
 */
- (void)pauseCurrentAudio
{
    [self.player pause];
}

/**
 *  停止歌曲
 */
- (void)stopCurrentAudio
{
    [self.player stop];
}


-(void)setVolumn:(float)volumn
{
    self.player.volume = volumn;
}

-(float)volumn
{
    return self.player.volume;
}

-(float)progress {
    return self.player.currentTime / self.player.duration;
}


@end
