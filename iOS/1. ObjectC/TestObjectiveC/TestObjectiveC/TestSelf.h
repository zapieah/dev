//
//  TestSelf.h
//  TestSelector
//
//  Created by bogon on 2016. 12. 6..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestSelf : NSObject
{
    int x,y;
}
-(void)setPoint:(int)ptx :(int)pty;
-(int)getX;
-(int)getY;
-(void)callMethodHello;
-(void)hello;

@end
