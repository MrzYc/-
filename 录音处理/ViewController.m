//
//  ViewController.m
//  录音处理
//
//  Created by 赵永闯 on 2017/8/6.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//

#import "ViewController.h"
#import "ZYCAudioTool.h"
#import "ZYCMusicTool.h"
#import "ZYCAudioFileTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)beginRecord:(id)sender {
    [[ZYCAudioTool shareInstance] beginRecordWithRecordPath:@"/Users/zhaoyongchuang/Desktop/test1.m4a"];
}

- (IBAction)endRecord:(id)sender {
    
    [[ZYCAudioTool shareInstance] endRecord];
    
}
- (IBAction)deleteRecord:(id)sender {
    [[ZYCAudioTool shareInstance] deleteRecord];
    
}
- (IBAction)playRecord:(id)sender {
    [[ZYCMusicTool shareInstance] playAudioWith:@"/Users/zhaoyongchuang/Desktop/test1.m4a"];
}


- (IBAction)hebing:(id)sender {
    
    [ZYCAudioFileTool addAudioFile:@"/Users/zhaoyongchuang/Desktop/test2.m4a" toAudioFile:@"/Users/zhaoyongchuang/Desktop/test1.m4a" savePath:@"/Users/zhaoyongchuang/Desktop/test3.m4a"];
    
}
- (IBAction)jiequ:(id)sender {
    [ZYCAudioFileTool subAudioWithPath:@"/Users/zhaoyongchuang/Desktop/test1.m4a" fromTimeSec:2 toTimeSec:3 savePath:@"/Users/zhaoyongchuang/Desktop/test4.m4a"];
}


@end
