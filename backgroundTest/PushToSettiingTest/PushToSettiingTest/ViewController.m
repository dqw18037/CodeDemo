//
//  ViewController.m
//  PushToSettiingTest
//
//  Created by dqw on 16/1/12.
//  Copyright © 2016年 dqw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}
#define System_Version [[[UIDevice currentDevice] systemVersion] floatValue]
#define IS_IOS_7 ((System_Version >= 7.0 && System_Version < 8.0) ? YES : NO)
#define IS_IOS_8 ((System_Version >= 8.0 && System_Version < 9.0) ? YES : NO)
#define IS_IOS_9 ((System_Version >= 9.0 && System_Version < 9.1) ? YES : NO)
- (IBAction)setting:(id)sender {
    
//    NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
////    NSURL *url = [NSURL URLWithString:@"prefs:root=NOTIFICATIONS_ID"];
//    if([[UIApplication sharedApplication] canOpenURL:url]) {
//        
//           [[UIApplication sharedApplication] openURL:url];
//    }
//    
//    NSURL *url = nil;
////    if (IS_IOS_7) {
//        url = [NSURL URLWithString:@"prefs:root=NOTIFICATIONS_ID"];
////    } else
////    {
////        url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
////        
////    }
//    if ([[ UIApplication sharedApplication] canOpenURL:url]) {
//        [[UIApplication sharedApplication] openURL:url];
//    }
    
    
//    
//    
//    UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"alert1" message:@"xxx" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
//    UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"alert2" message:@"yyyy" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
//    
//    [alert1 show];
//    [alert2 show];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:[NSString stringWithFormat:@"最多可添加%d张照片", 1]
                                                   delegate:self
                                          cancelButtonTitle:@"知道了"
                                          otherButtonTitles: nil];
//    [alert show];
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%ld", buttonIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
