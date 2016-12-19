//
//  TestNSThread.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 15..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestNSThread.h"

NSString *notification = @"TestNSThread_E1";

@interface TestNSThread()

//private member method;
-(void) doWork;
-(void) workerHandler:(NSNotification *)notif;

@end

@implementation TestNSThread
{
    bool flagThread1;
    bool flagThread2;
}

-(instancetype) init {
    NSLog(@"TestNSThread init");
    if (self = [super init]) {
        thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(threadFunction1) object:@"NSThread"];
        thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(threadFunction2) object:@"NSThread"];
        flagThread1 = false;
        flagThread2 = false;

    }
    return self;
}

-(void) threadFunction1 {
    NSLog(@"threadFunction1");
    while (flagThread1) {
        NSLog(@"thread1Function1 loop");
        [NSThread sleepForTimeInterval:1];
    }
}

-(void) threadFunction2 {
    NSLog(@"threadFunction2");
    while (flagThread2) {
        NSLog(@"thread1Function2 loop");
        [NSThread sleepForTimeInterval:1];
    }
}

-(void) startNSThread_1 {
    NSLog(@"startNSThread_1");
    if (thread1 != nil) {
        flagThread1 = true;
        [thread1 start];
    }
    else
        NSLog(@"thread1 nil");
    
}
-(void) stopNSThread_1 {
    NSLog(@"stopNSThread_1");
    flagThread1 = false;
    [thread1 cancel];
}

-(void) startNSThread_2 {
    NSLog(@"startNSTHread_2");
    if (thread2 != nil) {
        flagThread2 = true;
        [thread2 start];
    }
    else
        NSLog(@"thread2 nil");
}
-(void) stopNSThread_2 {
    NSLog(@"stopNSThread_2");
    flagThread2 = false;
    [thread2 cancel];
}

-(void) startThreadAndAutoFinish {
    NSLog(@"startThreadAndAutoFinish");
    workerThread = [[NSThread alloc] initWithTarget:self selector:@selector(doWork) object:nil];
    
    //addObserver -> 어느 객체가 받을 것인가?
    //selector -> 해당 객체의 어느 method로 전달할 것인가?
    //name -> 어떤 문자를 전달할 것인가?
    //object -> 어떤 이벤트 문자열을 감시할 것인가? nil은 all
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(workerHandler:) name:notification object:nil];
    
    
    [workerThread start];
    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds*NSEC_PER_SEC));

    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        // Cancel after timeoutSeconds seconds if not finished yet
        NSLog(@"WorkerThread cancel");
        if (![workerThread isCancelled]) {
            [workerThread cancel];
        }
    });
    
}

-(void) doWork {
    NSLog(@"doWork");
    // Do something heavy...
    
    for (int i = 0; i < 5; i++) {
        NSLog(@"thread1Function1 loop");
        [NSThread sleepForTimeInterval:1];
    }
    
    id result = [NSObject new];

    //object -> userdata ->  userInfo:[NSDictionary dictionaryWithObject:@”value1” forKey:@”data1”];
    [[NSNotificationCenter defaultCenter] postNotificationName:notification object:self];
}


-(void) workerHandler:(NSNotification *)notif {
    NSLog(@"workerHandler");
    id result = (id) [notif object];
    
    // do something with result...
    NSLog(@"%@", [notif name]);
    
    [workerThread cancel];
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:notification object:nil];
}

@end
