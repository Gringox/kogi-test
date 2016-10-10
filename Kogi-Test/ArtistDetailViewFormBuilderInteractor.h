//
//  ArtistDetailViewFormBuilderInteractor.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArtistDetailViewFormBuilderInteractorInterface.h"

@protocol ArtistDetailDataStoreInterface;

@interface ArtistDetailViewFormBuilderInteractor : NSObject <ArtistDetailViewFormBuilderInteractorInterface>

@property (nonatomic) id<ArtistDetailDataStoreInterface> dataStore;

@end
