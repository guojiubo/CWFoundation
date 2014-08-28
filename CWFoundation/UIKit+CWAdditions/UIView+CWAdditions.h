//
//  UIView+CWAdditions.h
//  CWFoundation
//
//  Created by Guojiubo on 14-8-28.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CWAdditions)

@property (nonatomic, setter = cw_setLeft:) CGFloat cw_left;
@property (nonatomic, setter = cw_setRight:) CGFloat cw_right;
@property (nonatomic, setter = cw_setTop:) CGFloat cw_top;
@property (nonatomic, setter = cw_setBottom:) CGFloat cw_bottom;
@property (nonatomic, setter = cw_setWidth:) CGFloat cw_width;
@property (nonatomic, setter = cw_setHeight:) CGFloat cw_height;

- (void)cw_removeAllSubviews;

- (void)cw_removeSubviewsOfClass:(Class)theClass;

- (void)cw_removeAllGestureRecognizers;

- (void)cw_removeGestureRecognizersOfClass:(Class)theClass;

@end
