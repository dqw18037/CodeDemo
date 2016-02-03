//
//  TAAnimatedDotView.m
//  TAPageControl
//
//  Created by Tanguy Aladenise on 2015-01-22.
//  Copyright (c) 2015 Tanguy Aladenise. All rights reserved.
//

#import "TAAnimatedDotView.h"
//#import "UIColor+XFColor.h"
#import "TKUIGlobals.h"

static CGFloat const kAnimateDuration = 1;

@implementation TAAnimatedDotView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialization];
    }
    
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialization];
    }
    
    return self;
}

- (void)setDotColor:(UIColor *)dotColor
{
    _dotColor = dotColor;
    self.layer.borderColor = dotColor.CGColor;
}

- (void)initialization
{
    _dotColor = [UIColor redColor];
    _activeDotColor = [UIColor yellowColor];
    self.backgroundColor = _dotColor;
}


- (void)changeActivityState:(BOOL)active
{
    if (active) {
        [self animateToActiveState];
    } else {
        [self animateToDeactiveState];
    }
}


- (void)animateToActiveState
{
    [UIView animateWithDuration:kAnimateDuration
                          delay:0
         usingSpringWithDamping:.5
          initialSpringVelocity:-20
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.backgroundColor = _activeDotColor;
                     }
                     completion:nil];
}

- (void)animateToDeactiveState
{
    [UIView animateWithDuration:kAnimateDuration
                          delay:0
         usingSpringWithDamping:.5
          initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.backgroundColor = _dotColor;
                         self.transform = CGAffineTransformIdentity;
                     }
                     completion:nil];
}

@end
