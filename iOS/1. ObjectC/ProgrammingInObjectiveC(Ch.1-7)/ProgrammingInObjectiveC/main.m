//
//  main.m
//  ProgrammingInObjectiveC
//
//  Created by bogon on 2016. 12. 27..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FractionClass.h"


#pragma mark Chapter 3
@interface Fraction: NSObject
-(void) print;
-(void) setNumerator: (int) n;
-(void) setDenominator: (int) d;
-(int) numerator;
-(int) denominator;
#pragma Chapter 6
-(double) convertToNum;
@end
@implementation Fraction {
    int numerator;
    int denominator;
}
-(void) print {
    NSLog (@"%i/%i", numerator, denominator);
}
-(void) setNumerator: (int) n {
    numerator = n;
}
-(void) setDenominator: (int) d {
    denominator = d;
}
-(int) numerator {
    return numerator;
}
-(int) denominator {
    return denominator;
}
#pragma Chapter 6
-(double) convertToNum {
    if (denominator != 0)
        return (double) numerator / denominator;
    else
        return NAN; //NAN(which stands for Not A Number)
}
@end


#pragma mark Chapter 4
@interface Calculator: NSObject
-(void) setAccumulator: (double) value;
-(void) clear;
-(double) accumulator;
-(void) add: (double) value;
-(void) subtract: (double) value;
-(void) multiply: (double) value;
-(void) divide: (double) value;
@end
@implementation Calculator {
    double accumulator;
}
-(void) setAccumulator: (double) value {
    accumulator = value;
}
-(void) clear {
    accumulator = 0;
}
-(double) accumulator {
    return accumulator;
}
-(void) add: (double) value {
    accumulator += value;
}
-(void) subtract: (double) value {
    accumulator -= value;
}
-(void) multiply: (double) value {
    accumulator *= value;
}
-(void) divide: (double) value {
#if 0
    accumulator /= value;
#endif
#pragma Chapter 6
    if (value != 0.0)
        accumulator /= value;
    else {
        NSLog(@"Devision by zero.");
        accumulator = NAN;
    }
}
@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
#pragma mark Chapter 2
        NSLog(@"Hello, World!");
        NSLog(@"Programming is fun!");
        NSLog(@"Testing...\n..1\n...2\n....3");
        int sum;
        sum = 50 + 25;
        NSLog(@"The sum of 50 and 25 is %i", sum);
        
#pragma mark Chapter 3
        int numerator = 1;
        int denominator = 3;
        NSLog(@"The fraction is %i/%i", numerator, denominator);
        NSLog(@"The fraction is %d/%d", numerator, denominator);
        Fraction *myFraction;
        myFraction = [Fraction alloc];
        myFraction = [myFraction init];
        [myFraction setNumerator: 1];
        [myFraction setDenominator: 3];
        NSLog(@"The value of myFraction is:");
        [myFraction print];
        NSLog(@"The value of myFraction is: %i/%i", [myFraction numerator], [myFraction denominator]);
        Fraction *frac1 = [[Fraction alloc] init];
        Fraction *frac2 = [[Fraction alloc] init];
        [frac1 setNumerator: 2];
        [frac1 setDenominator: 3];
        [frac2 setNumerator: 3];
        [frac2 setDenominator: 7];
        NSLog(@"First fraction is:");
        [frac1 print];
        NSLog(@"Second fraction is:");
        [frac2 print];
        
#pragma mark Chapter 4
        int integerVar = 100;
        float floatingVar = 331.79;
        double doubleVar = 8.44e+11;
        char charVar = 'W';
        NSLog(@"integerVar = %i %d", integerVar, integerVar);
        NSLog(@"floatingVar = %f", floatingVar);
        NSLog(@"doubleVar = %e", doubleVar);
        NSLog(@"doubleVar = %g", doubleVar);
        NSLog(@"doubleVar = %f", doubleVar);
        NSLog(@"charVar = %c", charVar);
        int a = 100;
        int b = 2;
        int c = 25;
        int d = 4;
        int result;
        result = a - b;
        NSLog(@"a - b = %i", result);
        result = b * c;
        NSLog(@"b * c = %i", result);
        result = a / c;
        NSLog(@"a / c = %i", result);
        result = a + b * c;
        NSLog(@"a + b * c = %i", result);
        NSLog(@"a * b + c * d = %i", a * b + c * d);
        int a1 = 25;
        int b1 = 2;
        float c1 = 25.0;
        float d1 = 2.0;
        NSLog(@"6 + a1 / 5 * b1 = %i", 6 + a1 / 5 * b1);
        NSLog(@"a1 / b1 * b1 = %i", a1 / b1 * b1);
        NSLog(@"c1 / d1 * d1 = %f", c1 / d1 * d1);
        NSLog(@"-a1 = %i", -a1);
        int a2 = 25, b2 = 5, c2 = 10, d2 = 7;
        NSLog(@"a2 %% b2 = %i", a2 % b2);
        NSLog(@"a2 %% c2 = %i", a2 % c2);
        NSLog(@"a2 %% d2 = %i", a2 % d2);
        NSLog(@"a2 / d2 * d2 + a2 %% d2 = %i", a2 / d2 * d2 + a2 % d2);
        float f1 = 123.125, f2;
        int i1, i2 = -150;
        i1 = f1;
        NSLog(@"%f assigned to an int produces %i", f1, i1);
        f1 = i2;
        NSLog(@"%i assigned to a float produces %f", i2, f1);
        f1 = i2 / 100;
        f2 = i2 / 100.0;
        f2 = (float) i2 / 100;
        NSLog(@"(float) %i divided by 100 produces %f", i2, f2);
        Calculator *deskCalc = [[Calculator alloc] init];
        [deskCalc setAccumulator: 100.0];
        [deskCalc add: 200.];
        [deskCalc divide: 15.0];
        [deskCalc subtract: 10.0];
        [deskCalc multiply: 5];
        NSLog(@"The result is %g", [deskCalc accumulator]);
        
