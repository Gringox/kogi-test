//
//  ArtistDetailView.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <XLForm/XLForm.h>
#import "ArtistDetailViewInterface.h"

@class ArtistModel;

@protocol ArtistDetailViewPresenterInterface;

@interface ArtistDetailView : XLFormViewController <ArtistDetailViewInterface>

@property (nonatomic, strong) ArtistModel *artist;
@property (nonatomic) id<ArtistDetailViewPresenterInterface> presenter;

@end
