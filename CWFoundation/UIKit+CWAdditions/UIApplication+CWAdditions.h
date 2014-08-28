//
//  UIApplication+CWAdditions.h
//  CWFoundation
//
//  Created by Guojiubo on 14-8-28.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (CWAdditions)

/**
 *  @return The version number of the bundle.
 */
+ (NSString *)cw_version;

/**
 *  @return The build number of the bundle.
 */
+ (NSString *)cw_build;

/**
 *  The return value is cached on the first call.
 *
 *  @return The path to the app's Caches folder.
 */
+ (NSString *)cw_cachesPath;

/**
 *  The return value is cached on the first call.
 *
 *  @return The path to the app's Doucment folder.
 */
+ (NSString *)cw_documentsPath;

/**
 *  The return value is cached on the first call.
 *
 *  @return The path of the temporary directory for the current user.
 */
+ (NSString *)cw_temporaryPath;

@end
