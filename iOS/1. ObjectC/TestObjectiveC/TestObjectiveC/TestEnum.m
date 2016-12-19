//
//  TestEnum.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 13..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestEnum.h"

@implementation TestEnum


//old style
enum {
    UITableViewCellStyleDefault,
    UITableViewCellStyleValue1,
    UITableViewCellStyleValue2,
    UITableViewCellStyleSubtitle
};
typedef NSInteger UITableViewCellStyle;
//old style
enum {
    UIViewAutoresizingNone                 = 0,
    UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
    UIViewAutoresizingFlexibleWidth        = 1 << 1,
    UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
    UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
    UIViewAutoresizingFlexibleHeight       = 1 << 4,
    UIViewAutoresizingFlexibleBottomMargin = 1 << 5
};
typedef NSUInteger UIViewAutoresizing;


//new style
typedef NS_ENUM(NSInteger, UITableViewCellStyle2) {
    UITableViewCellStyleDefault2,
    UITableViewCellStyleValue12,
    UITableViewCellStyleValue22,
    UITableViewCellStyleSubtitle2
};
//new style
typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing2) {
    UIViewAutoresizingNone2                 = 0,
    UIViewAutoresizingFlexibleLeftMargin2   = 1 << 0,
    UIViewAutoresizingFlexibleWidth2        = 1 << 1,
    UIViewAutoresizingFlexibleRightMargin2  = 1 << 2,
    UIViewAutoresizingFlexibleTopMargin2    = 1 << 3,
    UIViewAutoresizingFlexibleHeight2       = 1 << 4,
    UIViewAutoresizingFlexibleBottomMargin2 = 1 << 5
};

-(void) testEnum {
    NSLog(@"testEnum");
}
@end
