//
//  TADotView.m
//  TAPageControl
//
//  Created by Tanguy Aladenise on 2015-01-22.
//  Copyright (c) 2015 Tanguy Aladenise. All rights reserved.
//

#import "TADotView.h"

@implementation TADotView


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

- (void)initialization
{
    self.backgroundColor    = [UIColor colorWithWhite:1.0 alpha:0.3];
    self.layer.cornerRadius = CGRectGetWidth(self.frame) / 2.f;
//    self.layer.borderColor  = [UIColor whiteColor].CGColor;
//    self.layer.borderWidth  = 1;
}


- (void)changeActivityState:(BOOL)active
{
    if (active) {
        self.backgroundColor = [UIColor whiteColor];
    } else {
        self.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.3];
    }
}

@end
