//
//  ZYCAudioFileTool.h
//  录音处理
//
//  Created by 赵永闯 on 2017/8/6.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sington.h"

@interface ZYCAudioFileTool : NSObject


+ (void)addAudioFile: (NSString *)fromPath toAudioFile:(NSString *)toPath savePath: (NSString *)savePath;

+ (void)subAudioWithPath:(NSString *)sourcePath fromTimeSec: (NSTimeInterval)fromSec toTimeSec:(NSTimeInterval)toSec savePath: (NSString *)savePath;

@end
