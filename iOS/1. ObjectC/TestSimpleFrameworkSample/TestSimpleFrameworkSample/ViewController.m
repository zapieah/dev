//
//  ViewController.m
//  TestSimpleFrameworkSample
//
//  Created by bogon on 2016. 11. 22..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "ViewController.h"
@import SimpleFramework;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    @autoreleasepool {
        ApiAdapter *adapter = [ApiAdapter new];
        [adapter sayHello];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
