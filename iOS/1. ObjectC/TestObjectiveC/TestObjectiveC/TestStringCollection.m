//
//  StringCollection.m
//  TestSelector
//
//  Created by bogon on 2016. 12. 2..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestStringCollection.h"

@implementation TestStringCollection

-(void) test
{
    NSString *str1 = @"This is string A";
    NSString *str2 = @"This is string B";
    NSString *res;
    NSRange subRange;
    
    res = [str1 substringToIndex:3];
    NSLog(@"First 3 chars of str1 : %@", res);
    
    res = [str1 substringFromIndex:5];
    NSLog(@"Chars from index 5 of str1 : %@", res);

    res = [[str1 substringFromIndex:8] substringToIndex:6];
    NSLog(@"chars form index 8 length 6 : %@", res);

    res = [str1 substringWithRange:NSMakeRange(8, 6)];
    NSLog(@"chars form index 8 length 6 : %@", res);
    
    subRange = [str1 rangeOfString:@"string "];
    NSLog(@"Strin is at index %li, lenth is %li", subRange.location, subRange.length);
    
    subRange = [str1 rangeOfString:@"string B"];
    
    if (subRange.location == NSNotFound)
        NSLog(@"String is not found");
    else
        NSLog(@"String is at index %lu, length is %lu", subRange.location,subRange.length);
    
    
//    Search/ Replace
//    *search = @"a";
//    
//    *replace = @"aX";
//    
//    substr = [mstr rangeOfString:search];
//    
//    while (substr.location != NSNotFound) {
//        
//        [mstr replaceCharactersInRange:substr withString:replace];
//        
//        substr = [mstr rangeOfString:search];
//        
//        NSLog(@"%@", mstr);

}
@end
