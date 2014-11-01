//
//  NSNotification+CWAdditions.h
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWFoundationConstans.h"

@interface NSNotification (CWAdditions)

/**
 *  @return The user object in user info dictionary
 */
- (id)cw_userObject;

@end
