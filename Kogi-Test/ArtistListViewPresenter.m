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
#import "ArtistModel.h"
#import "ArtistListDataStoreInterface.h"

@implementation ArtistListViewPresenter

#pragma mark - Services

- (void)loadArtist {
    
    id success = ^{
        [[self.view getUICollectionView] reloadData];
    };
    
    id failure = ^{
        // do error
    };
    
    [self.dataStore sendHTTPRequestForArtistsWithQuery:@"chino y nacho"
                                             onSuccess:success
                                             onFailure:failure];
}

#pragma mark - Collection View Data Source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return [self.dataStore getNumberOfArtists];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ArtistListCollectionViewCell *cell;
    
    cell = (ArtistListCollectionViewCell*)[collectionView
                                           dequeueReusableCellWithReuseIdentifier:
                                           @"ArtistListCollectionViewCell"
                                           forIndexPath:indexPath];
    
    ArtistModel *artist = [self.dataStore getArtistAtIndex:indexPath.row];
    
    [cell initCellWithArtist:artist];
    
    return cell;
}

#pragma mark - Collection View Delegates

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Collection view cell selected");
}

@end
