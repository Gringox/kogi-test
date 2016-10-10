//
//  ArtistDetailDataStore.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import "ArtistDetailDataStore.h"
#import "ArtistDetailRepository.h"
#import "AlbumModel.h"

@interface ArtistDetailDataStore ()

@property (nonatomic, strong) NSArray<AlbumModel *> *albums;

@end

@implementation ArtistDetailDataStore

- (NSInteger)getNumberOfAlbums {
    return self.albums.count;
}

- (AlbumModel *)getAlbumAtIndex:(NSInteger)index {
    return self.albums[index];
}

- (void)sendHTTPRequestForAlbumsWithArtistId:(NSString *)artistId
                                   onSuccess:(void (^)())successCallback
                                   onFailure:(void (^)())failureCallback {
    
    [ArtistDetailRepository sendHTTPRequestForAlbumsWithArtistId:artistId
    onSuccess:^(NSArray<AlbumModel *> *albums) {
                                                       
       if (albums) {
           self.albums = albums;
           successCallback();
       }else{
           failureCallback();
       }
       
   } onFailure:failureCallback];
    
}

@end
