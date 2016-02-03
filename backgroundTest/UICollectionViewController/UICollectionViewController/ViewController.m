//
//  ViewController.m
//  UICollectionViewController
//
//  Created by dqw on 16/1/13.
//  Copyright © 2016年 dqw. All rights reserved.
//

#import "ViewController.h"
#import "ddCollectionViewController.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    UICollectionView *_coll;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(100, 100);
    //    self.collectionView.collectionViewLayout = layout;
        _coll = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
        _coll.dataSource = self;
        _coll.delegate = self;
    
    [self.view addSubview:_coll];
        self.view.backgroundColor = [UIColor whiteColor];
    
     [_coll registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"xx"];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"xx" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    ddCollectionViewController *vc = [[ddCollectionViewController alloc]init];
//
//    [self presentViewController:vc animated:YES completion:nil];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
