//
//  TablePrinter.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 13..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TablePrinter.h"
#import "TablePrinterDataSource.h"



@implementation TablePrinter


//@synthesize dataSource;

-(void) printTable {
    NSString *separator = @"--------------------------";
    NSString *title = @"Table";
    
    if ([_dataSource respondsToSelector:@selector(tableTitle)]) {
        NSLog(@"yes tableTitle");
        title = [_dataSource tableTitle];
    }
    else {
        NSLog(@"no tableTitle");
    }
    printf("\ntitle = %s\n%s\n", [title UTF8String], [separator UTF8String]);
    int numRows = [_dataSource numberOfRowsInTable];
    NSLog(@"numRows = %d", numRows);
    int j;
    BOOL printLineNumbers = NO;
    
    if ([_dataSource respondsToSelector:@selector(printLineNumbers)]){
        NSLog(@"yes printLineNumbers");
        printLineNumbers = [_dataSource printLineNumbers];
    }
    else {
        NSLog(@"no printLineNumbers");
    }
    
    for (j = 0; j < numRows; j++) {
        NSString *outputString = [_dataSource stringForRawAtIndex:j];
        if (printLineNumbers) {
            printf("outputString = %d | %s\n", j + 1, [outputString UTF8String]);
        }
        else {
            printf("outputString = %s\n", [outputString UTF8String]);
        }
    }
}

-(void) setDataSource : (id <TablePrinterDataSource>) newDataSource {
    if (![newDataSource conformsToProtocol:@protocol(TablePrinterDataSource)]) {
        _dataSource = nil;
        NSLog(@"TablePrinter: non-conforming data source");
    }
    else {
        _dataSource = newDataSource;
    }
}

@end
