//
//  ArtistListViewCollectionLayout.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/6/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import "ArtistListViewCollectionLayout.h"

@implementation ArtistListViewCollectionLayout

- (instancetype)init {
    self = [super init];
    if (self) {
        self.minimumLineSpacing = 1.0;
        self.minimumInteritemSpacing = 1.0;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return self;
}

- (CGSize)itemSize {
    NSInteger numberOfColumns = 2;
    
    CGFloat itemWidth = (CGRectGetWidth(self.collectionView.frame) -
                         (numberOfColumns - 1)) / numberOfColumns;
    return CGSizeMake(itemWidth, itemWidth);
}

@end
