//
//  AlbumModel.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import "AlbumModel.h"
#import "NSDictionary+Validation.h"

@implementation AlbumModel

+ (AlbumModel *)initAlbumFromDictionary:(NSDictionary *)dictionary {
    
    AlbumModel *album = [[AlbumModel alloc] init];
    
    album.name = [dictionary stringForKey:@"name"];
    
    NSArray *images = [dictionary arrayForKey:@"images"];
    if (images) {
        NSDictionary *image = [images firstObject];
        if (image && [image isKindOfClass:[NSDictionary class]]) {
            album.imageUrl = [image stringForKey:@"url"];
        }
    }
    
    NSArray *markets = [dictionary arrayForKey:@"available_markets"];
    if (markets && markets.count <= 5) {
        album.markets = [markets componentsJoinedByString:@", "];
    }
    
    NSDictionary *externalUrls = [dictionary dictionaryForKey:@"external_urls"];
    if (externalUrls) {
        album.spotifyUrl = [externalUrls stringForKey:@"spotify"];
    }
    
    return album.name ? album : nil;
}

@end
