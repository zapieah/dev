//
//  FruitBasket.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 13..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "FruitBasket.h"

@implementation FruitBasket

-(instancetype) init {
    NSLog(@"FruitBasket init");
    if (self = [super init]) {
        NSLog(@"FruitBasket init 2");
        fruits = [[NSArray alloc] initWithObjects:@"Apple",@"Orange", @"Banana", @"Kiwi", @"Pear", nil];
    }
    return self;
}


//use ARC
//-(void) dealloc {
//    [fruits release];
//    [super dealloc];
//}

-(int) numberOfRowsInTable {
    NSLog(@"FruitBasket numberOfRowsInTable %ld", [fruits count]);
    return (int)[fruits count];
}

-(NSString*) stringForRawAtIndex:(int)index {
    NSLog(@"FruitBasket stringForRawAtIndex");
    return (NSString*)[fruits objectAtIndex:index];
}

//optional method
-(NSString*) tableTitle {
    return @"Available Fruits";
}

//optional method
-(BOOL) printLineNumbers {
    return YES;
}

@end
