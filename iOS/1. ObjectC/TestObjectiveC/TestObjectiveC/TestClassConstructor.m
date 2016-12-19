//
//  TestClassConstructor.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 6..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestClassConstructor.h"

@implementation TestClassConstructor

-(id) init {
    self = [super init];
    if (self != nil) {
        self->x = 10;
        self->y = 20;
        return self;
    }
    return nil;
}

-(id) initWithXY:(int)x:(int)y {
    self = [super init];
    if (self != nil) {
        self->x = x;
        self->y = y;
        return self;
    }
    return nil;
}
-(int) getX {
    return x;
}

-(int) getY {
    return y;
}
@end
