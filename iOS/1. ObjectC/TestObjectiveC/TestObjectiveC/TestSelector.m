//
//  Foo.m
//  TestSelector
//
//  Created by bogon on 2016. 11. 30..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestSelector.h"

@implementation TestSelector
-(void) run {
    NSLog(@"run 1");
    [self performSelector:@selector(echoHello)]; //호출한 main.m에 메서드 이름만 전달 1.
    NSLog(@"run 2");
    NSArray *myArray = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", nil]; //5
    NSLog(@"run 3");
    [self performSelector:@selector(echoNames:) withObject:myArray]; //매서드 echoNames:에 myArray객체 전달 6
    NSLog(@"run 4");
}

- (void) testMe:(id)objectArray nameString:(id)nameString {
    NSLog(@"The Name:%@", nameString);
    NSLog(@"The count of the array:%ld", [objectArray count]);
}

- (void) echoNames:(id)objectArray { //7
    NSLog(@"objectArray 1");
    NSArray *theArray = (NSArray *)objectArray; //8 이 부분 필요 없음(objectArray을 사용하면 됨)
    NSLog(@"objectArray 2");
    for (int i = 0; i < [theArray count]; i++) { //9
        NSLog(@"The Name: %@", [theArray objectAtIndex:i]); //10
    }
}

-(void) testSelector {
    SEL s1 = @selector(testPrint1);
    SEL s2 = @selector(testPrint2:);
    SEL s3 = @selector(testPrint3:z:);
    [self performSelector:s1];
    [self performSelector:s2 withObject:(id)[NSNumber numberWithInt:3]];
    [self performSelector:s3 withObject:(id)[NSNumber numberWithInt:3] withObject:(id)[NSNumber numberWithInt:10]];
}

-(void) testPrint1 {
    NSLog(@"testPrint1");
}

-(void) testPrint2:(NSNumber*)v {
    NSLog(@"testPrint2 v = %d", [v intValue]);
}

-(void) testPrint3:(NSNumber*)v z:(NSNumber*)z {
    NSLog(@"testPrint3 v = %d, z = %d", [v intValue], [z intValue]);
}



- (void) echoHello { //3
    NSLog(@"Hello.....!!!"); //4
}

+ (void) sayHello {
    NSLog(@"Static Hello.....!!!");
}
@end
