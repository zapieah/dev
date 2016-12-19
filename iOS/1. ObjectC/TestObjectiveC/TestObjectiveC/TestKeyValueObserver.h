//
//  TestKeyValueObserver.h
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 12..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestKeyValueObserver : NSObject


//register observer;
-(void)registerAsObserver;

//receive notification from observer
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context;

//remove observer
- (void)unregisterForChangeNotification;

@end
