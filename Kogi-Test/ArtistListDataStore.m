//
//  ArtistListDataStore.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/6/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import "ArtistListDataStore.h"
#import "ArtistModel.h"
#import "ArtistListRepository.h"

@interface ArtistListDataStore ()

@property (nonatomic, strong) NSArray<ArtistModel *> *artists;

@end

@implementation ArtistListDataStore

- (NSInteger)getNumberOfArtists {
    return self.artists.count;
}

- (ArtistModel *)getArtistAtIndex:(NSInteger)index {
    return self.artists[index];
}

- (void)sendHTTPRequestForArtistsWithQuery:(NSString *)query
                                 onSuccess:(void (^)())successCallback
                                 onFailure:(void (^)())failureCallback {

    [ArtistListRepository sendHTTPRequestForArtistsWithQuery:query
    onSuccess:^(NSArray<ArtistModel *> *artists) {
        
        if (artists) {
            self.artists = artists;
            successCallback();
        }else{
            failureCallback();
        }
        
    } onFailure:failureCallback];
    
}

@end
