//
//  ArtistListCollectionViewCell.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/6/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <AFNetworking/UIImageView+AFNetworking.h>
#import "ArtistListCollectionViewCell.h"
#import "ArtistModel.h"

@interface ArtistListCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *artistMediumImage;
@property (weak, nonatomic) IBOutlet UILabel *artistName;
@property (weak, nonatomic) IBOutlet UILabel *artistPopularity;
@property (weak, nonatomic) IBOutlet UILabel *artistFollowers;

@end

@implementation ArtistListCollectionViewCell

- (void)initCellWithArtist:(ArtistModel *)artist {
    self.artistName.text = artist.name;
    self.artistPopularity.text = [artist.popularity stringValue];
    self.artistFollowers.text = [artist.followers stringValue];
    
    if (artist.imageMediumUrl) {
        [self.artistMediumImage setImageWithURL:[NSURL URLWithString:artist.imageMediumUrl]
                               placeholderImage:[UIImage imageNamed:@"empty_artists.jpg"]];
    }else{
        [self.artistMediumImage setImage:[UIImage imageNamed:@"empty_artists.jpg"]];
    }
}

@end
