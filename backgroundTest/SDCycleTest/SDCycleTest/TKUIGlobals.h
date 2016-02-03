//
//  TKUIGlobals.h
//  Teenker
//
//  Created by pengfafa on 15/8/26.
//  Copyright © 2015年 Xboy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

extern float const  kTKCornerRadius;

extern float const  kTKStatusBarHeight;
extern float const  kTKNavigationBarHeight;
extern float const  kTKTabBarHeight;
extern long const   kTKNavigationTitleColor;
extern float const  kTKNavigationTitleSize;

extern long const   kTKNavigationSubTitleColor;
extern float const  kTKNavigationSubTitleSize;
extern float const  kTKNavigationSubTitleMinumSize;

extern long const   kTKNavigationButtonColor;
extern float const  kTKNavigationButtonSize;

extern long const   kTKViewBackgoundColor;
extern long const   kTKTableBackgroundColor;
extern long const   kTKTableCellHighlightedColor;
extern float const  kTKTableCellSeparatorMargin;

extern float const  kTKMainImageWidth;
extern long const   kTKMainTitleColor;
extern float const  kTKMainTitleSize;

extern long const   kTKSecondTitleColor;
extern float const  kTKSecondTitleSize;

extern float const  kTKTableTitleSize;
extern long const   kTKTableTitleColor;
extern float const  kTKTableSecondTitleSize;
extern float const  kTKTableContentSize;
extern long const   kTKTableContentColor;
extern long const   kTKTableCellBorderColor;

extern long const   kTKLabelContentColor;
extern float const  kTKLabelContentSize;
extern float const  kTKLabelBorderSize;
extern float const  kTKLabelBorderColor;

extern float const  kTKNoteTextSize;
extern long const   kTKNoteTextColor;

extern float const  kTKTextFieldSize;
extern long const   kTKTextFieldColor;
extern long const   kTKTextFieldPlaceholderColor;

extern long const   kTKDescriptionTextColor;
extern float const  kTKDescriptionTextSize;

extern long const   kTKSelectedColor;
extern long const   kTKPageBackgroundColor;

extern long const   kTKNormalRedColor;
extern long const   kTKSpecialRedColor;
extern long const   kTKBackgroundRedColor;

extern long const   kTKTableBorderColor;
extern long const   kTKTableSpliterColor;
extern long const   kTKTableShadowColor;

extern float const  kTKCellSeparatorMargin;
extern float const  kTKCellSeparatorWidth;
extern long const   kTKCellSeparatorColor;

extern float const  kTKPageControlHeight;
extern long const   kTKPageControlDeactiveColor;
extern long const   kTKPageControlActiveColor;

extern float const  kTKButtonHeightSmall;
extern float const  kTKButtonHeightNormal;

extern float const  kTKPortraitRadius;
extern float const  kTKPortraitBorderColor;

extern float const  kTKInputFrameLineHeight;
extern float const  kTKInputFramePadding;

extern float const  kTKShareButtonTitleSize;
extern long const   kTKShareButtonTitleColor;

extern float const  kTKChatPortraitSize;
extern float const  kTKChatTextSize;
extern long const   kTKChatSendTextColor;
extern long const   kTKChatReceiveTextColor;
extern long const   kTKChatSendVoiceTimeColor;
extern long const   kTKChatReceiveVoiceTimeColor;

extern float const  kTKChatTimeSize;
extern long const   kTKChatTimeColor;

extern float const  kTKChatReadLabelSize;
extern long const   kTKChatReadLabelColor;

extern long const  kTKChatMoreButtonTitleColor;
extern float const kTKChatMoreButtonTitleSize;

extern float const  kTKHintTextSize;
extern long const   kTKHintTextColor;

extern float const  kTKRefreshStateColor;

@interface TKUIGlobals : NSObject

@end
