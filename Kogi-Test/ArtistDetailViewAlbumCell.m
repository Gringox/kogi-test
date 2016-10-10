//
//  ArtistDetailViewAlbumCell.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <AFNetworking/UIImageView+AFNetworking.h>
#import "ArtistDetailViewAlbumCell.h"
#import "AlbumModel.h"

@interface ArtistDetailViewAlbumCell ()

@property (nonatomic, strong) NSString *spotifyUrl;

@end

@implementation ArtistDetailViewAlbumCell

#pragma mark - Constructs

- (void)initWithAlbum:(AlbumModel *)album {
    
    self.albumName.text = album.name;
    
    self.spotifyUrl = album.spotifyUrl;
    
    if (album.markets) {
        self.availableMarkets.text = album.markets;
    }else{
        self.availableMarkets.text = @"-";
    }
    
    [self.albumImage setImageWithURL:[NSURL URLWithString:album.imageUrl]
                    placeholderImage:[UIImage imageNamed:@"empty_album.png"]];
}

#pragma mark - XLFormDescriptorCell Delegates

- (void)configure {
    [super configure];
    
    self.albumImage.layer.cornerRadius = 30;
    self.albumImage.layer.masksToBounds = YES;
}

- (void)update {
    [super update];
}

+ (CGFloat)formDescriptorCellHeightForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor {
    return 82;
}

#pragma mark - Actions

- (IBAction)goToAlbumUrlInSpotify:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:self.spotifyUrl];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

@end
