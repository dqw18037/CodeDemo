//
//  TKHomeCategoryView.m
//  Teenker
//
//  Created by dqw on 16/1/13.
//  Copyright © 2016年 Xboy. All rights reserved.
//

#import "TKServiceCategoryView.h"

CGFloat const kServiewCategoryCellSize = 50;
static NSString *const kServiceCategoryCellID = @"serviceCategoryCellID";

@interface TKServiceCategoryView ()<UICollectionViewDataSource, UICollectionViewDelegate>
{
    
}

@property (nonatomic, strong) UICollectionView *collectionView;


@end

@implementation TKServiceCategoryView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

#pragma mark - UICollectionView DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    return self.categorys.count;
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TKServiceCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kServiceCategoryCellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}
- (void)initView
{
    [self addSubview:self.collectionView];
    self.collectionView.frame = self.bounds;
    self.collectionView.backgroundColor = [UIColor yellowColor];
}



#pragma mark - Setters && Getters

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection =  UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = CGSizeMake(65, 65);
        flowLayout.minimumLineSpacing = 100;
        flowLayout.minimumInteritemSpacing = 100;
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 50, 5, 15);
        //        flowLayout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:flowLayout];
        [_collectionView registerClass:[TKServiceCategoryCell class] forCellWithReuseIdentifier:kServiceCategoryCellID];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
//        _collectionView
        
    }
    return _collectionView;
}

@end


@implementation TKServiceCategoryCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIView *view = [[UIView alloc]initWithFrame:frame];
        
    }
    return self;
}

@end
