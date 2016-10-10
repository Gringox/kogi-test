//
//  ArtistDetailDataStoreInterface.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

@class AlbumModel;

@protocol ArtistDetailDataStoreInterface <NSObject>

- (NSInteger)getNumberOfAlbums;

- (AlbumModel *)getAlbumAtIndex:(NSInteger)index;

- (void)sendHTTPRequestForAlbumsWithArtistId:(NSString *)artistId
                                   onSuccess:(void (^)())successCallback
                                   onFailure:(void (^)())failureCallback;

@end
