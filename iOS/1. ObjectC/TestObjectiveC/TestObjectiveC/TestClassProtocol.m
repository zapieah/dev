//
//  TestClassProtocol.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 7..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestClassProtocol.h"

@implementation TestClassProtocol

@synthesize delegate, first, second;

-(void) testTwoArg:(int) first two:(int)second {
    NSLog(@"TestClassProtocol testTwoArg");
    self->first = first;
    self->second = second;
}

-(void) sum {
    NSLog(@"TestClassProtocol sum");
    [delegate testPrint:(self->first + self->second)];
}
@end
