//
//  ViewController.m
//  UIImagePickerTest
//
//  Created by dqw on 16/2/2.
//  Copyright © 2016年 dqw. All rights reserved.
//

#import "ViewController.h"
#import "TKImagePickerTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)present:(id)sender {
    
    NSLog(@"xx%@", [NSThread currentThread]);

    NSArray *arr = [[TKImagePickerTool sharedTool] imageGroupNames];
    NSLog(@"arr %@", arr);
    
//   [[TKImagePickerTool sharedTool] imageGroupNames:^(NSArray *groupNames) {
//       NSLog(@"%@", groupNames);
//   }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
