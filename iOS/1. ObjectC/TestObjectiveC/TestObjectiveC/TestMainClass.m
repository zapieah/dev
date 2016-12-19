//
//  TestMainClass.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 7..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestMainClass.h"
#import "TestClassProtocol.h"

@implementation TestMainClass

-(void) startDelegate:(int)one two:(int)two {
    NSLog(@"TestMainClass startDelegate");
    class = [[TestClassProtocol alloc] init];
    class.delegate = self;
    [class testTwoArg:one two:two];
}

- (void) executeDelegate {
    NSLog(@"TestMainClass executeDelegate");
    [class sum];
}

- (void)testPrint:(int)result {
    NSLog(@"TestMainClass testPrint = %d ", result);
}
@end
