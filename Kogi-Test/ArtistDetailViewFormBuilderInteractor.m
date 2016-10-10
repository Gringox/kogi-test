//
//  ArtistDetailViewFormBuilderInteractor.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <XLForm/XLForm.h>
#import "ArtistDetailViewFormBuilderInteractor.h"
#import "ArtistModel.h"
#import "ArtistDetailDataStoreInterface.h"
#import "AlbumModel.h"

@implementation ArtistDetailViewFormBuilderInteractor

- (XLFormDescriptor *)initializeFormWithArtist:(ArtistModel *)artist {
    
    XLFormDescriptor *form = [XLFormDescriptor formDescriptor];
    XLFormSectionDescriptor *section;
    XLFormRowDescriptor *row;
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Basic info"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor
           formRowDescriptorWithTag:@"popularity"
           rowType:XLFormRowDescriptorTypeText
           title:@"Popularity"];
    row.value = [artist.popularity stringValue];
    [row.cellConfig setValue:[NSNumber numberWithInteger:NSTextAlignmentRight]
                      forKey:@"textField.textAlignment"];
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor
           formRowDescriptorWithTag:@"followers"
           rowType:XLFormRowDescriptorTypeText
           title:@"Followers"];
    row.value = [artist.followers stringValue];
    [row.cellConfig setValue:[NSNumber numberWithInteger:NSTextAlignmentRight]
                      forKey:@"textField.textAlignment"];
    row.disabled = @YES;
    [section addFormRow:row];
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Albums"];
    [form addFormSection:section];
    
    for (int i = 0; i < [self.dataStore getNumberOfAlbums]; i++) {
        NSString *tag = [NSString stringWithFormat:@"%d", i];
        tag = [@"album" stringByAppendingString:tag];
        row = [XLFormRowDescriptor formRowDescriptorWithTag:tag
                                                    rowType:@"ArtistDetailViewAlbumCell"];
        row.disabled = @YES;
        [section addFormRow:row];
    }
    
    return form;
}

@end
