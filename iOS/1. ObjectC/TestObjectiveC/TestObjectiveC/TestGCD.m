//
//  TestGCD.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 13..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestGCD.h"

@implementation TestGCD

typedef void (XXX);
- (XXX) testFunc {
    NSLog(@"testFunc");
}

-(instancetype) init {
    NSLog(@"TestGCD init");
    if (self = [super init]) {
        [self createVariousQueue];
    }
    return self;
}
-(void) createVariousQueue {
    NSLog(@"createVariousQueue");
    //1. create new dispatch queue
    //dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr);
    
    //2. get main dispatch queue
    //dispatch_get_main_queue;
    
    //3. get global dispatch queue
    //dispatch_queue_t dispatch_get_global_queue(dispatch_queue_priority_t priority, unsigned long flags);
    
    //create serialQueue
    serialQueue = dispatch_queue_create("com.bogon.serialqueue", DISPATCH_QUEUE_SERIAL);
    
    //create concurrentQueue
    concurrentQueue = dispatch_queue_create("com.bogon.concurrentqueue", DISPATCH_QUEUE_CONCURRENT);
    
    //get mainQueue
    mainQueue = dispatch_get_main_queue();
    
    //get globalQueue
    globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //make dispatchGroup
    dispatchGroup = dispatch_group_create();
}

-(void) addTaskToDispatchSerialSyncQueue {
    NSLog(@"addTaskToDispatchSerialSyncQueue");
    //1. add async task
    //void dispatch_async(dispatch_queue_t queue, dispatch_block_t block);
    //2. add sync task
    //void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block);
    
    dispatch_sync(serialQueue, ^{ NSLog(@"Serial S Call 1"); });
    dispatch_sync(serialQueue, ^{ NSLog(@"Serial S Call 2"); });
    dispatch_sync(serialQueue, ^{ NSLog(@"Serial S Call 3"); });
    dispatch_sync(serialQueue, ^{ NSLog(@"Serial S Call 4"); });
    dispatch_sync(serialQueue, ^{ NSLog(@"Serial S Call 5"); });
    dispatch_sync(serialQueue, ^{ NSLog(@"Serial S Call 6"); });
    dispatch_sync(serialQueue, ^{ NSLog(@"Serial S Call 7"); });
    dispatch_sync(serialQueue, ^{ NSLog(@"Serial S Call 8"); });
    dispatch_sync(serialQueue, ^{ NSLog(@"Serial S Call 9"); });
    dispatch_sync(serialQueue, ^{ NSLog(@"Serial S Call 10"); });
}

-(void) addTaskToDispatchSerialAsyncQueue {
    NSLog(@"addTaskToDispatchSerialAsyncQueue");
    //1. add async task
    //void dispatch_async(dispatch_queue_t queue, dispatch_block_t block);
    //2. add sync task
    //void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block);
    
    dispatch_async(serialQueue, ^{ NSLog(@"Serial AS Call 1"); });
    dispatch_async(serialQueue, ^{ NSLog(@"Serial AS Call 2"); });
    dispatch_async(serialQueue, ^{ NSLog(@"Serial AS Call 3"); });
    dispatch_async(serialQueue, ^{ NSLog(@"Serial AS Call 4"); });
    dispatch_async(serialQueue, ^{ NSLog(@"Serial AS Call 5"); });
    dispatch_async(serialQueue, ^{ NSLog(@"Serial AS Call 6"); });
    dispatch_async(serialQueue, ^{ NSLog(@"Serial AS Call 7"); });
    dispatch_async(serialQueue, ^{ NSLog(@"Serial AS Call 8"); });
    dispatch_async(serialQueue, ^{ NSLog(@"Serial AS Call 9"); });
    dispatch_async(serialQueue, ^{ NSLog(@"Serial AS Call 10"); });
}

