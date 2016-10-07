//
//  APIClient.h
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/7/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface APIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
