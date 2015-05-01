//
//  UIScrollView+CWFooterView.h
//  PlayWithScrollView
//
//  Created by guojiubo on 11/13/14.
//  Copyright (c) 2014 CocoaWind. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (CWFooterView)

// !!!Important, if you set a footer, you MUST set it to nil before dealloced
@property (nonatomic, strong, setter=cw_setFooterView:) UIView *cw_footerView;

@end
