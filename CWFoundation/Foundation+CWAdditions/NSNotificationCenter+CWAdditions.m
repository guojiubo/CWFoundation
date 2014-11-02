//
//  NSNotificationCenter+CWAdditions.m
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import "NSNotificationCenter+CWAdditions.h"

@implementation NSNotificationCenter (CWAdditions)

- (void)cw_postNotificationName:(NSString *)aName object:(id)object userObject:(id)userObject
{
    if (!object) {
        [self postNotificationName:aName object:object];
    }
    [self postNotificationName:aName object:object userInfo:@{CWNotificationUserObjectKey: userObject}];
}

- (void)cw_postNotificationOnMainThreadName:(NSString *)aName sender:(id)sender userObject:(id)userObject
{
    NSNotification *notification = [NSNotification notificationWithName:aName object:sender userInfo:userObject ? @{CWNotificationUserObjectKey: userObject} : nil];
    [self performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:YES];
}

@end