-(void) addTaskToDispatchConcurrentSyncQueue {
    NSLog(@"addTaskToDispatchConcurrentSyncQueue");
    //1. add async task
    //void dispatch_async(dispatch_queue_t queue, dispatch_block_t block);
    //2. add sync task
    //void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block);
    
    dispatch_sync(concurrentQueue, ^{ NSLog(@"Concurrent S Call 1"); });
    dispatch_sync(concurrentQueue, ^{ NSLog(@"Concurrent S Call 2"); });
    dispatch_sync(concurrentQueue, ^{ NSLog(@"Concurrent S Call 3"); });
    dispatch_sync(concurrentQueue, ^{ NSLog(@"Concurrent S Call 4"); });
    dispatch_sync(concurrentQueue, ^{ NSLog(@"Concurrent S Call 5"); });
    dispatch_sync(concurrentQueue, ^{ NSLog(@"Concurrent S Call 6"); });
    dispatch_sync(concurrentQueue, ^{ NSLog(@"Concurrent S Call 7"); });
    dispatch_sync(concurrentQueue, ^{ NSLog(@"Concurrent S Call 8"); });
    dispatch_sync(concurrentQueue, ^{ NSLog(@"Concurrent S Call 9"); });
    dispatch_sync(concurrentQueue, ^{ NSLog(@"Concurrent S Call 10"); });
}

