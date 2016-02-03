//
//  ViewController.m
//  UIBezierPathTest
//
//  Created by dqw on 16/1/12.
//  Copyright © 2016年 dqw. All rights reserved.
//

#import "ViewController.h"
#import "BezierView.h"
@interface ViewController ()

{
    CGFloat lastY;
}
@property (nonatomic, strong) BezierView *Bview;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    BezierView *view =[BezierView alloc]initWithFrame:
    self.view.backgroundColor =[UIColor whiteColor];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
    BezierView *view =[[BezierView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    self.Bview = view;
    view.backgroundColor = [UIColor whiteColor];
//    view.controlY = 100;
    
//    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(refresh) userInfo:nil repeats:YES];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.Bview addGestureRecognizer:pan];
    
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateBegan) {
        lastY = 0;
    }
    CGPoint point = [pan translationInView:self.Bview];
    CGFloat y = point.y;
    
    CGFloat deltaY = y - lastY;
    
//    CGPoint point2 = [pan locationInView:self.Bview];
    
    NSLog(@"delta  %f", deltaY);
//
    self.Bview.controlY += deltaY;
    lastY = y;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

- (void)refresh
{
    static CGFloat y = 0;
    y += 10;
    self.Bview.controlY = y;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
