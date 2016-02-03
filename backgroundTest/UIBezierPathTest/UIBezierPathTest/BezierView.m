//
//  BezierView.m
//  UIBezierPathTest
//
//  Created by dqw on 16/1/12.
//  Copyright © 2016年 dqw. All rights reserved.
//

#import "BezierView.h"


@interface BezierView ()
{
//    CGFloat _PY;
    CGFloat _y2;
    CGFloat _y3;
}

@end


static CGFloat _PY = 500;

@implementation BezierView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _controlY = 500;
        
        _y2 = 0;
        _y3 = 250;

    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self test];
}

- (void)test2
{
    UIBezierPath *path =[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 150)];
    [path addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(160, _y2) controlPoint2:CGPointMake(160, _y3)];
    path.lineCapStyle =kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = 5.0;
    UIColor *color = [UIColor redColor];
    [color set];
    [path stroke];
}

- (void)test
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(20, _PY)];
    [path addQuadCurveToPoint:CGPointMake(self.frame.size.width - 20, _PY) controlPoint:CGPointMake(self.frame.size.width / 2, _controlY)];
    //    [path addLineToPoint:CGPointMake(self.frame.size.width - 20, _PY)];
    [path addLineToPoint:CGPointMake(self.frame.size.width - 20, self.frame.size.height - 10)];
    [path addLineToPoint:CGPointMake(20, self.frame.size.height - 10)];
    [path closePath];
    
    
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth  = 5.0;
    UIColor *color = [UIColor redColor];
    [color set];
    [path stroke];
}

- (void)setControlY:(CGFloat)controlY
{
    _PY += (controlY - _controlY);
    _controlY = controlY + (controlY - _controlY) * 1;
    
    _y2 += (controlY - _controlY);
    _y3 -= (controlY - _controlY);
    

    NSLog(@"%f", controlY);
    [self setNeedsDisplay];
}

@end
