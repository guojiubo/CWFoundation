//
//  NSString+CWAdditions.h
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CWAdditions)

- (NSString *)cw_trimSpace;

- (NSString *)cw_md5;

- (NSString *)cw_URLEncodedString;

- (NSString *)cw_URLDecodedString;

@end
