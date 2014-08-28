//
//  UIColor+CWAdditions.m
//  CWFoundation
//
//  Created by Guojiubo on 14-8-28.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import "UIColor+CWAdditions.h"

UIColor* CW_RGBColor(CGFloat r, CGFloat g, CGFloat b)
{
    return CW_RGBAColor(r, g, b, 1.0);
}

UIColor* CW_RGBAColor(CGFloat r, CGFloat g, CGFloat b, CGFloat a)
{
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];
}

UIColor* CW_HEXColor(NSInteger hex)
{
    return CW_RGBColor((hex>>16)&0xFF, (hex>>8)&0xFF, hex&0xFF);
}

@implementation UIColor (CWAdditions)

+ (instancetype)cw_randomColor
{
    NSUInteger r, g, b;
    r = arc4random_uniform(256);
    g = arc4random_uniform(256);
    b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

@end
