//
//  UIScrollView+CWAdditions.h
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (CWAdditions)

- (CGSize)cw_availableBoundsSize;

- (void)cw_scrollToTopAnimated:(BOOL)animated;

- (void)cw_scrollToBottomAnimated:(BOOL)animated;

- (BOOL)cw_isReachingTheBottom;

@end
