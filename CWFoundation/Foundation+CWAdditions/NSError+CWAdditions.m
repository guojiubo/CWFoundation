//
//  NSError+CWAdditions.m
//  CWFoundation
//
//  Created by guo on 11/1/14.
//  Copyright (c) 2014 CocoaWind. All rights reserved.
//

#import "NSError+CWAdditions.h"

@implementation NSError (CWAdditions)

+ (instancetype)errorWithDomain:(NSString *)domain code:(NSInteger)code message:(NSString *)message
{
    if (!message) {
        return [self errorWithDomain:domain code:code userInfo:nil];
    }
    return [NSError errorWithDomain:domain code:code userInfo:@{CWErrorMessageKey: message}];
}

- (NSString *)errorMessage
{
    return self.userInfo[CWErrorMessageKey];
}

@end
