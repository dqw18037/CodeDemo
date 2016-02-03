//
//  TKImagesTool.h
//  Teenker
//
//  Created by dqw on 16/2/2.
//  Copyright © 2016年 Xboy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

typedef void(^TKGetImageGroupBlock)(NSArray *groupNames);

@interface TKImagePickerTool : NSObject

+ (instancetype)sharedTool;

- (void)imageGroupNames:(TKGetImageGroupBlock)block;

- (NSArray *)imageGroupNames;
//- (ALAssetsGroup *)imageGroupWithName:(NSString *)name;


@end
