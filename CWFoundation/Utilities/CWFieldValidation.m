//
//  FSFieldValidation.m
//  FutureStep
//
//  Created by guojiubo on 8/18/14.
//
//

#import "CWFieldValidation.h"

@implementation CWFieldValidation

+ (BOOL)validateEmail:(NSString *)email
{
    NSString *pattern = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];
    NSUInteger numberOfMatches = [reg numberOfMatchesInString:email
                                                      options:0
                                                        range:NSMakeRange(0, [email length])];
    return numberOfMatches == 1;
}

@end
