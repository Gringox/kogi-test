//
//  ArtistListViewRouter.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArtistListViewRouter.h"
#import "ArtistModel.h"
#import "ArtistDetailViewFactory.h"
#import "ArtistDetailView.h"

@implementation ArtistListViewRouter

- (void)goToArtistDetailWithArtist:(ArtistModel *)artist
                            fromVC:(UIViewController *)fromVC {
    
    ArtistDetailView *toVC = [ArtistDetailViewFactory
                              initArtistDetailViewWithArtist:artist];
    
    [fromVC.navigationController pushViewController:toVC animated:YES];

}

@end
