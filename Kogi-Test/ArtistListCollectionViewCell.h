//
//  ArtistListCollectionViewCell.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/6/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ArtistModel;

@interface ArtistListCollectionViewCell : UICollectionViewCell

- (void)initCellWithArtist:(ArtistModel *)artist;

@end
