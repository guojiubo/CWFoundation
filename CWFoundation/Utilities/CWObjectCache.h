//
//  FSObjectCache.h
//  FutureStep
//
//  Created by Guojiubo on 14-5-21.
//
//

#import <Foundation/Foundation.h>

@interface CWObjectCache : NSObject

+ (instancetype)sharedCache;

@property (assign, nonatomic) NSInteger maxCacheAge;

@property (assign, nonatomic) NSUInteger maxCacheSize;

- (void)storeObject:(id<NSCoding>)object forKey:(NSString *)key;
- (void)storeObject:(id<NSCoding>)object forKey:(NSString *)key toDisk:(BOOL)toDisk;

- (id)objectForKey:(NSString *)key;
- (id)objectFromMemoryCacheForKey:(NSString *)key;
- (id)objectFromDiskCacheForKey:(NSString *)key;

- (void)clearMemory;
- (void)clearDisk;
- (void)clearDiskOnCompletion:(void (^)())completion;

- (unsigned long long)cacheSize;
- (void)calculateCacheSize:(void (^)(unsigned long long size))completion;

@end