-(void) addTaskToDispatchConcurrentAsyncQueue {
    NSLog(@"addTaskToDispatchConcurrentAsyncQueue");
    //1. add async task
    //void dispatch_async(dispatch_queue_t queue, dispatch_block_t block);
    //2. add sync task
    //void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block);
    
    dispatch_async(concurrentQueue, ^{ NSLog(@"Concurrent AS Call 1"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Concurrent AS Call 2"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Concurrent AS Call 3"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Concurrent AS Call 4"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Concurrent AS Call 5"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Concurrent AS Call 6"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Concurrent AS Call 7"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Concurrent AS Call 8"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Concurrent AS Call 9"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Concurrent AS Call 10"); });
}

-(void) controlDispatchQueueAfter {
    NSLog(@"controlDispatchQueueAfter");
    //set dispatch queue priority
    //void dispatch_after(dispatch_time_h when, dispatch_queue_t queue, dispatch_block_t block);
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds*NSEC_PER_SEC));
    dispatch_after(popTime, serialQueue, ^{ NSLog(@"control after Call 1");});
    dispatch_async(serialQueue, ^{ NSLog(@"control after Call 2");});
    dispatch_async(serialQueue, ^{ NSLog(@"control after Call 3");});
    dispatch_async(serialQueue, ^{ NSLog(@"control after Call 4");});
}

-(void) controlDispatchQueuePriority {
    NSLog(@"controlDispatchQueuePriority");
    dispatch_queue_t queue1 = dispatch_queue_create("com.bogon.queue1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("com.bogon.queue2", DISPATCH_QUEUE_SERIAL);
    
    dispatch_queue_t globalQueue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_set_target_queue(queue1, globalQueue1);
    dispatch_queue_t globalQueue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    dispatch_set_target_queue(queue2, globalQueue2);
    
    //order 2 4 5 1 3(low priority)
    dispatch_async(queue2, ^{ NSLog(@"Q2 Call 1"); });
    dispatch_async(queue1, ^{ NSLog(@"Q1 Call 2"); });
    dispatch_async(queue2, ^{ NSLog(@"Q2 Call 3"); });
    dispatch_async(queue1, ^{ NSLog(@"Q1 Call 4"); });
    dispatch_async(queue1, ^{ NSLog(@"Q1 Call 5"); });
}

-(void) waitGroupDispatchQueue {
    NSLog(@"waitGroupDispatchQueue");
    
    //typedef int (FUNC) (void);는 FUNC가 int ()(void) 라는 것이다.
    //FUNC *a; 이러면 a가 int를 리턴하고 void를 인자로 하는 함수의 포인터가 된는 것이다.
    //typedef void (^blk_t)(void);
    //blk_t call = ^{
    void (^call)(void) = ^{
        NSLog(@"call block");
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (long i = 0; i < 2000000; i++) {
            [array addObject:[NSNumber numberWithLong:i]];
//            [NSThread sleepForTimeInterval:0.000000001];
        }
    };
    
    dispatch_async(serialQueue, ^{
        
        dispatch_group_t group = dispatch_group_create();
        
        dispatch_async(globalQueue, ^{ NSLog(@"Call 1"); });
        dispatch_group_async(group, globalQueue, ^{
            NSLog(@"Call 2");
            call();
        });
        dispatch_group_async(group, globalQueue, ^{
            NSLog(@"Call 3");
            call();
        });
        dispatch_group_async(group, globalQueue, ^{
            NSLog(@"Call 4");
            call();
            [NSThread sleepForTimeInterval:1];
        });
        NSLog(@"%ld", dispatch_group_wait(group, DISPATCH_TIME_FOREVER));;
        dispatch_async(globalQueue, ^{
            NSLog(@"Call 5");
        });
        dispatch_async(globalQueue, ^{
            NSLog(@"Call 6");
        });
        dispatch_async(globalQueue, ^{
            NSLog(@"Call 7");
        });
    });
}


-(void) enterLeaveGroupDispatchQueue {
    NSLog(@"enterLeaveGroupDispatchQueue");
    dispatch_group_t group = dispatch_group_create();
    typedef void (^blk_t)(void (^callback)(void));
    
    
    //blk_t call = ^(void (^callback)(void)){
    
    void (^call)(void(^callback)(void)) = ^(void(^callback)(void)) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for ( long i = 0; i < 5000000; i++ ) {
            [array addObject:[NSNumber numberWithLong:i]];
        }
        callback();
    };
    
    dispatch_group_async(group, globalQueue, ^{ NSLog(@"Call 1"); });
    dispatch_group_async(group, globalQueue, ^{ NSLog(@"Call 2"); });
    dispatch_group_enter(group);
    call(^{
        dispatch_group_leave(group);
    });
    dispatch_group_async(group, globalQueue, ^{ NSLog(@"Call 3"); });
    dispatch_group_notify(group, globalQueue, ^{ NSLog(@"Finished!"); });
}

-(void) applyTaskArrayToDispatchQueue {
    NSLog(@"applyTaskArrayToDispatchQueue");
    //wait for end of all task.
    dispatch_apply(100, concurrentQueue, ^(size_t index) {
        NSLog(@"Call %zu", index + 1);
    });
    //and process next.
    NSLog(@"Finished!");
}

-(void) barrierTaskDispatchQueue {
    NSLog(@"barrierTaskDispatchQueue");
    typedef void (^blk_t)(void);
    blk_t call = ^{
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for ( long i = 0; i < 5000000; i++ ) {
            [array addObject:[NSNumber numberWithLong:i]];
        }
        [NSThread sleepForTimeInterval:0.1];
    };
    
    dispatch_async(concurrentQueue, ^{ NSLog(@"Call 1"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Call 2"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Call 3"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Call 4"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Call 5"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Call 6"); });
    
    //performance is bad, so use semaphore
    dispatch_barrier_async(concurrentQueue, ^{ NSLog(@"Call 7"); call(); });
    
    dispatch_async(concurrentQueue, ^{ NSLog(@"Call 8"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Call 9"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Call 10"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Call 11"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Call 12"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"Call 13"); });
    
    
    //1. semaphore
    //create semaphore
//    dispatch_semaphore_t dispatch_semaphore_create(long value);
    
    //block for specific time
//    long dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout);
    
    //release block
//    long dispatch_semaphore_signal(dispatch_semaphore_t dsema);
    
    /* sample
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    dispatch_queue_t queue = dispatch_queue_create("com.davin.testqueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    for ( int i = 0; i < 100000; i++ )
    {
        dispatch_async(queue, ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            [array addObject:[NSNull null]];
            dispatch_semaphore_signal(semaphore);
        });
    }
     */
    
    //2. suspend and resume
    //suspend dispatch object
//    void dispatch_suspend(dispatch_object_t object);
    
    //resume dispatch object
//    void dispatch_resume(dispatch_object_t object);
    
    
    
    //3. execute once dispatch
//    void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block);
    
    /* sample
    static dispatch_once_t once;
    
    typedef void (^blk_t)(void);
    blk_t call = ^(void){
        dispatch_once(&once, ^{
            NSLog(@"Call!");
        });
    };
    
    dispatch_queue_t queue = dispatch_queue_create("com.davin.testqueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{ call(); });
    dispatch_async(queue, ^{ call(); });
    dispatch_async(queue, ^{ call(); });
     */
    
}


-(void) testMultiThreadInSerialQueue {
    NSLog(@"testMultiThreadInSerialQueue");
    [self runSerialDispatchQueue];
    [self runSerialDispatchQueue2];
}

-(void) runSerialDispatchQueue {
    NSLog(@"runSerialDispatchQueue start");
    dispatch_sync(serialQueue,
                  ^{
                      for (int i = 0; i < 10; i++) {
                          NSLog(@"runSerialDispatchQueue 1");
                          [NSThread sleepForTimeInterval:0.1];
                      }
                  });
    NSLog(@"runSerialDispatchQueue end");
    
}
-(void) runSerialDispatchQueue2 {
    NSLog(@"runSerialDispatchQueue2");
    dispatch_sync(serialQueue,
                  ^{
                      for (int i = 0; i < 10; i++) {
                          NSLog(@"runSerialDispatchQueue 2");
                          [NSThread sleepForTimeInterval:0.1];
                      }
                  });
    NSLog(@"runSerialDispatchQueue2 end");
}



-(void) notifyGroupDispatchQueue {
    NSLog(@"notifyGroupDispatchQueue");
    dispatch_group_t group = dispatch_group_create();
    
    
    dispatch_group_async(group, globalQueue, ^{ NSLog(@"Call 1"); });
    dispatch_group_notify(group, globalQueue, ^{ NSLog(@"Finished!"); });
    dispatch_group_async(group, globalQueue, ^{ NSLog(@"Call 2"); });
    dispatch_group_async(group, globalQueue, ^{ NSLog(@"Call 3"); });
    dispatch_group_async(group, globalQueue, ^{ NSLog(@"Call 4"); });
    dispatch_group_async(group, globalQueue, ^{ NSLog(@"Call 5"); });
    dispatch_group_async(group, globalQueue, ^{ NSLog(@"Call 6"); });
    dispatch_group_async(group, globalQueue, ^{ NSLog(@"Call 7"); });
    dispatch_group_async(group, globalQueue, ^{ NSLog(@"Call 8"); });
    dispatch_group_async(group, globalQueue, ^{ NSLog(@"Call 9"); });
    dispatch_group_async(group, globalQueue, ^{ NSLog(@"Call 10"); });
    
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 1"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 2"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 3"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 4"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 5"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 6"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 7"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 8"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 9"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 10"); });
    
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 11"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 12"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 13"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 14"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 15"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 16"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 17"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 18"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 19"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 20"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 21"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 22"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 1"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 2"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 3"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 4"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 5"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 6"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 7"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 8"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 9"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 10"); });
    
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 11"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 12"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 13"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 14"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 15"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 16"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 17"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 18"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 19"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 20"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 21"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 22"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 1"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 2"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 3"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 4"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 5"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 6"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 7"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 8"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 9"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 10"); });
    
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 11"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 12"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 13"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 14"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 15"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 16"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 17"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 18"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 19"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 20"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 21"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 22"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 1"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 2"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 3"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 4"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 5"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 6"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 7"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 8"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 9"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 10"); });
    
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 11"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 12"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 13"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 14"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 15"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 16"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 17"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 18"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 19"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 20"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 21"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 22"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 1"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 2"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 3"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 4"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 5"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 6"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 7"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 8"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 9"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 10"); });
    
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 11"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 12"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 13"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 14"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 15"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 16"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 17"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 18"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 19"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 20"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 21"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 22"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 1"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 2"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 3"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 4"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 5"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 6"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 7"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 8"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 9"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 10"); });
    
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 11"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 12"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 13"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 14"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 15"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 16"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 17"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 18"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 19"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 20"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 21"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 22"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 1"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 2"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 3"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 4"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 5"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 6"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 7"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 8"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 9"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 10"); });
    
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 11"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 12"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 13"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 14"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 15"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 16"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 17"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 18"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 19"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 20"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 21"); });
    dispatch_async(globalQueue, ^{ NSLog(@"Call2 22"); });
    
}

@end


/*
 dispatch_async(queue_for_background_thread, ^{
 // 여기에는 DB 접근 등의 시간이 오래 걸리는 작업이 들어감
 
 // 작업이 완료되고 나면, 메인 스레드에서 결과를 사용한다
 dispatch_async(dipatch_get_main_queue(), ^{
 // 여기에는 사용자 인테페이스 갱신 등의 메인 스레드 작업이 들어감
 });
 });
 */
