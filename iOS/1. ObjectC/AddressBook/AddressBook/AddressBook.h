//
//  AddressBook.h
//  AddressBook
//
//  Created by bogon on 2016. 12. 20..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AddressCard;

@interface AddressBook : NSObject

@property (nonatomic, copy)NSString *bookName;
@property (nonatomic, strong)NSMutableArray *book;

-(instancetype) initWithName:(NSString*)name;
-(void) addCard:(AddressCard *)theCard;
-(int)entries;
-(void)list;

-(AddressCard*) lookUp:(NSString *)theName;
-(BOOL) removeCard:(AddressCard *)theCard;
-(void) sortBySelector;
-(void) sortByBlock;
@end
