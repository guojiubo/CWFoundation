//
//  UITextField+CWAdditions.h
//  CWFoundation
//
//  Created by guojiubo on 10/9/14.
//  Copyright (c) 2014 CocoaWind. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (CWAdditions)

- (void)cw_setPlaceholder:(NSString *)placeholder color:(UIColor *)color NS_AVAILABLE_IOS(6_0);

@end
