//
//  TKHomeShareAnimaitonView.h
//  Teenker
//
//  Created by dqw on 16/1/13.
//  Copyright © 2016年 Xboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TKHomeShareAnimaitonView : UIView

@property (nonatomic, assign) CGFloat offsetXDeltaMax;
@property (nonatomic, copy) NSString *normalTipText;
@property (nonatomic, copy) NSString *releaseTipText;
@property (nonatomic, assign) CGFloat animationVelocity;
@property (nonatomic, strong) UIScrollView *bindedScrollView;


@end
