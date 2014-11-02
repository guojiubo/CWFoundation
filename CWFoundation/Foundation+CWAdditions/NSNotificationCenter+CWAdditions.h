//
//  NSNotificationCenter+CWAdditions.h
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWFoundationConstans.h"

@interface NSNotificationCenter (CWAdditions)

// Put a user object into user info Dictionary
- (void)cw_postNotificationName:(NSString *)aName object:(id)object userObject:(id)userObject;

- (void)cw_postNotificationOnMainThreadName:(NSString *)aName sender:(id)sender userObject:(id)userObject;

@end
