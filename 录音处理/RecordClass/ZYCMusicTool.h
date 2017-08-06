//
//  ZYCMusicTool.h
//  录音处理
//
//  Created by 赵永闯 on 2017/8/6.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "Sington.h"
@interface ZYCMusicTool : NSObject
singtonInterface;


/**
 *  播放歌曲
 */
- (AVAudioPlayer *)playAudioWith:(NSString *)audioPath;

/**
 *  恢复当前歌曲
 */
- (void)resumeCurrentAudio;

/**
 *  暂停歌曲
 */
- (void)pauseCurrentAudio;

/**
 *  停止歌曲
 */
- (void)stopCurrentAudio;

/**
 *  声音
 */
@property (nonatomic, assign) float volumn;

/**
 *  播放进度
 */
@property (nonatomic, assign, readonly) float progress;

@end
