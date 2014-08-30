//
//  NSNotification+CWAdditions.m
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import "NSNotification+CWAdditions.h"

@implementation NSNotification (CWAdditions)

- (id)cw_userObject
{
    return [self userInfo][CWNotificationUserObjectKey];
}

@end
