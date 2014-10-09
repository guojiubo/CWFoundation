//
//  UITextField+CWAdditions.m
//  CWFoundation
//
//  Created by guojiubo on 10/9/14.
//  Copyright (c) 2014 CocoaWind. All rights reserved.
//

#import "UITextField+CWAdditions.h"

@implementation UITextField (CWAdditions)

- (void)cw_setPlaceholder:(NSString *)placeholder color:(UIColor *)color
{
    NSAttributedString *s = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: color}];
    [self setAttributedPlaceholder:s];
}

@end
