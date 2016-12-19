//
//  TestClass.h
//  TestSelector
//
//  Created by bogon on 2016. 12. 6..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestClass : NSObject
{
    int a;
    int z;
}
//method name -> testNonArg
-(void)testNonArg;

//method name -> testNonArg:
-(void)testOneArg:(int)v;

//method name -> testNonArg: another:
-(void)testTwoArg:(int)v another:(int)x;

+(void)classMethod;

@end
