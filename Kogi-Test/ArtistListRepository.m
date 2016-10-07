//
//  ArtistListRepository.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/6/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import "ArtistListRepository.h"
#import "APIClient.h"
#import "ArtistModel.h"
#import "NSString+URLEncode.h"
#import "NSDictionary+Validation.h"

@implementation ArtistListRepository

+ (NSArray<ArtistModel *> *)initArtistArrayFromRawArray:(NSArray *)rawArtistArray {

    __block NSMutableArray<ArtistModel *> *artists = [[NSMutableArray<ArtistModel *> alloc]
                                                     init];
    
    __block BOOL error = NO;
    
    [rawArtistArray enumerateObjectsUsingBlock:^(id  _Nonnull obj,
                                                 NSUInteger idx,
                                                 BOOL * _Nonnull stop) {
        
        ArtistModel *artist = [ArtistModel initArtistFromDictionary:obj];
        
        if (artist) {
            [artists addObject:artist];
        }else{
            error = YES;
            *stop = YES;
        }
        
    }];
    
    return error ? nil : [NSArray arrayWithArray:artists];
}

+ (void)sendHTTPRequestForArtistsWithQuery:(NSString *)query
                                 onSuccess:(void (^)(NSArray<ArtistModel *> *))successCallback
                                 onFailure:(void (^)())failureCallback {
    
    APIClient *apiClient = [APIClient sharedClient];
    
    NSString *service = @"search";
    
    NSDictionary *params = @{
        @"type": @"artist",
        @"q": [query urlencode]
    };
    
    [apiClient GET:service parameters:params progress:nil
    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *response = (NSDictionary *)responseObject;
        
        if (![response isKindOfClass:[NSDictionary class]]) {
            return failureCallback();
        }
        
        response = [response dictionaryForKey:@"artists"];
        
        if (!response) {
            return failureCallback();
        }
        
        NSArray *rawArtistsArray = [response arrayForKey:@"items"];
        
        if (!rawArtistsArray) {
            return failureCallback();
        }
        
        NSArray<ArtistModel *> *artists = [ArtistListRepository
                                           initArtistArrayFromRawArray:rawArtistsArray];
        
        if (artists) {
            successCallback(artists);
        }else{
            failureCallback();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureCallback();
    }];
}

@end
