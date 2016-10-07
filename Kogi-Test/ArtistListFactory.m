//
//  ArtistListFactory.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/7/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import "ArtistListFactory.h"
#import "ArtistListDataStore.h"

// Interfaces
#import "ArtistListDataStoreInterface.h"

@implementation ArtistListFactory

+ (id<ArtistListDataStoreInterface>)initArtistListModule {
    return [[ArtistListDataStore alloc] init];
}

@end
