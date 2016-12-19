//
//  TestProperty2.h
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 12..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestProperty2 : NSObject
{
    int employeeNumber;
    NSString *name;
    TestProperty2 *supervisor;
    int salary;
}

@property (nonatomic, readonly)int employeeNumber;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) TestProperty2 *supervisor;
@property (nonatomic, assign) int salary;

-(void) setInternalVariable;
-(void) setPropertyVariable;
-(void) testSetVariable;
@end
