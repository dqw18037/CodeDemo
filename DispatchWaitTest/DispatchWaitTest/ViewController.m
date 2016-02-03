//
//  ViewController.m
//  DispatchWaitTest
//
//  Created by dqw on 16/2/3.
//  Copyright © 2016年 dqw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)touch:(id)sender {
    

    [self test3];
    
}


- (void)test3
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"ddd");
        NSLog(@"%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:5];
        dispatch_group_leave(group);
        NSLog(@"inner  after");
    });
    NSLog(@"beftore");
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"after");
}

- (void)test2
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"ddd");
            NSLog(@"%@", [NSThread currentThread]);
            [NSThread sleepForTimeInterval:5];
            dispatch_semaphore_signal(semaphore); //+1 semaphore
//            NSLog(@"inner  after");
        });
        NSLog(@"beftore");
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"after");
}

- (void)test
{

        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"1");
            //回到主线程发现死循环后面就没法执行了
            dispatch_sync(dispatch_get_main_queue(), ^{
                NSLog(@"2");
            });
            NSLog(@"3");
        });
        NSLog(@"4");
        //死循环
        while (1) {
            //
            NSLog(@"xx");
        }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
