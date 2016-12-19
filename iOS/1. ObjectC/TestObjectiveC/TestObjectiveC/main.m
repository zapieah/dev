//
//  main.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 7..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestSelector.h"
#import "TestStringCollection.h"
#import "TestStringCollection2.h"
#import "TestDic.h"
#import "TestCopyObject.h"
#import "TestOverloading.h"
#import "TestNSData.h"
#import "TestClass.h"
#import "TestSelf.h"
#import "TestSubClass.h"
#import "TestOverride.h"
#import "TestClassConstructor.h"
#import "TestClassAccessModifier.h"
#import "TestClassMethod.h"
#import "TestBlock.h"
#import "TestSelector2.h"
#import "TestCategory.h"
#import "TestCategory+CategoryA.h"
#import "TestCategory+CategoryB.h"
#import "TestProtocol.h"
#import "TestTipClass.h"
#import "TestLoopClass.h"
#import "TestProperty2.h"
#import "TablePrinter.h"
#import "FruitBasket.h"
#import "TestFunctionPointer.h"
#import "TestMutableArray.h"
#import "TestGCD.h"
#import "TestNSThread.h"




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"-------------TestSTART-------------");
        
        
        
        NSLog(@"-------------TestClass-------------");
        TestClass *tc = [[TestClass alloc]init];
        [tc testNonArg];
        [tc testOneArg:10];
        [tc testTwoArg:20 another:30];
        [TestClass classMethod];
        
        
        
        NSLog(@"-------------TestClassConstructor-------------");
        TestClassConstructor *tcc = [[TestClassConstructor alloc]init];
        NSLog(@"getX = %d", [tcc getX]);
        NSLog(@"getY = %d", [tcc getY]);
        TestClassConstructor *tcc2 = [[TestClassConstructor alloc]initWithXY:3 : 4];
        NSLog(@"getX = %d", [tcc2 getX]);
        NSLog(@"getY = %d", [tcc2 getY]);
        
        
        
        NSLog(@"-------------TestClassAccessModifier-------------");
        TestClassAccessModifier *tcam = [[TestClassAccessModifier alloc]init];
        //        NSLog(@"defaultValue = %d",tcam->defaultValue);
        NSLog(@"publicValue = %d",tcam->publicValue);
        //        NSLog(@"protectedValue = %d",tcam->protectedValue);
        //        NSLog(@"privateValue = %d",tcam->privateValue);
        
        
        
        NSLog(@"-------------TestSelf-------------");
        TestSelf * ts = [[TestSelf alloc]init];
        [ts setPoint:1 :2];
        [ts getX];
        [ts getY];
        [ts callMethodHello];
        
        
        
        NSLog(@"-------------TestClassMethod-------------");
        TestClassMethod *tcm = [[TestClassMethod alloc]init];
        NSLog(@"MAX_SIZE = %d", [TestClassMethod MAX_SIZE]);
        [TestClassMethod testClassMethod];
        
        
        
        NSLog(@"-------------TestSubClass-------------");
        TestSubClass *tsc = [[TestSubClass alloc]init];
        [tsc printTest];
        TestSubClass2 *tsc2 = [[TestSubClass2 alloc]init];
        [tsc2 printTest];
        [tsc2 printTest2];
        TestSubClass2 *tsc3 = [[TestSubClass alloc]init];
        [tsc3 printTest];
        //check availabiliy of method
        if ([tsc3 respondsToSelector:@selector(printTest2)] == YES)
            [tsc3 printTest2];
        else if ([tsc3 respondsToSelector:@selector(printTest2)] == NO)
            NSLog(@"printTest2 is not member method of tcs3");
        
        
        
        NSLog(@"-------------TestOverride-------------");
        TestOverride *to = [[TestOverride alloc]init];
        [to testMethod];
        TestOverride2 *to2 = [[TestOverride2 alloc]init];
        [to2 testMethod];
        [to2 callSupertestMethod];
        TestOverride2 *to3 = [[TestOverride alloc]init];
        [to3 testMethod];
        
        
        
        NSLog(@"-------------TestOverloading-------------");
        TestOverloading *tover = [[TestOverloading alloc]init];
        [tover testOverloading];
        [tover testOverloading:10];
        [tover testOverloading:10 index:20];
        [tover testOverloading:10 index:20 position:30];
        
        

        NSLog(@"-------------TestLoopClass-------------");
        TestLoopClass *tlc = [[TestLoopClass alloc]init];
        [tlc testNormalForLoop];
        [tlc testImplicitLoog];
        [tlc testNormalWhileLoop];
        [tlc testEnumWhileLoop];
        
        

        NSLog(@"-------------TestSelector-------------");
        TestSelector *myTestSelector = [[TestSelector alloc] init];
        [myTestSelector run];
        [myTestSelector testSelector];
        NSArray *myArray = [NSArray arrayWithObjects:@"A", @"B", @"C", nil];
        NSString *correctString = @"This is correct.";
        //call method of object in main function
        [myTestSelector performSelector:@selector(testMe:nameString:) withObject:myArray withObject:correctString];
        [myTestSelector testMe:myArray nameString:correctString];
        [TestSelector sayHello];
        
        
        
        NSLog(@"-------------TestSelector2-------------");
        //call method of object in main function
        id obj;
        SEL method;
        obj = [[TestSelector2 alloc]init];
        method = @selector(test);
        if ([obj respondsToSelector:method] == YES)
            [obj performSelector:method withObject:obj];

        if (!obj)
            return 0;
        //call selector like function. The speed is better than original selection.
        //This use function pointer.
        SEL selector = NSSelectorFromString(@"test");
        IMP imp = [obj methodForSelector:selector];
        void (*func)(id, SEL) = (void *)imp;
        if ([obj respondsToSelector:selector] == YES){
            func(obj, selector);
        }
        
        
        
        NSLog(@"-------------TestSelector3-------------");
        TablePrinter *tableP = [[TablePrinter alloc]init];
        [tableP printTable];
        TablePrinter *myTablePrinter = [[TablePrinter alloc]init];
        FruitBasket *myFruitBasket = [[FruitBasket alloc]init];
        [myTablePrinter setDataSource:myFruitBasket];
        [myTablePrinter printTable];
        
        
        
        NSLog(@"-------------TestCategory-------------");
        //Category : add methods to class
        TestCategory *tcg = [[TestCategory alloc]init];
        [tcg testCategory];
        [tcg testCategoryA];
        [tcg testCategoryB];

        
        
        NSLog(@"-------------TestProtocol-------------");
        TestProtocol *tp = [[TestProtocol alloc]init];
        [tp test];
        
        
        
        NSLog(@"-------------TestProperty2-------------");
        TestProperty2 *tp2 = [[TestProperty2 alloc]init];
        [tp2 setName:@"Bogon"];
        NSLog(@"name %@", [tp2 name]);
        [tp2 setSalary:10];
        NSLog(@"salary %d",[tp2 salary]);
        NSLog(@"employeeNumber %d",[tp2 employeeNumber]);
        [tp2 setInternalVariable];
        NSLog(@"name %@", [tp2 name]);
        NSLog(@"salary %d",[tp2 salary]);
        NSLog(@"employeeNumber %d",[tp2 employeeNumber]);
        [tp2 setPropertyVariable];
        NSLog(@"name %@", [tp2 name]);
        NSLog(@"salary %d",[tp2 salary]);
        NSLog(@"employeeNumber %d",[tp2 employeeNumber]);
        [tp2 testSetVariable];
        NSLog(@"name %@", [tp2 name]);
        NSLog(@"salary %d",[tp2 salary]);
        NSLog(@"employeeNumber %d",[tp2 employeeNumber]);
        
        
        
        NSLog(@"-------------TestBlock-------------");
        TestBlock *tb = [[TestBlock alloc]init];
        [tb testBlock1];
        [tb testBlock2];
        [tb testBlock3];
        [tb testBlock4];
        [tb testBlock5];
        [tb testBlockVariable];
        [tb testBlockArgument];
        
        
        
        NSLog(@"-------------TestStringCollection-------------");
        TestStringCollection *sc = [[TestStringCollection alloc]init];
        [sc test];
        
        
        
        NSLog(@"-------------TestStringCollection2-------------");
        TestStringCollection2 *sc2 = [[TestStringCollection2 alloc]init];
        [sc2 test];
        
        
        
        NSLog(@"-------------TestNSData-------------");
        TestNSData *data = [[TestNSData alloc]init];
        [data test];
        
        
        
        NSLog(@"-------------TestDic-------------");
        TestDic *dc = [[TestDic alloc]init];
        [dc test];
        

        
        NSLog(@"-------------NSNumber-------------");
        NSNumber* n;
        n = [[NSNumber alloc]initWithInt:10];

        
        
        NSLog(@"-------------TestMutableArray-------------");
        TestMutableArray *tma = [[TestMutableArray alloc]init];
        [tma addObjectToMutablaArray];
        [tma testMutableArray];
        [tma removeObjectInMutableArray:3];
        [tma testMutableArray];
        [tma testMutableArray2];
        
        
        [tma removeObjectInMutableArray:4];
        [tma testMutableArray];
        [tma testMutableArray2];
        
        [tma removeAllObjectInMutableArray];
        [tma testMutableArray];
        [tma testMutableArray2];
        
        
        
        NSLog(@"-------------TestCopyObject-------------");
        TestCopyObject *co = [[TestCopyObject alloc]init];
        [co test];
        [co test2];

        
        
        NSLog(@"-------------TestTipClass-------------");
        TestTipClass *ttc = [[TestTipClass alloc]init];
        [ttc testStackTrace];
        [ttc testBackTrace];
        [ttc testLog];
        [ttc testLog2];
        NSLog(@"%@", tcc);
        
        
        
        NSLog(@"-------------TestFunctionPointer-------------");
        TestFunctionPointer *tfp = [[TestFunctionPointer alloc]init];
        [tfp testFunction];

        
        
        NSLog(@"-------------TestGCD-------------");
        TestGCD *testGCD = [[TestGCD alloc]init];
        [testGCD addTaskToDispatchSerialSyncQueue];
        [NSThread sleepForTimeInterval:1];

        [testGCD addTaskToDispatchSerialAsyncQueue];
        [NSThread sleepForTimeInterval:1];

        [testGCD addTaskToDispatchConcurrentSyncQueue];
        [NSThread sleepForTimeInterval:1];

        [testGCD addTaskToDispatchConcurrentAsyncQueue];
        [NSThread sleepForTimeInterval:1];
        
        [testGCD controlDispatchQueueAfter];
        [NSThread sleepForTimeInterval:2];
        
        [testGCD controlDispatchQueuePriority];
        [NSThread sleepForTimeInterval:1];
        
        [testGCD notifyGroupDispatchQueue];
        [NSThread sleepForTimeInterval:1];
        
        [testGCD waitGroupDispatchQueue];
        [NSThread sleepForTimeInterval:3];

        [testGCD enterLeaveGroupDispatchQueue];
        [NSThread sleepForTimeInterval:3];

        [testGCD applyTaskArrayToDispatchQueue];
        [NSThread sleepForTimeInterval:1];

        [testGCD barrierTaskDispatchQueue];
        [NSThread sleepForTimeInterval:1];

        [testGCD testMultiThreadInSerialQueue];
        //[NSThread sleepForTimeInterval:3];

        
        
        NSLog(@"-------------TestNSThread-------------");
        TestNSThread *tnt = [[TestNSThread alloc]init];
        [tnt startNSThread_1];
        [tnt startNSThread_2];
        
        [NSThread sleepForTimeInterval:2];
        [tnt stopNSThread_1];
        [tnt stopNSThread_2];

        [tnt startThreadAndAutoFinish];
        [NSThread sleepForTimeInterval:8];
        
        NSLog(@"-------------TestEND-------------");
#if 0
        NSLog(@"-------------GCD Sample-------------");
        // 여기서부터 비동기 코드 시작.
        // dispatch_async 함수는 내부블럭의 코드 실행에 영향을 받지 않고 바로 실행이 끝난다.
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
            //(DISPATCH_QUEUE_PRIORITY_HIGH,0), ^{
            // 작업이 오래 걸리는 API를 백그라운드 스레드에서 실행한다.
            BOOL res = [self heavyOperatingMethod];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                // 이 블럭은 메인스레드(UI)에서 실행된다.
                if (res) {
                    [self operationSucceed];
                } else {
                    [self operationFailed];
                }
            });
        });
#endif
        
    }
    return 0;
}
