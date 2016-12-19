//
//  TestOverloading.m
//  TestSelector
//
//  Created by bogon on 2016. 12. 5..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestOverloading.h"

@implementation TestOverloading

-(void) testOverloading
{
    NSLog(@"testOverloading");
}

-(void) testOverloading:(int)number
{
    NSLog(@"testOverloading %d", number);
}

//Error
//-(void) testOverloading:(NSString *)string
//{
//    NSLog(@"testOverloading + %@", string);
//}


-(void) testOverloading:(int)number index:(int)idx
{
    NSLog(@"testOverloading %d %d", number, idx);
}

-(void) testOverloading:(int)number index:(int)idx position:(int)pos
{
    NSLog(@"testOverloading %d %d %d", number, idx, pos);
}
@end
