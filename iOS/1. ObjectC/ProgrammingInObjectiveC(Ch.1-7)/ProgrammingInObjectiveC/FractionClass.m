//
//  Fraction.m
//  ProgrammingInObjectiveC
//
//  Created by bogon on 2016. 12. 27..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "FractionClass.h"

#pragma mark Chapter 7
@implementation FractionClass
//@synthesize numerator, denominator;
//{
//    int numerator;
//    int denominator;
//}

-(void) print {
    NSLog(@"%i/%i", _numerator, _denominator);
}

//-(void) setNumerator:(int) n {
//    numerator = n;
//}
//-(void) setDenominator:(int) d {
//    denominator = d;
//}
//-(int) numerator {
//    return numerator;
//}
//-(int) denominator {
//    return denominator;
//}
-(double) convertToNum {
    if (_denominator != 0)
        return (double)_numerator / _denominator;
    else
        return NAN;
}
-(void) setTo: (int) n over: (int) d {
    _numerator = n;
    _denominator = d;
}
-(FractionClass *) add:(FractionClass *) f {
//    _numerator = _numerator * f.denominator + _denominator * f.numerator;
//    _denominator = _denominator * f.denominator;
//    [self reduce];
    FractionClass *result = [[FractionClass alloc]init];
    result.numerator = _numerator * f.denominator + _denominator * f.numerator;
    result.denominator = _denominator * f.denominator;
    [result reduce];
    return result;
}
-(void) reduce {
    int u = _numerator;
    int v = _denominator;
    int temp;
    while (v != 0) {
        temp = u % v;
        u = v;
        v = temp;
    }
    _numerator /= u;
    _denominator /= u;
}
@end
