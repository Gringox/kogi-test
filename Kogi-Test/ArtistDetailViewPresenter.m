//
//  ArtistDetailViewPresenter.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <XLForm/XLForm.h>
#import "ArtistDetailViewPresenter.h"
#import "ArtistDetailViewInterface.h"
#import "ArtistDetailViewFormBuilderInteractorInterface.h"
#import "ArtistDetailDataStoreInterface.h"
#import "AlbumModel.h"
#import "ArtistModel.h"
#import "ArtistDetailViewAlbumCell.h"

@implementation ArtistDetailViewPresenter

#pragma mark - Services

- (void)loadAlbums {
    
    id success = ^{
        [self initForm];
    };
    
    id failure = ^{
        // Show error
    };
    
    ArtistModel *artist = [self.view getArtist];
    
    [self.dataStore sendHTTPRequestForAlbumsWithArtistId:artist.artistId
                                               onSuccess:success
                                               onFailure:failure];
}

- (void)initForm {
    ArtistModel *artist = [self.view getArtist];
    
    XLFormDescriptor *form = [self.formBuilderInteractor initializeFormWithArtist:artist];
        
    [self.view setXLFromDescriptorUsing:form];
    
    [self setAlbumData];
}

- (void)setAlbumData {
    for (int i = 0; i < [self.dataStore getNumberOfAlbums]; i++) {
        
        NSString *tag = [NSString stringWithFormat:@"%d", i];
        tag = [@"album" stringByAppendingString:tag];
        
        XLFormRowDescriptor *albumRow = [[self.view getForm] formRowWithTag:tag];
        
        ArtistDetailViewAlbumCell *cell = (ArtistDetailViewAlbumCell *)[albumRow
                                        cellForFormController:[self.view viewController]];
        
        AlbumModel *album = [self.dataStore getAlbumAtIndex:i];
        
        [cell initWithAlbum:album];
    }
}

@end
