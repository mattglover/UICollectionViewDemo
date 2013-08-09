//
//  RootViewController.m
//  CollectionViewDemo
//
//  Created by Matt Glover on 05/08/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import "RootViewController.h"
#import "CustomCollectionViewFlowLayout.h"
#import "CustomCollectionViewCell.h"

static NSString * const collectionViewCellID = @"CustomCollectionViewCell";

@interface RootViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CustomCollectionViewFlowLayout *flowLayoutA;
@property (nonatomic, strong) CustomCollectionViewFlowLayout *flowLayoutB;
@property (nonatomic, strong) NSIndexPath *previousIndexPath;
@end

@implementation RootViewController

#pragma mark - View Controller
- (void)awakeFromNib {
  [super awakeFromNib];
  
  [self setupFlowLayoutA];
  [self setupFlowLayoutB];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  CustomCollectionViewFlowLayout *flowLayout = [self flowLayoutA];
  
  _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
  [_collectionView setAutoresizingMask:~UIViewAutoresizingNone];
  [_collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellID];
  [_collectionView setDataSource:self];
  [_collectionView setDelegate:self];
  
  [_collectionView setCollectionViewLayout:flowLayout animated:YES];
  
  [self.view addSubview:_collectionView];
}

#pragma mark - Collection View Datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 300;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
  CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellID forIndexPath:indexPath];
  
  BOOL isEven = (indexPath.item % 2 == 0) ? YES : NO;
  if (isEven) {
    [cell setBackgroundColor:[UIColor lightGrayColor]];
  } else {
    [cell setBackgroundColor:[UIColor greenColor]];
  }
  
  return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  
  CustomCollectionViewFlowLayout *newFlowLayout = nil;
  
  if (indexPath == _previousIndexPath) {
    // Same Item Selected : Toggle Flow
    newFlowLayout = (_collectionView.collectionViewLayout == _flowLayoutA) ? [self flowLayoutB] : [self flowLayoutA];
  }
  
  else if(indexPath != _previousIndexPath && _collectionView.collectionViewLayout == _flowLayoutA) {
    // Different Item Selected (thumbnail) : Switch to Large
    newFlowLayout = [self flowLayoutB];
  }
  
  // swap out flow layout if necessary
  if (newFlowLayout) {
    [_collectionView setCollectionViewLayout:newFlowLayout animated:YES];
  }
  
  // Always reset the view based on the selected cell
  [_collectionView scrollToItemAtIndexPath:indexPath
                          atScrollPosition:UICollectionViewScrollPositionCenteredVertically
                                  animated:YES];
  
  [self setPreviousIndexPath:indexPath];
}

#pragma mark - Setup
- (void)setupFlowLayoutA {
  CustomCollectionViewFlowLayout *flowLayout = [CustomCollectionViewFlowLayout flowLayoutWithItemSize:CGSizeMake(90, 90)
                                                                                   minimumLineSpacing:10.0f
                                                                              minimumInterItemSpacing:10.0f
                                                                                         sectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
  [self setFlowLayoutA:flowLayout];
}

- (void)setupFlowLayoutB {
  CustomCollectionViewFlowLayout *flowLayout = [CustomCollectionViewFlowLayout flowLayoutWithItemSize:CGSizeMake(300 , 270)
                                                                                   minimumLineSpacing:30.0f
                                                                              minimumInterItemSpacing:10.0f
                                                                                         sectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
  [self setFlowLayoutB:flowLayout];
}

@end
