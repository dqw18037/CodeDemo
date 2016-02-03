//
//  ViewController.m
//  tableviewHeaderScroll
//
//  Created by dqw on 16/1/15.
//  Copyright © 2016年 dqw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UITableView *tab = [[UITableView alloc]init];
    [self.view addSubview:tab];
    tab.frame = self.view.bounds;
    tab.rowHeight = 100;
    tab.delegate = self;
    tab.dataSource = self;
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    UICollectionViewFlowLayout *lay = [[UICollectionViewFlowLayout alloc]init];
    lay.itemSize = CGSizeMake(width * 0.5, 100);
    lay.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    lay.minimumLineSpacing = 20;
    CGRect rect = CGRectMake(0, 0, width, 100);
    UICollectionView *coll = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:lay];
    coll.delegate = self;
    coll.dataSource = self;
    tab.tableHeaderView = coll;
    [coll registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"xx"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"xx" forIndexPath:indexPath];
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor =[ UIColor redColor];
    }
    else
    {
        cell.backgroundColor = [UIColor yellowColor];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.backgroundColor = [UIColor redColor];
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor blueColor];
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
