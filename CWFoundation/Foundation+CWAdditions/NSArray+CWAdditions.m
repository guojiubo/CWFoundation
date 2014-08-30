//
//  NSArray+CWAdditions.m
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import "NSArray+CWAdditions.h"

@implementation NSArray (CWAdditions)

- (BOOL)cw_containsString:(NSString *)string
{
    if (!string) {
        return NO;
    }
    
    for (id element in self) {
        if ([element isKindOfClass:[NSString class]]) {
            NSString *stringElement = (NSString *)element;
            if ([stringElement isEqualToString:string]) {
                return YES;
            }
        }
    }
    
    return NO;
}

@end
