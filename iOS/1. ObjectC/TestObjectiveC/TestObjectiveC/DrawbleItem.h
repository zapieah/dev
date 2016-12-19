//
//  DrawbleItem.h
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 13..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol

//@required : default
-(void) drawItem;

//-(NSRect) boundingBox;
//-(NSColor*) color;
//-(void) setColor:(NSColor*) color;
//replace to below
@property (nonatomic, readonly) NSRect boundingBox;
@property (nonatomic, retain) NSColor color;


@optional
-(NSString) labelText;
//Why not error????
@property (nonatomic, retain) NSColor color2;

@end
