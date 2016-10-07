//
//  ArtistListRepository.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/6/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ArtistModel;

@interface ArtistListRepository : NSObject

+ (void)sendHTTPRequestForArtistsWithQuery:(NSString *)query
                                 onSuccess:(void (^)(NSArray<ArtistModel *> *))successCallback
                                 onFailure:(void (^)())failureCallback;

@end
