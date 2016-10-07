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
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

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
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.collectionView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self
                            action:@selector(refreshTable)
                  forControlEvents:UIControlEventValueChanged];
    
    self.collectionView.collectionViewLayout = [[ArtistListViewCollectionLayout alloc]
                                                init];
    
    self.searchBar.delegate = self.presenter;
}

#pragma mark - Utilities

- (void)refreshTable {
    [self.presenter loadArtist];
}

#pragma mark - Interfaces

- (UIViewController *)viewController {
    return self;
}

- (UICollectionView *)getUICollectionView {
    return self.collectionView;
}

- (UISearchBar *)getUISearchBar {
    return self.searchBar;
}

- (UIRefreshControl *)getUIRefreshControl {
    return self.refreshControl;
}

@end
