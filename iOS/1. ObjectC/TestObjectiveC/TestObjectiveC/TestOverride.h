//
//  TestOverride.h
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 6..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestOverride : NSObject
-(void)testMethod;
@end

@interface TestOverride2 : TestOverride
-(void)testMethod;
-(void)callSupertestMethod;
@end
