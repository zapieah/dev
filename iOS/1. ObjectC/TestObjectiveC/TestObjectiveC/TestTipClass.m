//
//  TestTipClass.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 12..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestTipClass.h"


#define DFT_TRACE   NSLog(@"%s[Line %d]", __PRETTY_FUNCTION__, __LINE__);

#define MyLog(fmt, ...) NSLog((@"%s[Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

@implementation TestTipClass


-(void) testStackTrace {
    NSLog(@"testStackTrace");
    NSLog(@"%@",[NSThread callStackSymbols]);
}

-(void) testBackTrace {
    NSLog(@"testBackTrace");
    void *stackAdresses[32];
    int stackSize = backtrace(stackAdresses, 32);
    backtrace_symbols_fd(stackAdresses, stackSize, STDOUT_FILENO);
}

-(void) testLog {
    NSLog(@"testLog");
    DFT_TRACE;
}

-(void) testLog2 {
    NSLog(@"testLog2");
    MyLog(@"hello");
}

-(NSString*)description {
    //return (@"Hello description %s", __PRETTY_FUNCTION__);
    //NSLog(@"Hello %s", __PRETTY_FUNCTION__);
    return (@"Hello description");
}
@end
