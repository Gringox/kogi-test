//
//  ArtistDetailFactory.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import "ArtistDetailFactory.h"
#import "ArtistDetailDataStore.h"

// Interfaces
#import "ArtistDetailDataStoreInterface.h"

@implementation ArtistDetailFactory

+ (id<ArtistDetailDataStoreInterface>)initArtistDetailModule {
    return [[ArtistDetailDataStore alloc] init];
}

@end
