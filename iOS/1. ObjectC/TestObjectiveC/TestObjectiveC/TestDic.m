//
//  TestDic.m
//  TestSelector
//
//  Created by bogon on 2016. 12. 2..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestDic.h"

@implementation TestDic

-(void) test
{
    NSDictionary *glossary = [NSDictionary dictionaryWithObjectsAndKeys:@"Apple", @"Apple INC", @"Windows Mobile", @"MicroSoft", @"Android", @"Samsung", nil];
    for (NSString *key in glossary) {
        
        NSLog(@"%@ : %@", key, key);
        
    }

    for (NSString *key in glossary) {
        
        NSLog(@"%@ : %@", key, [glossary objectForKey:key]);
        
    }
    NSArray *keys = [glossary allKeys];
    
    keys = [keys sortedArrayUsingComparator:^(id o1, id o2){
        return [o1 compare: o2];
    }];
    
    
    keys = [keys sortedArrayUsingComparator:^(id obj1, id obj2) {
        
        return [obj1 compare: obj2];
        
    } ];
    
    for (NSString *aState in keys) {
        
        NSLog(@"company: %@ platform: %@", aState, [glossary objectForKey:aState]);
        
    }
    



}
@end
