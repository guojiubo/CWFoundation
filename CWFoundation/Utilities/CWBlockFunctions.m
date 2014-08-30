//
//  CWBlockFunctions.m
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import "CWBlockFunctions.h"

void CWBlockPerformSyncOnMainThread(void (^block) (void))
{
    if ([NSThread isMainThread]) {
        block();
        return;
    }
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        block();
    });
}