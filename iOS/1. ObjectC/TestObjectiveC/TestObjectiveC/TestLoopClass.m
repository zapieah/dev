//
//  TestLoopClass.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 12..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestLoopClass.h"

@implementation TestLoopClass


-(void) testNormalForLoop {
    NSLog(@"testNormalForLoop");
    
    for (int i = 0; i < 3; i++) {
        NSLog(@"testNormalForLoop %d",i);
    }
}

-(void) testImplicitLoog {
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:@"Hello"];
    [array makeObjectsPerformSelector:@selector(count)];
}

-(void) testNormalWhileLoop {
    NSLog(@"testNormalForLoop");
    int i = 0;
    while (i < 3) {
        NSLog(@"testNormalWhileLoop %d", i++);
    }
    
}

-(void) testEnumWhileLoop {
//    NSEnumerator *enum = [obj objectEnumerator];
//    
//    while(objtype = [obj nextObject]) {
//        blahblah
//    }
}

-(void) testForinLoop {
//    testclass[3]
//    for (id i in testclass) {
//        statements;
//    }
}
@end
