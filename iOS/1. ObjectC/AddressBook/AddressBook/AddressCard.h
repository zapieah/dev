//
//  AddressCard.h
//  AddressBook
//
//  Created by bogon on 2016. 12. 20..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressCard : NSObject

//-(void) setName:(NSString *) theName;
//-(void) setEmail:(NSString *) theEmail;
//-(NSString *) name;
//-(NSString *) email;

//@property (copy, nonatomic) NSString *name, *email;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *email;

-(void) setName:(NSString *)theName andEmail:(NSString*) theEmail;
-(void) print;
-(NSComparisonResult) compareNames:(id) element;
@end
