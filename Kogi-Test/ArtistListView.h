//
//  ArtistListView.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/6/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArtistListViewInterface.h"

@protocol ArtistListViewPresenterInterface;

@interface ArtistListView : UIViewController <ArtistListViewInterface>

@property (nonatomic) id<ArtistListViewPresenterInterface> presenter;

@end
