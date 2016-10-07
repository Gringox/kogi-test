//
//  ArtistListDataStoreInterface.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/6/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

@class ArtistModel;

@protocol ArtistListDataStoreInterface <NSObject>

- (NSInteger)getNumberOfArtists;

- (ArtistModel *)getArtistAtIndex:(NSInteger)index;

- (void)sendHTTPRequestForArtistsWithQuery:(NSString *)query
                                 onSuccess:(void (^)())successCallback
                                 onFailure:(void (^)())failureCallback;

@end
