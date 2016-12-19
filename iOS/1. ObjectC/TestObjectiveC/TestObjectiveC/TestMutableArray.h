//
//  TestMutableArray.h
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 14..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestMutableArray : NSObject
{
    NSMutableArray *mutableArray;
}
-(void) addObjectToMutablaArray;
-(void) testMutableArray;
-(void) testMutableArray2;
-(void) removeObjectInMutableArray:(int) idx;
-(void) removeAllObjectInMutableArray;
@end
