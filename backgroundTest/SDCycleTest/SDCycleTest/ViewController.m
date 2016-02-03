//
//  ViewController.m
//  SDCycleTest
//
//  Created by dqw on 16/1/14.
//  Copyright © 2016年 dqw. All rights reserved.
//

#import "ViewController.h"
#import "SDCycleScrollView/SDCycleScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    SDCycleScrollView *view = [[SDCycleScrollView alloc]initWithFrame:self.view.bounds pageControlHeight:2.0];
    [self.view addSubview:view];

    UIImage *image = [UIImage imageNamed:@"pic_placeholder_banner"];
    NSArray *images = @[image, image,image,image,image];
    view.localizationImagesGroup = images;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
