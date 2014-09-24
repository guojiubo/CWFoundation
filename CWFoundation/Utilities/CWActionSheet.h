//
//  CWActionSheet.h
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CWActionSheetBlock) (void);

@interface CWActionSheet : UIActionSheet

@property (nonatomic, weak) id /*<UIActionSheetDelegate>*/ externalDelegate;

- (instancetype)initWithTitle:(NSString *)title;

- (NSInteger)addButtonWithTitle:(NSString *)title block:(CWActionSheetBlock)block;

- (NSInteger)addDestructiveButtonWithTitle:(NSString *)title block:(CWActionSheetBlock)block;

- (NSInteger)addCancelButtonWithTitle:(NSString *)title block:(CWActionSheetBlock)block;

- (NSInteger)addCancelButtonWithTitle:(NSString *)title;

@end
