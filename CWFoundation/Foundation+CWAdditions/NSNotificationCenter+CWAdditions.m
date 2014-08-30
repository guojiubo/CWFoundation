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

@end
