//
//  TestFuntionPointer.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 13..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestFunctionPointer.h"

@interface TestFunctionPointer()
NSInteger numericalSortFn(id obj1, id obj2, void* ascendingFlag);
@end

@implementation TestFunctionPointer

-(void) testFunction {

    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:5];
    [array addObject:[NSNumber numberWithInt:77]];
    [array addObject:[NSNumber numberWithInt:59]];
    [array addObject:[NSNumber numberWithInt:86]];
    [array addObject:[NSNumber numberWithInt:68]];
    [array addObject:[NSNumber numberWithInt:51]];
    NSLog(@"Before sort : %@", [array description]);
    
    BOOL ascending = YES;
    
    [array sortUsingFunction:numericalSortFn context:&ascending];
    
    NSLog(@"After sort : %@", [array description]);
    
    ascending = NO;
    [array sortUsingFunction:numericalSortFn context:&ascending];
    
    NSLog(@"After sort : %@", [array description]);
    NSLog(@"After sort : %@", array);
    
}

NSInteger numericalSortFn(id obj1, id obj2, void* ascendingFlag) {
    int val1 = [obj1 intValue];
    int val2 = [obj2 intValue];
    if (val1 == val2)
        return NSOrderedSame;
    
    if (*(BOOL*)ascendingFlag) {
        return (val1 <val2) ? NSOrderedAscending : NSOrderedDescending;
    }
    else {
        return (val1 < val2) ? NSOrderedDescending : NSOrderedAscending;
    }
}
@end
