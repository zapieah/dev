//
//  TestProperty2.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 12..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestProperty2.h"


@interface TestProperty2()
@property (nonatomic, readwrite)int employeeNumber;
@end

@implementation TestProperty2

-(void) setInternalVariable {
    self->name = @"Hello";
    self->salary = 1000;
    NSLog(@"name %@ salary %d",name, salary);
    self->employeeNumber = 1000;
}

-(void) setPropertyVariable {
    [self setName:@"JUN"];
    [self setEmployeeNumber:88];
    [self setSalary:88];
}

-(void) testSetVariable {
    self.name = @"hhhh";
    self.employeeNumber = 333;
    self.salary = 333;
    NSLog(@"name %@ salary %d",name, salary);
    NSLog(@"name %@ salary %d",self.name, self.salary);
}

@end