#pragma mark Chapter 5
        int triangularNumber;
        triangularNumber = 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8;
        NSLog(@"The eighth triangular number is %i", triangularNumber);
        int n2, triangularNumber2;
        triangularNumber2 = 0;
        for (n2 = 1; n2 <= 200; n2 = n2 + 1)
            triangularNumber2 += n2;
        NSLog(@"The 200th triangular number is %i", triangularNumber2);
        int n3, triangularNumber3;
        NSLog(@"TABLE OF TRIANGULAR NUMBERS");
        NSLog(@" n Sum from 1 to n");
        NSLog(@"-- ---------------");
        triangularNumber3 = 0;
        for (n3 = 1; n3 <= 10; ++n3 ) {
            triangularNumber3 += n3;
            NSLog (@" %i       %i", n3, triangularNumber3);
        }
        int n4, number4, triangularNumber4;
        NSLog(@"What triangular number do you want?");
        scanf("%i", &number4);
        triangularNumber4 = 0;
        for (n4 = 1; n4 <= number4; ++n4)
            triangularNumber4 += n4;
        NSLog(@"Triangular number %i is %i\n", number4, triangularNumber4);
        int n5, number5, triangularNumber5, counter5;
        for (counter5 = 1; counter5 <= 5; ++counter5) {
            NSLog(@"What triangular number do you want?");
            scanf("%i", &number5);
            triangularNumber5 = 0;
            for (n5 = 1; n5 <= number5; ++n5)
                triangularNumber5 += n5;
            NSLog(@"Triangular number %i is %i", number5, triangularNumber5);
        }
        int count = 1;
        while (count <= 5) {
            NSLog(@"%i", count);
            ++count;
        }
        unsigned int u, v, temp;
        NSLog(@"Please type in two nonnegative integers.");
        scanf("%u%u", &u, &v);
        while (v != 0) {
            temp = u % v;
            u = v;
            v = temp;
        }
        NSLog(@"Their greatest common divisor is %u", u);
        int number, right_digit;
        NSLog(@"Enter your number.");
        scanf("%i", &number);
        while (number != 0) {
            right_digit = number % 10;
            NSLog (@"%i", right_digit);
            number /= 10;
        }
        int number6, right_digit6;
        NSLog(@"Enter your number.");
        scanf("%i", &number6);
        do {
            right_digit6 = number6 % 10;
            NSLog(@"%i", right_digit6);
            number6 /= 10;
        } while (number6 != 0);
        
