//
//  TestClassProtocol.h
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 7..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestClassProtocolDelegate.h"



@interface TestClassProtocol : NSObject {
    @private
    int first;
    int second;
}

@property (nonatomic, weak) id <TestClassProtocolDelegate> delegate;
@property int first, second;

-(void) testTwoArg:(int) one two:(int)two;
-(void) sum;

@end
