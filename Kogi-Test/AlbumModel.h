//
//  AlbumModel.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/9/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *markets;

+ (AlbumModel *)initAlbumFromDictionary:(NSDictionary *)dictionary;

@end
