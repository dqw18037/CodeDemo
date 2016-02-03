//
//  ViewController.m
//  UICollectionTest
//
//  Created by dqw on 16/1/13.
//  Copyright © 2016年 dqw. All rights reserved.
//

#import "ViewController.h"
#import "TKServiceCategoryView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}
- (void)viewDidLayoutSubviews
{
    TKServiceCategoryView *viwe = [[TKServiceCategoryView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:viwe];
    viwe.categorys = @[@"dfd", @"dfdf", @"34343"];
    viwe.backgroundColor =[UIColor blueColor];
}

- (void)viewDidAppear:(BOOL)animated
{
  
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
