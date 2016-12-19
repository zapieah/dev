//
//  TestClassConstructor.h
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 6..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestClassConstructor : NSObject
{
    int x;
    int y;
}

-(id) init;

-(id) initWithXY:(int)x:(int)y;

-(int) getX;

-(int) getY;

@end
