//
//  TestNSThread.h
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 15..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestNSThread : NSObject
{
    NSThread *thread1;
    NSThread *thread2;
    NSThread *workerThread;
}

-(void) startNSThread_1;
-(void) stopNSThread_1;

-(void) startNSThread_2;
-(void) stopNSThread_2;

-(void) startThreadAndAutoFinish;
@end
