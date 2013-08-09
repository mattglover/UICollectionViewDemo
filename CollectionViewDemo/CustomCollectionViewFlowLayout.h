//
//  CustomCollectionViewFlowLayout.h
//  CollectionViewDemo
//
//  Created by Matt Glover on 06/08/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewFlowLayout : UICollectionViewFlowLayout

// Simple helper for the demo
+ (id)flowLayoutWithItemSize:(CGSize)itemSize minimumLineSpacing:(CGFloat)lineSpacing minimumInterItemSpacing:(CGFloat)spacing sectionInset:(UIEdgeInsets)inset;

@end
