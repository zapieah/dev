//
//  AddressCard.m
//  AddressBook
//
//  Created by bogon on 2016. 12. 20..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "AddressCard.h"
@implementation AddressCard
{
    NSString *name;
    NSString *email;
}

-(void) setName:(NSString *) theName {
    if (name != theName)
        name = [NSString stringWithString:theName];
}
-(void) setEmail:(NSString *) theEmail {
    if (email != theEmail)
        email = [NSString stringWithString:theEmail];
}
-(NSString *) name {
    return name;
}
-(NSString *) email {
    return email;
}

-(void) setName:(NSString *)theName andEmail:(NSString*) theEmail {
//    name = theName;
//    email = theEmail;

//    [self setName:theName];
//    [self setEmail:theEmail];

    self.name = theName;
    self.email = theEmail;
}
-(void) print {
    NSLog(@" %-31s |", [name UTF8String]);
    NSLog(@" %-31s |", [email UTF8String]);
    
}

-(NSComparisonResult) compareNames:(id) element {
    //NSComparisonResult result= [name compare:[element name]];
    NSComparisonResult result= [[element name] compare:name];
    NSLog(@"name = %@, ele name =%@, result = %ld",name, [element name], result);
    return result;
}

@end
