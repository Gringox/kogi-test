//
//  ArtistDetailFactory.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ArtistDetailDataStoreInterface;

@interface ArtistDetailFactory : NSObject

+ (id<ArtistDetailDataStoreInterface>)initArtistDetailModule;

@end
