//
//  TestClassMethod.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 6..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestClassMethod.h"

static const int MAX_SIZE = 100;

@implementation TestClassMethod
+(void)testClassMethod {
    NSLog(@"testClassMethod");
}

+(int)MAX_SIZE {
    return MAX_SIZE;
}
@end
