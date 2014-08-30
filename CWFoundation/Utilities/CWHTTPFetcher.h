//
//  CWHTTPFetcher.h
//  CWFoundation
//
//  Created by guojiubo on 8/6/14.
//
//

#import <Foundation/Foundation.h>

@interface CWHTTPFetcher : NSObject

typedef void (^CWHTTPFetcherBlock) (CWHTTPFetcher *fetcher, NSError *error);

/**
 *  Can be anything, determined by subclass's implementation
 */
@property (nonatomic, strong) id responseObject;

/**
 *  The some as CWHTTPFetcherBlock's error
 */
@property (nonatomic, strong) NSError *error;

/**
 *  The network request operation
 */
@property (nonatomic, strong) NSOperation *requestOperation;

/**
 *  Convenience method to get an instance
 *
 *  @return a instance
 */
+ (instancetype)fetcher;

/**
 *  Invokes [self.requestOperation cancel] to cancel the network request
 */
- (void)cancel;

@end
