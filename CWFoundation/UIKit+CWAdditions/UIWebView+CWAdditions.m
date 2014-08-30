//
//  UIWebView+CWAdditions.m
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import "UIWebView+CWAdditions.h"

@implementation UIWebView (CWAdditions)

- (NSString *)cw_documentTitle
{
    return [self stringByEvaluatingJavaScriptFromString:@"document.title"];
}

@end
