//
//  ArtistDetailViewFormBuilderInteractorInterface.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

@class XLFormDescriptor;
@class ArtistModel;

@protocol ArtistDetailViewFormBuilderInteractorInterface <NSObject>

- (XLFormDescriptor *)initializeFormWithArtist:(ArtistModel *)artist;

@end
