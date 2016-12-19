//
//  TestProtocol.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 7..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestProtocol.h"
#import "TestMainClass.h"

@implementation TestProtocol

-(void) test {
    NSLog(@"TestProtocol test");
    TestMainClass *tmc = [[TestMainClass alloc]init];
    [tmc startDelegate:10 two:40];
    [tmc executeDelegate];
}

@end
