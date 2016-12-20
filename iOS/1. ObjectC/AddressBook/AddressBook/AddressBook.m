//
//  AddressBook.m
//  AddressBook
//
//  Created by bogon on 2016. 12. 20..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "AddressBook.h"
#import "AddressCard.h"


//@interface AddressBook()
//-(NSComparisonResult) compareNames:(id) element;
//@end

@implementation AddressBook

-(instancetype) initWithName:(NSString*)name {
    self = [super init];
    if (self) {
        _bookName = [NSString stringWithString:name];
        _book = [NSMutableArray array];
    }
    return self;
}

-(instancetype) init {
    return [self initWithName:@"NoName"];
}

-(void) addCard:(AddressCard *)theCard {
    [_book addObject:theCard];
}
-(int)entries {
    return (int)[_book count];
}
-(void)list {
    NSLog(@"%@", [self bookName]);
    for (AddressCard *theCard in _book)
        NSLog(@"%s, %s", [theCard.name UTF8String], [theCard.email UTF8String]);
}
-(AddressCard*) lookUp:(NSString *)theName {
    for (AddressCard *nextCard in _book) {
        if ([nextCard.name caseInsensitiveCompare:theName] == NSOrderedSame) {
            NSLog(@"search : %@, %@", [nextCard name], [nextCard email]);
            return nextCard;
        }
    }
    return nil;
}
-(BOOL) removeCard:(AddressCard *)theCard {
    if (_book != nil) {
        NSLog(@"before count %d", (int)[_book count]);
        [_book removeObjectIdenticalTo:theCard];
        NSLog(@"after count %d", (int)[_book count]);
        return YES;
    }
    return NO;
}

-(void) sortBySelector {
    if (_book != nil && [_book count] > 1) {
        SEL sCompare = @selector(compareNames:);
        if ([[_book objectAtIndex:0] respondsToSelector:sCompare] == YES) {
            [_book sortUsingSelector:sCompare];
        }
    }
}

-(void) sortByBlock {
    if (_book != nil && [_book count] > 1) {
        [_book sortUsingComparator:^(id obj1, id obj2) {
            return [[obj1 name] compare:[obj2 name]];
        }];
    }
}
@end
