//
//  Foo.h
//  TestSelector
//
//  Created by bogon on 2016. 11. 30..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TestSelector : NSObject
-(void) run;
-(void) echoNames: (id) objectArray;
-(void) testMe:(id)objectArray nameString:(id)nameString;
-(void) echoHello;
-(void) testSelector;
+(void) sayHello;
@end


//1. Selector
//변수 선언 : SEL 변수 = @selector(함수이름);
//셀렉터를 이용하여 함수 사용 : [클래스 변수 performSelector:@selector(함수이름)];
//[a performSelector:@selector(go:) withObject:(id)10];
//[a performSelector:@selector(go:speed:) withObject:(id)10 withObject:(id)10];
//withObject는 2개까지 지원
//
//2. Selector는 함수 포인터다?
//제목에서 알 수 있듯이 잘못됌
//다른 클래스에 같은 이름의 함수가 있을경우 함수포인터라면 다른 주소를 가져야함
//근데 @selector를 만들때 클래스를 구분할 수 없다.
//그래서 selector를 가져와 보면 동일한 selector를 가짐
//따라서 함수포인터가 아니다.
//클래스가 다르더라도 함수이름이 동일하면 셀렉터는 동일
//
//3. 동작 원리
//클래스의 객체 생성 시 주소가 100이라면 포인터가 주소 100번지를 가짐
//내부적으로 함수테이블 만듬 (가상함수 테이블, 모든 함수의 주소를 가지는 테이블, 문자열/주소를 가짐, 함수테이블때문에 부하가 있다.)
//
//셀렉터 생성하면 함수 문자열 생성 selector는 그 시작 주소를 가리킴(따라서 함수 이름만 아는거)
//따라서 @selector(함수명) 는 const char*s1 = “함수명”; 와 같은 의미
//
//
//따라서 없는 함수 foo를 셀렉터로 만들어 실행해보면 selector를 만들때
//SEL s = @selector(foo);
//[a performSelector:s];
//둘다 컴파일 에러는 나지 않는다.
//왜냐하면 단지 함수 테이블에서 없는 foo라는 문자열을 찾아서 그 주소를 따라가라는 뜻이기 때문에
//하지만 실제로 클래스에는 해당 함수가 없기 때문에 런타임 에러가 난다.
//
//4. 샘플 코드
//@interface Car : NSObject
//{
//    int speed;
//}
//-(void) go;
//-(void) go:(int)a;
//-(void) go:(int)a speed:(int)s;
//-(void) go:(int)a speed:(int)s sound:(int)snd;
//@end
//
//@implementation Car
//
//-(void)go
//{
//    NSLog(@"go1");
//}
//-(void)go:(int)a
//{
//    NSLog(@"go2");
//}
//-(void)go:(int)a speed:(int)s
//{
//    NSLog(@"go3");
//}
//-(void)go:(int)a speed:(int)s sound:(int)snd
//{
//    NSLog(@"go4");
//}
//@end
//
//int main()
//{
//    Car* a = [Car alloc];
//    [a go];
//    SEL s1 = @selector(go);
//    SEL s4 = @selector(foo);
//    NSLog(@"%x",s1);
//    [a performSelector:s1];
//    [a performSelector:@selector(go:) withObject:(id)10];
//    [a performSelector:@selector(go:speed:) withObject:(id)10 withObject:(id)10];
//    [a performSelector:s4];
//    [a release];
//    a = nil;
//    return 0;
//}
