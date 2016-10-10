//
//  ArtistDetailRepository.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import "ArtistDetailRepository.h"
#import "APIClient.h"
#import "NSDictionary+Validation.h"
#import "AlbumModel.h"

@implementation ArtistDetailRepository

+ (NSArray<AlbumModel *> *)initAlbumsFromArray:(NSArray *)rawAlbums {
    
    __block NSMutableArray<AlbumModel *> *albums;
    albums = [[NSMutableArray<AlbumModel *> alloc] init];
    
    __block BOOL error = NO;
    [rawAlbums enumerateObjectsUsingBlock:^(id  _Nonnull obj,
                                            NSUInteger idx,
                                            BOOL * _Nonnull stop) {
        
        AlbumModel *album = [AlbumModel initAlbumFromDictionary:obj];
        
        if (album) {
            [albums addObject:album];
        }else{
            error = YES;
            *stop = YES;
        }
    }];
    
    return error ? nil : [NSArray arrayWithArray:albums];
}

+ (void)sendHTTPRequestForAlbumsWithArtistId:(NSString *)artistId
                                   onSuccess:(void (^)(NSArray<AlbumModel *> *))successCallback
                                   onFailure:(void (^)())failureCallback {
    
    NSString* url = [[@"artists/" stringByAppendingString:artistId]
                     stringByAppendingString:@"/albums"];
    
    APIClient *apiClient = [APIClient sharedClient];
    
    [apiClient GET:url parameters:nil progress:nil
    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *response = (NSDictionary *)responseObject;
        
        if (![response isKindOfClass:[NSDictionary class]]) {
            return failureCallback();
        }
        
        NSArray *rawAlbumsArray = [response arrayForKey:@"items"];
        
        if (!rawAlbumsArray) {
            return failureCallback();
        }
        
        NSArray<AlbumModel *> *albums = [ArtistDetailRepository
                                         initAlbumsFromArray:rawAlbumsArray];
        
        if (!albums) {
            failureCallback();
        }
        
        successCallback(albums);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureCallback();
    }];
}

@end
