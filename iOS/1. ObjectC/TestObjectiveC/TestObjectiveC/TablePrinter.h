//
//  TablePrinter.h
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 13..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TablePrinterDataSource;

@interface TablePrinter : NSObject
{
    //id <TablePrinterDataSource> dataSource;
}

@property(nonatomic, assign, setter=setDataSource:) id <TablePrinterDataSource> dataSource;
-(void) printTable;
//-(void) setDataSource : (id <TablePrinterDataSource>) newDataSource;
@end
