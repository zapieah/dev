//
//  FruitBasket.h
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 13..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TablePrinterDataSource.h"

@interface FruitBasket : NSObject <TablePrinterDataSource>
{
    NSArray *fruits;
}
@end
