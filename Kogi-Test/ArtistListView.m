//
//  ArtistListView.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/6/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import "ArtistListView.h"
#import "ArtistListViewFactory.h"
#import "ArtistListCollectionViewCell.h"
#import "ArtistListViewCollectionLayout.h"
#import "ArtistListViewPresenterInterface.h"

@interface ArtistListView ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ArtistListView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ArtistListViewFactory initArtistListViewVIPER:self];
    
    UINib *nib = [UINib nibWithNibName:@"ArtistListCollectionViewCell"
                                bundle: nil];
    
    [self.collectionView registerNib:nib
          forCellWithReuseIdentifier:@"ArtistListCollectionViewCell"];
    
    self.collectionView.allowsSelection = YES;
    
    self.collectionView.delegate = self.presenter;
    self.collectionView.dataSource = self.presenter;
    
    self.collectionView.collectionViewLayout = [[ArtistListViewCollectionLayout alloc]
                                                init];
}

@end
