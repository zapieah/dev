//
//  TestProperty.h
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 8..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestProperty : NSObject

//property prototype
//@property (<attributes>) <type> <name>;
@property (nonatomic, copy) NSString *name;

//readonly(getter), readwrite(default)(setter/getter)
//setter = <setter name:>, getter = <getter name>
@property (getter=getOtherName) NSString *name2;

//nonatomic(better performance), atomic(default)(synchronize)

//weak, unsafe_unretained, strong(default)

//retain, copy, assign

@end
