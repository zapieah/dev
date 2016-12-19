//
//  CopyObject.m
//  TestSelector
//
//  Created by bogon on 2016. 12. 5..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestCopyObject.h"

@implementation TestCopyObject

-(void) test {
    
    NSMutableArray *dataArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
    NSMutableArray *dataArray2;
    
    dataArray2 = dataArray;
    
    NSLog(@"dataArray2 = %x",(unsigned int)dataArray2);
    NSLog(@"dataArray1 = %x",(unsigned int)dataArray);
    
    [dataArray2 removeObjectAtIndex:0];
    
    NSLog(@"dataArray : ");
    
    for (NSString *item in dataArray) {
        NSLog(@"%@", item);
    }
    for (NSString *item in dataArray2) {
        NSLog(@"%@", item);
    }
    
    dataArray2 = [dataArray mutableCopy];

    NSLog(@"dataArray2 = %x",(unsigned int)dataArray2);
    NSLog(@"dataArray1 = %x",(unsigned int)dataArray);
    [dataArray2 removeObjectAtIndex:0];
    
    for (NSString *item in dataArray) {
        NSLog(@"%@", item);
    }
    for (NSString *item in dataArray2) {
        NSLog(@"%@", item);
    }

    
}
-(void) test2 {
    
    NSMutableArray *dataArray = [NSMutableArray arrayWithObjects:@"One",@"Two",@"Three", nil];
    NSMutableArray *dataArray2;
    
    NSMutableString *mStr;
    
//    dataArray2 = dataArray;
    
//    NSLog(@"dataArray2 = %x",(unsigned int)dataArray2);
//    NSLog(@"dataArray1 = %x",(unsigned int)dataArray);
//    
//    [dataArray2 removeObjectAtIndex:0];
    
    NSLog(@"dataArray : ");
    
    for (NSString *item in dataArray) {
        NSLog(@"%@", item);
    }
    dataArray2 = [dataArray mutableCopy];
    
    mStr = [dataArray objectAtIndex:0];

    NSLog(@"mStr = %x",(unsigned int)mStr);
    NSLog(@"dataArray1 = %x",(unsigned int)[dataArray objectAtIndex:0]);
    NSLog(@"mStr = %@",mStr);
    
    //[mStr appendString:@"H"];
    
    NSLog(@"dataArray1 = %x",(unsigned int)dataArray);
    for (NSString *item in dataArray) {
        NSLog(@"%@", item);
    }
    NSLog(@"dataArray2 = %x",(unsigned int)dataArray2);
    for (NSString *item in dataArray2) {
        NSLog(@"%@", item);
    }

    
}

@end
