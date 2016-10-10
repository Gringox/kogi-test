//
//  ArtistDetailViewInterface.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

@class ArtistModel;

@protocol ArtistDetailViewInterface <NSObject>

- (XLFormViewController *)viewController;

- (XLFormDescriptor *)getForm;

- (ArtistModel *)getArtist;

- (void)setXLFromDescriptorUsing:(XLFormDescriptor *)form;

@end
