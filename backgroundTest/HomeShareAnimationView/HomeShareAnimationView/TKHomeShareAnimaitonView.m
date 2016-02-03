//
//  TKHomeShareAnimaitonView.m
//  Teenker
//
//  Created by dqw on 16/1/13.
//  Copyright © 2016年 Xboy. All rights reserved.
//

#import "TKHomeShareAnimaitonView.h"

@interface TKHomeShareAnimaitonView ()
{
    CGFloat _controlOffsetX;
    CGFloat _offsetX;
}
@end


@implementation TKHomeShareAnimaitonView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
         _controlOffsetX = 0;
         _offsetX = 0;
         _offsetXDeltaMax = 100;
        _normalTipText = @"查看更多";
        _releaseTipText = @"释放查看";
        _animationVelocity = 1.0;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
  
    CGFloat rightX = width;
    CGFloat leftX = rightX + _offsetX;
    CGFloat BottomY = height;
    
    CGPoint rightTop = CGPointMake(rightX, 0);
    CGPoint leftTop = CGPointMake(leftX, 0);
    CGPoint controlPoint = CGPointMake(leftX + _controlOffsetX, height /2);
    CGPoint endPoint = CGPointMake(leftX, BottomY);
    CGPoint rightBottom = CGPointMake(rightX
                                      , BottomY);
    
    [path moveToPoint:rightTop];
    [path addLineToPoint:leftTop];
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    [path addLineToPoint:rightBottom];
    [path closePath];
    
    UIColor *fillColor = [UIColor darkGrayColor];
    [fillColor set];
    path.lineWidth = 1.0;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    [path fill];
    CGFloat strWidth = 20;
    CGFloat strX = rightX + _offsetX * 2 + 10;
    CGFloat limitStrX = rightX - strWidth;
    BOOL flag = strX <= limitStrX;
    strX = flag ? limitStrX : strX;
    NSString *text = flag ? _normalTipText : _releaseTipText;
    CGFloat strMargin = 20;
    CGFloat strHeight = height - 2 * strMargin;
    CGRect strRect = CGRectMake(strX, strMargin, strWidth, strHeight);
    [text drawInRect:strRect withAttributes:nil];
}

- (void)setBindedScrollView:(UIScrollView *)bindedScrollView
{
    bindedScrollView.bounces = YES;
    [bindedScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    CGPoint point = [change[@"new"] CGPointValue];
    CGFloat currentX = point.x;
    UIScrollView *scrollView = (UIScrollView *)object;
    CGFloat limitX = scrollView.contentSize.width - scrollView.frame.size.width;
    CGFloat deltaX;
    if (currentX < limitX) {
        deltaX = 0;
    } else{
        deltaX = (currentX - limitX);
    }
    CGFloat animationPercent = deltaX / 100;
    _controlOffsetX =  - _offsetXDeltaMax * animationPercent * self.animationVelocity;
    _offsetX = _controlOffsetX * 0.3;
    [self setNeedsDisplay];
}


@end
