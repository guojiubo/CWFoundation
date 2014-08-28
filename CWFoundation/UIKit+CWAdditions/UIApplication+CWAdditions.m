//
//  UIApplication+CWAdditions.m
//  CWFoundation
//
//  Created by Guojiubo on 14-8-28.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import "UIApplication+CWAdditions.h"

@implementation UIApplication (CWAdditions)

+ (NSString *)cw_version
{
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
}

+ (NSString *)cw_build
{
    return [[NSBundle mainBundle] infoDictionary][(NSString*)kCFBundleVersionKey];
}

+ (NSString *)cw_cachesPath
{
    static dispatch_once_t onceToken;
	static NSString *cachedPath;
	dispatch_once(&onceToken, ^{
		cachedPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
	});
	return cachedPath;
}

+ (NSString *)cw_documentsPath
{
    static dispatch_once_t onceToken;
	static NSString *cachedPath;
	dispatch_once(&onceToken, ^{
		cachedPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
	});
	return cachedPath;
}

+ (NSString *)cw_temporaryPath
{
    static dispatch_once_t onceToken;
	static NSString *cachedPath;
	dispatch_once(&onceToken, ^{
		cachedPath = NSTemporaryDirectory();
	});	
	return cachedPath;
}

@end
