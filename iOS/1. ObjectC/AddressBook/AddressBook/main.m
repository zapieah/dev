//
//  main.m
//  AddressBook
//
//  Created by bogon on 2016. 12. 20..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"
#import "AddressBook.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSString *aName = @"DD";
        NSString *aEmail = @"dd@dd";
        
        AddressCard *card1 = [[AddressCard alloc]init];
        
        [card1 setName:aName];
        [card1 setEmail:aEmail];
        [card1 print];
        
        AddressCard *card2 = [[AddressCard alloc]init];
        [card2 setName:@"CC"];
        [card2 setEmail:@"cc@cc"];
        [card2 print];
        
        AddressCard *card3 = [[AddressCard alloc]init];
        [card3 setName:@"BB"];
        [card3 setEmail:@"bb@bb"];
        [card3 print];

        AddressCard *card4 = [[AddressCard alloc]init];
        [card4 setName:@"AA"];
        [card4 setEmail:@"aa@aa"];
        [card4 print];

        AddressBook *myBook = [[AddressBook alloc]initWithName:@"bgjun's book"];
        [myBook addCard:card1];
        [myBook addCard:card2];
        [myBook addCard:card3];
        [myBook addCard:card4];
        [myBook entries];
        [myBook list];
        AddressCard *card = [myBook lookUp:@"AA"];
        if (card != nil)
            NSLog(@"%@", card);
        else
            NSLog(@"not found");
        card = [myBook lookUp:@"CC"];
        if (card != nil)
            NSLog(@"%@", card);
        else
            NSLog(@"not found");

        [myBook sortBySelector];
        [myBook list];

        [myBook sortByBlock];
        [myBook list];
        
        [myBook removeCard:card1];

    }
    return 0;
}
