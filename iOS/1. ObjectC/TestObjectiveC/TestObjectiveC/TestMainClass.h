//
//  TestMainClass.h
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 7..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestClassProtocolDelegate.h"

@class TestClassProtocol;

@interface TestMainClass : NSObject<TestClassProtocolDelegate> {
    @private
    TestClassProtocol *class;
}

-(void) startDelegate:(int)one two:(int)two;
-(void) executeDelegate;

@end
