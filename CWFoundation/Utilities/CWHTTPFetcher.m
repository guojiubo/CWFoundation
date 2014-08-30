//
//  FSHTTPFetcher.m
//  FutureStep
//
//  Created by guojiubo on 8/6/14.
//
//

#import "CWHTTPFetcher.h"

@implementation CWHTTPFetcher

+ (instancetype)fetcher
{
    return [[[self class] alloc] init];
}

- (void)cancel
{
    [self.requestOperation cancel];
}

@end
