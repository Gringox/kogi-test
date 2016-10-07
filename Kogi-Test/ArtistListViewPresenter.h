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

@interface ArtistListViewPresenter : NSObject <ArtistListViewPresenterInterface>

@property (nonatomic) id<ArtistListViewInterface> view;

@end
