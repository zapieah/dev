//
//  TestMutableArray.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 14..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestMutableArray.h"

extern const NSString *notification;

@implementation TestMutableArray

-(instancetype) init {
    NSLog(@"TestMutablaArray init");
    if (self = [super init]) {
        if (mutableArray == nil)
            mutableArray = [[NSMutableArray alloc]init];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(terMutableArrayHandler:) name:notification object:nil];
    }
    return self;
}

-(void) addObjectToMutablaArray {
    NSLog(@"TestMutablaArray addObjectToMutablaArray");
    NSString* str = @"One";
    [mutableArray addObject:str];
    str = @"Two";
    [mutableArray addObject:str];
    str = @"Three";
    [mutableArray addObject:str];
    str = @"Four";
    [mutableArray addObject:str];
    str = @"Five";
    [mutableArray addObject:str];
}

-(void) removeObjectInMutableArray:(int)idx {
    NSLog(@"TestMutablaArray removeObjectInMutableArray %d", idx);
    if (idx >= [mutableArray count] || idx < 0)
        NSLog(@"Range over");
    else
        [mutableArray removeObjectAtIndex:idx];
}

-(void) removeAllObjectInMutableArray {
    NSLog(@"TestMutablaArray removeAllObjectInMutableArray");
    for (int i = 0; i < [mutableArray count]; i++)
         [self removeObjectInMutableArray:i];
    
    [mutableArray removeAllObjects];
}

-(void) testMutableArray {
    NSLog(@"TestMutablaArray testMutableArray");
    for (NSString* str in mutableArray)
        NSLog(@"%@", str);
}

-(void) testMutableArray2 {
    NSLog(@"TestMutablaArray testMutableArray2");
    for (int idx = 0; idx < [mutableArray count]; idx++)
        NSLog(@"idx = %d, %@", idx, [mutableArray objectAtIndex:idx] );
}

-(void) dealloc {
    NSLog(@"TestMutablaArray delloc");
    if (mutableArray != nil) {
        [self removeAllObjectInMutableArray];
        mutableArray = nil;
    }
}

-(void) terMutableArrayHandler:(NSNotification *)notif {
    NSLog(@"terMutableArrayHandler");
    id result = (id) [notif object];
    // do something with result...
    
}
@end
