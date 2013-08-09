//
//  CustomCollectionViewFlowLayout.m
//  CollectionViewDemo
//
//  Created by Matt Glover on 06/08/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import "CustomCollectionViewFlowLayout.h"

@implementation CustomCollectionViewFlowLayout

+ (id)flowLayoutWithItemSize:(CGSize)itemSize minimumLineSpacing:(CGFloat)lineSpacing minimumInterItemSpacing:(CGFloat)spacing sectionInset:(UIEdgeInsets)inset {
  
  id flowLayout = [[[self class] alloc] init];
  
  [flowLayout setItemSize:itemSize];
  [flowLayout setMinimumLineSpacing:lineSpacing];
  [flowLayout setMinimumInteritemSpacing:spacing];
  [flowLayout setSectionInset:inset];
  
  return flowLayout;
}

@end
