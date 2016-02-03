//
//  ViewController.m
//  HomeShareAnimationView
//
//  Created by dqw on 16/1/13.
//  Copyright © 2016年 dqw. All rights reserved.
//

#import "ViewController.h"
#import "TKHomeShareAnimaitonView.h"

@interface ViewController ()

{
    
}

@property (nonatomic, strong) TKHomeShareAnimaitonView *aniView;


@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat heightXX = 500;
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, width, heightXX)];
    [self.view addSubview:backView];
    
    UIScrollView *scro = [[UIScrollView alloc]initWithFrame:backView.bounds];
    [backView addSubview:scro];
    scro.backgroundColor = [UIColor yellowColor];
    scro.contentSize = CGSizeMake(width * 2, heightXX);
    UIView *scView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, scro.contentSize.width, heightXX)];
    scView.backgroundColor = [UIColor redColor];
    [scro addSubview:scView];
    scro.bounces  = YES;
    
    CGFloat aniWidth = 200;
    CGFloat aniHeight = 100;
    self.aniView = [[TKHomeShareAnimaitonView alloc] initWithFrame:CGRectMake(width - aniWidth, 100, aniWidth, aniHeight)];
    [backView addSubview:self.aniView];
    self.aniView.backgroundColor = [UIColor clearColor];
    self.aniView.bindedScrollView = scro;
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
