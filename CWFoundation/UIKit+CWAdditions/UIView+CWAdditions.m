//
//  UIView+CWAdditions.m
//  CWFoundation
//
//  Created by Guojiubo on 14-8-28.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import "UIView+CWAdditions.h"

@implementation UIView (CWAdditions)

- (CGFloat)cw_left
{
    return self.frame.origin.x;
}

- (void)cw_setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)cw_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)cw_setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)cw_top
{
    return self.frame.origin.y;
}

- (void)cw_setTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)cw_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)cw_setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)cw_width
{
    return CGRectGetWidth(self.frame);
}

- (void)cw_setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)cw_height
{
    return CGRectGetHeight(self.frame);
}

- (void)cw_setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)cw_removeAllSubviews
{
    for (UIView *subview in [self subviews]) {
        [subview removeFromSuperview];
    }
}

- (void)cw_removeSubviewsOfClass:(Class)theClass
{
    for (UIView *subview in [self subviews]) {
        if ([subview isKindOfClass:theClass]) {
            [subview removeFromSuperview];
        }
    }
}

- (void)cw_removeAllGestureRecognizers
{
    for (UIGestureRecognizer *gesture in self.gestureRecognizers) {
        [self removeGestureRecognizer:gesture];
    }
}

- (void)cw_removeGestureRecognizersOfClass:(Class)theClass
{
    for (UIGestureRecognizer *gesture in self.gestureRecognizers) {
        if ([gesture isKindOfClass:theClass]) {
            [self removeGestureRecognizer:gesture];
        }
    }
}

@end
