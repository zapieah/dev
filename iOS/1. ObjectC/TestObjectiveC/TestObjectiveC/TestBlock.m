//
//  TestBlock.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 6..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestBlock.h"

@implementation TestBlock
-(void) testBlock1 {
    NSLog(@"TestBlock");
    void (^printBlock1)(void) =
    ^(void) {
        NSLog(@"Block test 1");
    };
    printBlock1();
}

-(void) testBlock2 {
    void (^printBlock2)(int) =
    ^(int x) {
        NSLog(@"Block test 2 x = %d", x);
    };
    printBlock2(10);
}

-(void) testBlock3 {
    int staticValue = 15;
    void (^printBlock3)(int) =
    ^(int x) {
        //staticValue is readonly in block statement.
        //following is Error.
        //staticValue = staticValue + 100;
        NSLog(@"Block test 3 staticValue = %d, x = %d", staticValue, x);
    };
    staticValue = 20;
    printBlock3(30);
}

-(void) testBlock4 {
    int staticValue = 30;
    __block int dynamicValue = 15;
    
    void (^printBlock4)(int) =
    ^(int x) {
        //staticValue is readonly in block statement.
        //following is Error.
        //staticValue = staticValue + 100;
        
        //But dynamicValue is read/write in block statement.
        //following is not Error
        dynamicValue = dynamicValue + 200;
        NSLog(@"Block test 4 staticValue = %d, dynamicValue = %d, x = %d", staticValue, dynamicValue, x);
    };
    dynamicValue = 20;
    printBlock4(30);
}

-(void) testBlock5 {
    int j = 10;
    int (^blockPtr)(int) = ^(int n) {
        return j + n;
    };
    
    j = 20;
    
    int k = blockPtr(5);
    
    NSLog(@"k = %d", k);
}

-(void) testBlockArgument {
    NSLog(@"testBlockArgument");
    [self blockFunc:^int(int i) {
        return i + 5;
    }];
}

-(void) testBlockVariable {
    loggingBlock = [^(void){NSLog(@"%@", @"testBlockVariable copy block");} copy];
    loggingBlock();
}

-(void) blockFunc:(int (^)(int))blockArg {
    int i = blockArg(5);
    NSLog(@"Result : %d", i);
}

@end
