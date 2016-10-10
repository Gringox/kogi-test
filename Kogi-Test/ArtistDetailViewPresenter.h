//
//  ArtistDetailViewPresenter.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArtistDetailViewPresenterInterface.h"

@protocol ArtistDetailViewInterface;
@protocol ArtistDetailViewFormBuilderInteractorInterface;
@protocol ArtistDetailDataStoreInterface;

@interface ArtistDetailViewPresenter : NSObject <ArtistDetailViewPresenterInterface>

@property (nonatomic) id<ArtistDetailViewInterface> view;
@property (nonatomic) id<ArtistDetailViewFormBuilderInteractorInterface> formBuilderInteractor;
@property (nonatomic) id<ArtistDetailDataStoreInterface> dataStore;

@end
