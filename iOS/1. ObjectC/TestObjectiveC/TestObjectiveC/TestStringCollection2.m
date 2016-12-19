//
//  StringCollection2.m
//  TestSelector
//
//  Created by bogon on 2016. 12. 2..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestStringCollection2.h"

@implementation TestStringCollection2

-(void) test
{
    NSMutableArray *numbers = [NSMutableArray array];
    NSNumber * myNumber;
    
    int i;
    
    for (i = 0; i < 10; ++i) {
        myNumber = [NSNumber numberWithInt:i];
        [numbers addObject:myNumber];
    }
    
    for (i = 0; i < 10; ++i) {
        myNumber = [numbers objectAtIndex:i];
        NSLog(@"%@", myNumber);
    }
    
    NSLog(@"====== Using a single NSLog");
    
    NSLog(@"%@", numbers);

}
@end
