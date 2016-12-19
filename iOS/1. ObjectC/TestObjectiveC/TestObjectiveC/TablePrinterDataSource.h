//
//  TablePrinterDataSource.h
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 13..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TablePrinterDataSource <NSObject>

@required
-(NSString*) stringForRawAtIndex:(int) index;
-(int) numberOfRowsInTable;

@optional
-(NSString*)tableTitle;
-(BOOL) printLineNumbers;

@end
