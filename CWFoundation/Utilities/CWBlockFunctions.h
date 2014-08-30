//
//  CWBlockFunctions.h
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

/**
 *  Performs a block on main thread sync regardless of the current thread
 *
 *  @param block The block to execute
 */
void CWBlockPerformSyncOnMainThread(void (^block) (void));
