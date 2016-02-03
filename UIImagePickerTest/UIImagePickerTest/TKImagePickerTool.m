//
//  TKImagesTool.m
//  Teenker
//
//  Created by dqw on 16/2/2.
//  Copyright © 2016年 Xboy. All rights reserved.
//

#import "TKImagePickerTool.h"
#import <UIKit/UIKit.h>

@interface TKImagePickerTool ()
{
    
}

@property (nonatomic, strong) ALAssetsLibrary *library;
@property (nonatomic, copy) NSArray *groupNames;
@property (nonatomic, copy) NSArray *groups;
@property (nonatomic, copy) NSArray *thumbnails;
@property (nonatomic, copy) NSArray *fullScreenImages;
@property (nonatomic, assign) NSInteger lastIndex;
@property (nonatomic, assign) dispatch_group_t groupT;





@end

@implementation TKImagePickerTool

+ (instancetype)sharedTool
{
    static TKImagePickerTool *sharedTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedTool = [[TKImagePickerTool alloc]init];
    });
    return sharedTool;
}

- (instancetype)init
{
    if (self = [super init]) {
        _lastIndex = 0;
    }
    return self;
}

- (void)imageGroupNames:(TKGetImageGroupBlock)block;
{
    NSMutableArray *groupNames = [[NSMutableArray alloc] init];
    NSMutableArray *groups = [[NSMutableArray alloc]init];
    [self.library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
            if (group) {
                NSString *name = [group valueForProperty:ALAssetsGroupPropertyName];
                [groupNames addObject:name];
                [groups addObject:group];
            } else {
                if (block) {
                    block(groupNames.copy);
                }
                self.groups = groups.copy;
            }
        } failureBlock:^(NSError *error) {
            if (block) {
                block(groupNames.copy);
            }
    }];
}

//- (NSArray *)thumbnailsWithIndex:(NSInteger)index
//{
//    
//}
//
//- (NSArray *)fullScreenImagesWithIndex:(NSInteger)index
//{
//    
//}

- (void)imagesWithIndex:(NSInteger)index
{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
}


- (void)imagesWithGroupIndex:(NSInteger)index
{
    if (self.lastIndex != index) {
        if (self.thumbnails.count > 0) {
            return;
        }
        NSMutableArray *thumbnails = [[NSMutableArray alloc]init];
        NSMutableArray *fullScreenImages = [[NSMutableArray alloc]init];
        if (index < self.groups.count) {
            ALAssetsGroup *group = self.groups[index];
            if (group) {
                [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                    if (result) {
                        ALAssetRepresentation *repersentation = [result defaultRepresentation];
                        UIImage *thumbnail = [UIImage imageWithCGImage:[result thumbnail]];
                        [thumbnails addObject:thumbnail];
                        
                        UIImage *fullScreenImage = [UIImage imageWithCGImage:[repersentation fullScreenImage]];
                        [fullScreenImages addObject:fullScreenImage];
                    } else {
                        self.thumbnails = thumbnails;
                        self.fullScreenImages = fullScreenImages;
                    }
                }];
            }
        }
        self.lastIndex = index;
    }
}

- (ALAssetsLibrary *)library
{
    if (!_library) {
        _library = [[ALAssetsLibrary alloc]init];
    }
    return _library;
}

- (NSArray *)imageGroupNames
{
    NSMutableArray *groupNames = [[NSMutableArray alloc] init];
    NSMutableArray *groups = [[NSMutableArray alloc]init];
    NSLog(@"%@", [NSThread currentThread]);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    [self.library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        NSLog(@"%@", [NSThread currentThread]);
        if (group) {
            NSString *name = [group valueForProperty:ALAssetsGroupPropertyName];
            [groupNames addObject:name];
            [groups addObject:group];
        } else {
            self.groups = groups.copy;
            NSLog(@"%@", [NSThread currentThread]);
            dispatch_semaphore_signal(semaphore); //+1 semaphore

        }
        
    } failureBlock:^(NSError *error) {
    }];
    NSLog(@"before wait");
    dispatch_semaphore_wait(semaphore, 10.0);

    NSLog(@"after wait");
    return groupNames;
}
- (NSArray *)imageGroupNames2
{
    NSMutableArray *groupNames = [[NSMutableArray alloc] init];
    NSMutableArray *groups = [[NSMutableArray alloc]init];
    dispatch_group_t groupT = dispatch_group_create();
    self.groupT = groupT;
    NSLog(@"%@", [NSThread currentThread]);

//    dispatch_group_enter(groupT);
    [self.library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        NSLog(@"%@", [NSThread currentThread]);
        if (group) {
            NSString *name = [group valueForProperty:ALAssetsGroupPropertyName];
            [groupNames addObject:name];
            [groups addObject:group];
        } else {
            self.groups = groups.copy;
            dispatch_group_leave(groupT);
            NSLog(@"%@", [NSThread currentThread]);

        }
        
    } failureBlock:^(NSError *error) {
//        dispatch_group_leave(groupT);
    }];
    NSLog(@"before wait");
//    dispatch_group_wait(groupT, DISPATCH_TIME_FOREVER);
    dispatch_group_notify(groupT, dispatch_get_main_queue(), ^{
        NSLog(@"nitigy");
    });
    NSLog(@"after wait");
    return groupNames;
}
@end
