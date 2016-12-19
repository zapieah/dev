//
//  TestBlock.h
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 6..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestBlock : NSObject
{
    void (^loggingBlock)(void);
}
-(void) testBlock1;
-(void) testBlock2;
-(void) testBlock3;
-(void) testBlock4;
-(void) testBlock5;
-(void) testBlockArgument;
-(void) testBlockVariable;
@end
