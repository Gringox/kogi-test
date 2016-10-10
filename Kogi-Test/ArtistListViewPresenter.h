//
//  ArtistListViewPresenter.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/6/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ArtistListViewPresenterInterface.h"

@protocol ArtistListViewInterface;
@protocol ArtistListDataStoreInterface;
@protocol ArtistListViewRouterInterface;

@interface ArtistListViewPresenter : NSObject <ArtistListViewPresenterInterface>

@property (nonatomic) id<ArtistListViewInterface> view;
@property (nonatomic) id<ArtistListDataStoreInterface> dataStore;
@property (nonatomic) id<ArtistListViewRouterInterface> router;

@end
