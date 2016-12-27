//
//  Fraction.h
//  ProgrammingInObjectiveC
//
//  Created by bogon on 2016. 12. 27..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark Chapter 7
@interface FractionClass : NSObject

@property int numerator, denominator;

-(void) print;
//-(void) setNumerator:(int) n;
//-(void) setDenominator:(int) d;
//-(int) numerator;
//-(int) denominator;
-(void) setTo: (int) n over: (int) d;
-(double) convertToNum;
-(FractionClass *) add:(FractionClass *) f;
-(void) reduce;
@end
