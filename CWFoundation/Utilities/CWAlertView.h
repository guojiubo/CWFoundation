//
//  CWAlertView.h
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CWAlertViewBlock) (void);

@interface CWAlertView : UIAlertView

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message;

- (NSInteger)addButtonWithTitle:(NSString *)title block:(CWAlertViewBlock)block;

- (NSInteger)addCancelButtonWithTitle:(NSString *)title block:(CWAlertViewBlock)block;

- (void)setCancelBlock:(CWAlertViewBlock)block;

@end
