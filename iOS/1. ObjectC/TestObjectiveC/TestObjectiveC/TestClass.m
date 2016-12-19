//
//  TestClass.m
//  TestSelector
//
//  Created by bogon on 2016. 12. 6..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestClass.h"

@interface TestClass()
-(void) testPrint;
@end

@implementation TestClass

-(void)testNonArg {
    NSLog(@"testNonArg");
    [self testPrint];
}
-(void)testOneArg:(int)v {
    NSLog(@"testArg v = %d", v);
    a = v;
    NSLog(@"testArg a = %d", a);
    [self testPrint];
}
-(void)testTwoArg:(int)v another:(int)x {
    NSLog(@"testTwoArg v = %d x = %d", v, x);
    a = v;
    z = x;
    NSLog(@"testTwoArg a = %d z = %d", a, z);
    [self testPrint];
}

-(void) testPrint {
    NSLog(@"testPrint");
}

+(void)classMethod {
    NSLog(@"classMethod");
    //[self testPrint];
}

@end
