//
//  TestSelf.m
//  TestSelector
//
//  Created by bogon on 2016. 12. 6..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestSelf.h"

@implementation TestSelf

-(void)setPoint:(int)ptx :(int)pty {
    self->x = ptx;
    self->y = pty;
    NSLog(@"ptx = %d, pty = %d", self->x, self->y);
    NSLog(@"ptx = %d, pty = %d", x, y);
    x = 10;
    y = 20;
    NSLog(@"ptx = %d, pty = %d", self->x, self->y);
    NSLog(@"ptx = %d, pty = %d", x, y);
}
-(int)getX {
    NSLog(@"getX = %d", x);
    return x;
}
-(int)getY {
    NSLog(@"getY = %d", y);
    return y;
}
-(void)callMethodHello {
    NSLog(@"callMethodHello");
    [self hello];
}

-(void)hello {
    NSLog(@"hello");
    NSLog(@"ptx = %d, pty = %d", x, y);
}

@end
