//
//  NSArray+CWAdditions.h
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CWAdditions)

/**
 *  Use isEqualToString: to compare, which is faster than containsObject:
 */
- (BOOL)cw_containsString:(NSString *)string;

@end
