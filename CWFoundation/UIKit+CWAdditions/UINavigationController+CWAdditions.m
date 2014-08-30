//
//  UINavigationController+CWAdditions.m
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import "UINavigationController+CWAdditions.h"

@implementation UINavigationController (CWAdditions)

- (UIViewController *)cw_rootViewController
{
    return [self.viewControllers firstObject];
}

@end
