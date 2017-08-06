//
//  ZYCAudioFileTool.m
//  录音处理
//
//  Created by 赵永闯 on 2017/8/6.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//

#import "ZYCAudioFileTool.h"
#import <AVFoundation/AVFoundation.h>

@implementation ZYCAudioFileTool

+ (void)addAudioFile: (NSString *)fromPath toAudioFile:(NSString *)toPath savePath: (NSString *)savePath {
    // 1. 获取两个音频资源
    AVURLAsset *audioAsset1 = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:fromPath]];
    AVURLAsset *audioAsset2 = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:toPath]];
        
    // 2. 表示素材轨道
    AVAssetTrack *audioAssetTrack1 = [[audioAsset1 tracksWithMediaType:AVMediaTypeAudio] firstObject];
    AVAssetTrack *audioAssetTrack2 = [[audioAsset2 tracksWithMediaType:AVMediaTypeAudio] firstObject];
    
    // 2. 结合了媒体数据，可以看成是track(音频轨道)的集合，用来合成音视频
    AVMutableComposition *composition = [AVMutableComposition composition];
    
    // 3. 用来表示一个track，包含了媒体类型、音轨标识符等信息，可以插入、删除、缩放track片段
    AVMutableCompositionTrack *audioTrack = [composition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:0];
    
    // 音频合并 - 插入音轨文件
    [audioTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, audioAsset1.duration) ofTrack:audioAssetTrack1 atTime:kCMTimeZero error:nil];
    [audioTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, audioAsset2.duration) ofTrack:audioAssetTrack2 atTime:audioAsset1.duration error:nil];
    
    // 5. 用来对一个AVAsset源对象进行转码，并导出为事先设置好的格式
    AVAssetExportSession *session = [[AVAssetExportSession alloc] initWithAsset:composition presetName:AVAssetExportPresetAppleM4A];
    session.outputURL = [NSURL fileURLWithPath:savePath];
    session.outputFileType = AVFileTypeAppleM4A;
    [session exportAsynchronouslyWithCompletionHandler:^{
        NSLog(@"合并完成----%@", savePath);
    }];
}

+ (void)subAudioWithPath:(NSString *)sourcePath fromTimeSec: (NSTimeInterval)fromSec toTimeSec:(NSTimeInterval)toSec savePath: (NSString *)savePath {
    
    // 1.拿到预处理音频文件
    NSURL *songURL = [NSURL fileURLWithPath:sourcePath];
    AVURLAsset *songAsset = [AVURLAsset URLAssetWithURL:songURL options:nil];
    
    // 2.创建音频输出会话
    AVAssetExportSession *exportSession = [AVAssetExportSession exportSessionWithAsset:songAsset
                                                                            presetName:AVAssetExportPresetAppleM4A];
    CMTime _startTime = CMTimeMake(fromSec, 1);
    CMTime _stopTime = CMTimeMake(toSec, 1);
    CMTimeRange exportTimeRange = CMTimeRangeFromTimeToTime(_startTime, _stopTime);
    
    // 3.设置音频输出会话并执行
    exportSession.outputURL = [NSURL fileURLWithPath:savePath];
    exportSession.outputFileType = AVFileTypeAppleM4A;
    exportSession.timeRange = exportTimeRange;
    [exportSession exportAsynchronouslyWithCompletionHandler:^{
        
        if (AVAssetExportSessionStatusCompleted == exportSession.status) {
            // 移除完整文件
            [[NSFileManager defaultManager] removeItemAtPath:sourcePath error:nil];
            NSLog(@"导出成功--%@", savePath);
        }
    }];    
}


@end
