//
//  NSMutableAttributedString+CWAdditions.h
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (CWAdditions)

- (void)cw_setFont:(UIFont *)font NS_AVAILABLE_IOS(6_0);
- (void)cw_setFont:(UIFont *)font range:(NSRange)range NS_AVAILABLE_IOS(6_0);

- (void)cw_setTextColor:(UIColor *)color NS_AVAILABLE_IOS(6_0);
- (void)cw_setTextColor:(UIColor *)color range:(NSRange)range NS_AVAILABLE_IOS(6_0);

@end
