//
//  ArtistListViewRouterInterface.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

@class ArtistModel;

@protocol ArtistListViewRouterInterface <NSObject>

- (void)goToArtistDetailWithArtist:(ArtistModel *)artist
                            fromVC:(UIViewController *)fromVC;

@end
