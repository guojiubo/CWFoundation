//
//  UIScrollView+CWFooterView.m
//  PlayWithScrollView
//
//  Created by guojiubo on 11/13/14.
//  Copyright (c) 2014 CocoaWind. All rights reserved.
//

#import "UIScrollView+CWFooterView.h"
#import <objc/runtime.h>

@implementation UIScrollView (CWFooterView)

static char CWFooterViewKey; // global 0 initialization is fine here, no need to change it since the value of the variable is not used, just the address

- (void)cw_setFooterView:(UIView *)footerView
{
    if (!self.cw_footerView) {
        [self addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:NULL];
    }
    else {
        UIEdgeInsets insets = self.contentInset;
        insets.bottom -= CGRectGetHeight([self.cw_footerView frame]);
        self.contentInset = insets;
        
        [self.cw_footerView removeFromSuperview];
    }
    
    objc_setAssociatedObject(self, &CWFooterViewKey, footerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (!footerView) {
        [self removeObserver:self forKeyPath:@"contentSize"];
        return;
    }
    
    UIEdgeInsets insets = self.contentInset;
    insets.bottom += CGRectGetHeight([self.cw_footerView frame]);
    self.contentInset = insets;
    
    CGRect frame = [self.cw_footerView frame];
    frame.size.width = self.bounds.size.width;
    frame.origin.y = self.contentSize.height;
    [self.cw_footerView setFrame:frame];
    [self addSubview:self.cw_footerView];
}

- (UIView *)cw_footerView
{
    return objc_getAssociatedObject(self, &CWFooterViewKey);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (![keyPath isEqualToString:@"contentSize"]) {
        return;
    }
    
    CGRect frame = [self.cw_footerView frame];
    frame.size.width = self.bounds.size.width;
    frame.origin.y = self.contentSize.height;
    [self.cw_footerView setFrame:frame];
}

@end
