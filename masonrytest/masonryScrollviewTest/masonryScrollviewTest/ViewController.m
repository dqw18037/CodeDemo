//
//  ViewController.m
//  masonryScrollviewTest
//
//  Created by dqw on 16/1/11.
//  Copyright © 2016年 dqw. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIScrollView *scroll = [[UIScrollView alloc]init];
    scroll.backgroundColor = [UIColor yellowColor];
    UIView *container = [[UIView alloc]init];
    [self.view addSubview:scroll];
    [scroll addSubview:container];
    
    UIView *view1 = [UIView new];
    UIView *view2 =[UIView new];
    view1.backgroundColor = [UIColor redColor];
    view2.backgroundColor = [UIColor blueColor];
    
    [container addSubview:view1];
    [container addSubview:view2];
    
    
    [scroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scroll);
        make.width.equalTo(scroll);
    }];
    
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scroll).offset(10);
        make.centerX.equalTo(scroll);
        make.height.equalTo(@400);
        make.width.equalTo(scroll).offset(-10);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view1.mas_bottom).offset(20);
        make.width.equalTo(scroll).offset(-20);
        make.height.equalTo(view1).multipliedBy(2);
    }];
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view2).offset(30);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
