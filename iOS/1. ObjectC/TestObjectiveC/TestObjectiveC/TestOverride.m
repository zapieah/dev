//
//  TestOverride.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 6..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestOverride.h"

@implementation TestOverride
-(void)testMethod {
    NSLog(@"TestOverride testMethod");
}
@end

@implementation TestOverride2
-(void)testMethod {
    NSLog(@"TestOverride2 testMethod");
}

-(void)callSupertestMethod {
    NSLog(@"callSupertestMethod");
    [super testMethod];
}

@end
