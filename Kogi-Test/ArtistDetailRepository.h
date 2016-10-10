//
//  ArtistDetailRepository.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AlbumModel;

@interface ArtistDetailRepository : NSObject

+ (void)sendHTTPRequestForAlbumsWithArtistId:(NSString *)artistId
                                   onSuccess:(void (^)(NSArray<AlbumModel *> *))successCallback
                                   onFailure:(void (^)())failureCallback;

@end
