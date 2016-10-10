//
//  ArtistDetailView.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import "ArtistDetailView.h"
#import "ArtistModel.h"
#import "ArtistDetailViewPresenterInterface.h"

@implementation ArtistDetailView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.artist.name;
    
    [[XLFormViewController cellClassesForRowDescriptorTypes]
     setObject:@"ArtistDetailViewAlbumCell" forKey:@"ArtistDetailViewAlbumCell"];
    
    [self.presenter loadAlbums];
}

#pragma mark - Interface

- (XLFormViewController *)viewController {
    return self;
}

- (XLFormDescriptor *)getForm {
    return self.form;
}

- (ArtistModel *)getArtist {
    return self.artist;
}

- (void)setXLFromDescriptorUsing:(XLFormDescriptor *)form {
    self.form = form;
}

@end
