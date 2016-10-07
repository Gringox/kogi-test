//
//  ArtistModel.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/7/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArtistModel : NSObject

@property (nonatomic, strong) NSString *artistId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imageMediumUrl;
@property (nonatomic, strong) NSString *imageLargeUrl;
@property (nonatomic, strong) NSNumber *followers;
@property (nonatomic, strong) NSNumber *popularity;

+ (ArtistModel *)initArtistFromDictionary:(NSDictionary *)dictionary;

@end