#pragma mark Chapter 6
        int number7;
        NSLog(@"Type in your number: ");
        scanf("%i", &number7);
        if (number7 < 0)
            number7 = -number7;
        NSLog(@"The absolute value is %i", number7);
        Fraction *aFraction = [[Fraction alloc] init];
        Fraction *bFraction = [[Fraction alloc] init];
        [aFraction setNumerator: 1];
        [aFraction print];
        NSLog(@" = ");
        NSLog(@"%g", [aFraction convertToNum]);
        [bFraction print];
        NSLog(@"%g", [bFraction convertToNum]);
        int number_to_test, remainder;
        NSLog (@"Enter your number to be tested: ");
        scanf ("%i", &number_to_test);
        remainder = number_to_test % 2;
        if (remainder == 0)
            NSLog (@"The number is even.");
        if (remainder != 0)
            NSLog (@"The number is odd.");
        int number_to_test2, remainder2;
        NSLog(@"Enter your number to be tested:");
        scanf("%i", &number_to_test2);
        remainder2 = number_to_test2 % 2;
        if (remainder2 == 0)
            NSLog (@"The number is even.");
        else
            NSLog (@"The number is odd.");
        int year, rem_4, rem_100, rem_400;
        NSLog(@"Enter the year to be tested: ");
        scanf("%i", &year);
        rem_4 = year % 4;
        rem_100 = year % 100;
        rem_400 = year % 400;
        if ((rem_4 == 0 && rem_100 != 0) || rem_400 == 0)
            NSLog (@"It's a leap year.");
        else
            NSLog (@"Nope, it's not a leap year.");
        int number8, sign8;
        NSLog(@"Please type in a number: ");
        scanf("%i", &number8);
        if (number8 < 0)
            sign8 = -1;
        else if (number == 0)
            sign8 = 0;
        else
            NSLog(@"Sign = %i", sign8);
        char cc;
        NSLog(@"Enter a single character:");
        scanf(" %c", &cc);
        if ((cc >= 'a' && cc <= 'z') || (cc >= 'A' && cc <= 'Z'))
            NSLog(@"It's an alphabetic character.");
        else if (cc >= '0' && cc <= '9')
            NSLog(@"It's a digit.");
        else
            NSLog(@"It's a special character.");
        double value1, value2;
        char operator;
        Calculator *deskCalc2 = [[Calculator alloc] init];
        NSLog(@"Type in your expression.");
        scanf("%lf %c %lf", &value1, &operator, &value2);
        [deskCalc2 setAccumulator: value1];
        if (operator == '+')
            [deskCalc2 add: value2];
        else if (operator == '-')
            [deskCalc2 subtract: value2];
        else if (operator == '*')
            [deskCalc2 multiply: value2];
        else if (operator == '/')
            [deskCalc divide: value2];
        NSLog(@"%.2f", [deskCalc accumulator]);
        double value10, value11;
        char operator10;
        Calculator *deskCalc3 = [[Calculator alloc] init];
        NSLog (@"Type in your expression.");
        scanf ("%lf %c %lf", &value10, &operator10, &value11);
        [deskCalc3 setAccumulator: value10];
        if (operator10 == '+')
            [deskCalc3 add: value11];
        else if (operator10 == '-')
            [deskCalc3 subtract: value11];
        else if (operator10 == '*')
            [deskCalc3 multiply: value11];
        else if (operator10 == '/')
            if (value11 == 0)
                NSLog(@"Division by zero.");
            else
                [deskCalc3 divide: value11];
            else
                NSLog (@"Unknown operator.");
        NSLog (@"%.2f", [deskCalc3 accumulator]);
        double val1, val2;
        char oper;
        Calculator *deskCalc4 = [[Calculator alloc] init];
        NSLog (@"Type in your expression.");
        scanf ("%lf %c %lf", &val1, &oper, &val2);
        [deskCalc4 setAccumulator: val1];
        switch (oper) {
            case '+':
                [deskCalc4 add: val2];
                break;
            case '-':
                [deskCalc4 subtract: val2];
                break;
            case '*':
                [deskCalc4 multiply: val2];
                break;
            case '/':
                [deskCalc4 divide: val2];
                break;
            default:
                NSLog (@"Unknown operator.");
            break; }
        NSLog (@"%.2f", [deskCalc4 accumulator]);
        int p, dd, isPrime;
        for (p = 2; p <= 50; ++p) {
            isPrime = 1;
            for (dd = 2; dd < p; ++dd)
                if (p % dd == 0)
                    isPrime = 0;
            if (isPrime != 0)
                NSLog(@"%i ", p);
        }
        int p3, d3;
        BOOL isPrime3;
        for (p3 = 2; p3 <= 50; ++p3) {
            isPrime3 = YES;
            for (d3 = 2; d3 < p3; ++d3)
                if (p3 % d3 == 0)
                    isPrime3 = NO;
            if (isPrime3 == YES)
                NSLog (@"%i ", p3);
        }
    }
#pragma mark Chapter 7
    FractionClass *myFractionClass = [[FractionClass alloc] init]; // set fraction to 1/3 using the dot operator
    myFractionClass.numerator = 1;
    myFractionClass.denominator = 3;
    // display the FractionClass's numerator and denominator
    NSLog (@"The numerator is %i, and the denominator is %i", myFractionClass.numerator, myFractionClass.denominator);
    FractionClass *aFractionClass = [[FractionClass alloc] init];
    [aFractionClass setTo: 100 over: 200];
    [aFractionClass print];
    [aFractionClass setTo: 1 over: 3];
    [aFractionClass print];
    FractionClass *bFractionClass = [[FractionClass alloc] init];
    FractionClass *cFractionClass = [[FractionClass alloc] init];
    [bFractionClass setTo: 1 over: 4];
    [cFractionClass setTo: 1 over: 2];
    [bFractionClass print];
    NSLog (@"+");
    [cFractionClass print];
    NSLog (@"=");
    [bFractionClass add: cFractionClass];
    [bFractionClass reduce];
    [bFractionClass print];
    FractionClass *resultFraction;
    [bFractionClass setTo: 1 over: 4];
    [cFractionClass setTo: 1 over: 2];
    [bFractionClass print];
    NSLog (@"+");
    [cFractionClass print];
    NSLog (@"=");
    resultFraction = [bFractionClass add: cFractionClass];
    [resultFraction print];
    return 0;
}
