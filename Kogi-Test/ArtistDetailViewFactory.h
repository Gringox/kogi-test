//
//  ArtistDetailViewFactory.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ArtistDetailView;
@class ArtistModel;

@interface ArtistDetailViewFactory : NSObject

+ (ArtistDetailView *)initArtistDetailViewWithArtist:(ArtistModel *)artist;

@end
