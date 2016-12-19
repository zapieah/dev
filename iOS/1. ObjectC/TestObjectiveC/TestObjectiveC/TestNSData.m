//
//  TestNSData.m
//  TestSelector
//
//  Created by bogon on 2016. 12. 5..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestNSData.h"

@implementation TestNSData

-(void) test {
    
    NSMutableData *data = [[NSMutableData alloc]init];
    char byte_chars[3] = {0x03, 0x04, 0x05};
    [data appendBytes:byte_chars length:3];

    NSLog(@"%@", data);
    data = nil;
    NSLog(@"%@", data);
}
@end
