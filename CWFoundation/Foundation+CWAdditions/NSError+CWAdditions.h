//
//  NSError+CWAdditions.h
//  CWFoundation
//
//  Created by guo on 11/1/14.
//  Copyright (c) 2014 CocoaWind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWFoundationConstans.h"

@interface NSError (CWAdditions)

+ (instancetype)errorWithDomain:(NSString *)domain code:(NSInteger)code message:(NSString *)message;

- (NSString *)errorMessage;

@end
