//
//  NSMutableAttributedString+CWAdditions.m
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import "NSMutableAttributedString+CWAdditions.h"

@implementation NSMutableAttributedString (CWAdditions)

- (void)cw_setFont:(UIFont *)font
{
	[self cw_setFontName:font.fontName size:font.pointSize];
}

- (void)cw_setFont:(UIFont *)font range:(NSRange)range
{
	[self cw_setFontName:font.fontName size:font.pointSize range:range];
}

- (void)cw_setFontName:(NSString *)fontName size:(CGFloat)size
{
	[self cw_setFontName:fontName size:size range:NSMakeRange(0,[self length])];
}

- (void)cw_setFontName:(NSString *)fontName size:(CGFloat)size range:(NSRange)range
{
    [self addAttribute:NSFontAttributeName value:[UIFont fontWithName:fontName size:size] range:range];
}

- (void)cw_setTextColor:(UIColor *)color
{
	[self cw_setTextColor:color range:NSMakeRange(0,[self length])];
}

- (void)cw_setTextColor:(UIColor *)color range:(NSRange)range
{
	[self addAttribute:NSForegroundColorAttributeName value:color range:range];
}

@end
