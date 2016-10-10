//
//  ArtistListViewFactory.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/6/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import "ArtistListViewFactory.h"

#import "ArtistListView.h"
#import "ArtistListViewPresenter.h"
#import "ArtistListFactory.h"
#import "ArtistListViewRouter.h"

// Interfaces
#import "ArtistListViewInterface.h"
#import "ArtistListViewPresenterInterface.h"
#import "ArtistListDataStoreInterface.h"
#import "ArtistListViewRouterInterface.h"

@implementation ArtistListViewFactory

+ (void)initArtistListViewVIPER:(ArtistListView *)view {
    view.presenter = [ArtistListViewFactory initPresenterWithView:view];
}

+ (id<ArtistListViewPresenterInterface>)initPresenterWithView:(ArtistListView *)view {
    ArtistListViewPresenter *presenter = [[ArtistListViewPresenter alloc] init];
    presenter.view = view;
    presenter.dataStore = [ArtistListFactory initArtistListModule];
    presenter.router = [ArtistListViewFactory initRouter];
    return presenter;
}

+ (id<ArtistListViewRouterInterface>)initRouter {
    return [[ArtistListViewRouter alloc] init];
}

@end
