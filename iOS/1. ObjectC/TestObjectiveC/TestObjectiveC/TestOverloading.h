//
//  TestOverloading.h
//  TestSelector
//
//  Created by bogon on 2016. 12. 5..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestOverloading : NSObject

-(void) testOverloading;

-(void) testOverloading:(int)number;

//Error
//-(void) testOverloading:(NSString *)string;

-(void) testOverloading:(int)number index:(int)idx;

-(void) testOverloading:(int)number index:(int)idx position:(int)pos;


@end
