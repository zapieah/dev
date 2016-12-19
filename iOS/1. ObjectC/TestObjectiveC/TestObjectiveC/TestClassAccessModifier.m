//
//  TestClassAccessModifier.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 6..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestClassAccessModifier.h"

@implementation TestClassAccessModifier
-(id) init {
    self = [super init];
    if (self != nil) {
        self->defaultValue = 10;
        self->publicValue = 20;
        self->protectedValue = 30;
        self->privateValue = 40;
        return self;
    }
    return nil;
}
@end
