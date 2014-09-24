//
//  UIColor+CWAdditions.h
//  CWFoundation
//
//  Created by Guojiubo on 14-8-28.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import <UIKit/UIKit.h>

UIColor* CW_RGBColor(CGFloat r, CGFloat g, CGFloat b);
UIColor* CW_RGBAColor(CGFloat r, CGFloat g, CGFloat b, CGFloat a);
UIColor* CW_HEXColor(NSInteger hex);
UIColor* CW_HEXAColor(NSInteger hex, CGFloat a);

@interface UIColor (CWAdditions)

/**
 *  @return Random rgb color with alpha set to 1.0
 */
+ (instancetype)cw_randomColor;

@end
