//
//  ArtistListViewPresenter.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/6/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import "ArtistListViewPresenter.h"
#import "ArtistListCollectionViewCell.h"
#import "ArtistListViewInterface.h"

@implementation ArtistListViewPresenter

#pragma mark - Collection View Data Source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ArtistListCollectionViewCell *cell;
    
    cell = (ArtistListCollectionViewCell*)[collectionView
                                           dequeueReusableCellWithReuseIdentifier:
                                           @"ArtistListCollectionViewCell"
                                           forIndexPath:indexPath];
    
    // Bank *bank = [self.dataStore getBankAtIndex:indexPath.row];
    
    // [cell initCellWith:bank];
    
    return cell;
}

#pragma mark - Collection View Delegates

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Collection view cell selected");
}

@end
