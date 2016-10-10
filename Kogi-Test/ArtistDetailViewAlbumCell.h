//
//  ArtistDetailViewAlbumCell.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <XLForm/XLForm.h>

@class AlbumModel;

@interface ArtistDetailViewAlbumCell : XLFormBaseCell <XLFormDescriptorCell>

@property (weak, nonatomic) IBOutlet UIImageView *albumImage;
@property (weak, nonatomic) IBOutlet UILabel *albumName;
@property (weak, nonatomic) IBOutlet UILabel *availableMarkets;

- (void)initWithAlbum:(AlbumModel *)album;

@end
