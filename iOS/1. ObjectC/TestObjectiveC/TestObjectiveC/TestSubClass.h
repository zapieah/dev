//
//  TestSubClass.h
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 6..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestSubClass : NSObject
-(void)printTest;
@end

@interface TestSubClass2 :TestSubClass
-(void)printTest2;
@end
