//
//  ArtistDetailViewFactory.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArtistDetailViewFactory.h"
#import "ArtistModel.h"
#import "ArtistDetailView.h"
#import "ArtistDetailViewPresenter.h"
#import "ArtistDetailViewFormBuilderInteractor.h"
#import "ArtistDetailFactory.h"

// Interface
#import "ArtistDetailViewInterface.h"
#import "ArtistDetailViewPresenterInterface.h"
#import "ArtistDetailViewFormBuilderInteractorInterface.h"
#import "ArtistDetailDataStoreInterface.h"

@implementation ArtistDetailViewFactory

+ (ArtistDetailView *)initArtistDetailViewWithArtist:(ArtistModel *)artist {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Artist"
                                                         bundle:nil];
    
    ArtistDetailView *view = (ArtistDetailView *)
    [storyboard instantiateViewControllerWithIdentifier:@"ArtistDetailView"];
    
    view.artist = artist;
    view.presenter = [ArtistDetailViewFactory initPresenterWithView:view];
    
    return view;
}

+ (id<ArtistDetailViewPresenterInterface>)initPresenterWithView:(ArtistDetailView *)view {
    
    ArtistDetailViewPresenter *presenter = [[ArtistDetailViewPresenter alloc] init];
    
    presenter.view = view;
    
    id<ArtistDetailDataStoreInterface> dataStore = [ArtistDetailFactory
                                                    initArtistDetailModule];
    presenter.dataStore = dataStore;
    
    presenter.formBuilderInteractor = [ArtistDetailViewFactory
                                       initFormBuilderInteractorWithDataStore:dataStore];
    
    return presenter;
}

+ (id<ArtistDetailViewFormBuilderInteractorInterface>)initFormBuilderInteractorWithDataStore:(id<ArtistDetailDataStoreInterface>)dataStore {
    ArtistDetailViewFormBuilderInteractor *interactor;
    interactor =[[ArtistDetailViewFormBuilderInteractor alloc] init];
    interactor.dataStore = dataStore;
    return interactor;
}

@end
