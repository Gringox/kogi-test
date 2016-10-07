//
//  ArtistModel.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/7/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import "ArtistModel.h"
#import "NSDictionary+Validation.h"

@implementation ArtistModel

+ (ArtistModel *)initArtistFromDictionary:(NSDictionary *)dictionary {
    
    __block ArtistModel *artist = [[ArtistModel alloc] init];
    
    artist.artistId = [dictionary stringForKey:@"id"];
    artist.name = [dictionary stringForKey:@"name"];
    artist.popularity = [dictionary numberForKey:@"popularity"];
    
    NSDictionary *followersDict = [dictionary dictionaryForKey:@"followers"];
    if (followersDict) {
        artist.followers = [followersDict numberForKey:@"total"];
    }
    
    NSArray *imagesArray = [dictionary arrayForKey:@"images"];
    if (imagesArray && imagesArray.count > 0) {
        [imagesArray enumerateObjectsUsingBlock:^(id  _Nonnull obj,
                                                 NSUInteger idx,
                                                 BOOL * _Nonnull stop) {
            
            NSDictionary *imageDict = (NSDictionary *)obj;
            
            if (![imageDict isKindOfClass:[NSDictionary class]]) {
                *stop = YES;
            }
            
            NSString *imageUrl = [imageDict stringForKey:@"url"];
            
            if (!imageUrl) {
                *stop = YES;
            }
            
            if (!artist.imageLargeUrl) {
                artist.imageLargeUrl = imageUrl;
            }else{
                artist.imageMediumUrl = imageUrl;
                *stop = YES;
            }
            
        }];
    }
    
    return [artist noNilAttributes] ? artist : nil;
}

- (BOOL)noNilAttributes {
    return self.artistId &&
    self.name &&
    self.popularity &&
    self.followers;
}

@end
