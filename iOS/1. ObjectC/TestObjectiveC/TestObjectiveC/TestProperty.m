//
//  TestProperty.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 8..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestProperty.h"

@implementation TestProperty

-(NSString *) getOtherName {
    //Error
    //return [self name2];
    
    
    
    return self->_name2;
    //or
    //return _name2;
}

@end
