//
//  ZYCAudioTool.h
//  录音处理
//
//  Created by 赵永闯 on 2017/8/6.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "Sington.h"

typedef void(^Success)(BOOL ret);

@interface ZYCAudioTool : NSObject

singtonInterface;

/**
 *  开始录音
 */
- (void)beginRecordWithRecordPath: (NSString *)recordPath;
/**
 *  结束录音
 */
- (void)endRecord;
/**
 *  暂停录音
 */
- (void)pauseRecord;

/**
 *  删除录音
 */
- (void)deleteRecord;

/**
 *  重新录音
 */
- (void)reRecord;

/**
 *  录音文件路径
 */
@property (nonatomic, copy, readonly) NSString *recordPath;

- (void)updateMeters;

- (float)peakPowerForChannel0;

@end
