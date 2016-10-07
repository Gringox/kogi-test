//
//  APIClient.m
//  Kogi-Test
//
//  Created by Pedro Luis Valdivieso on 10/7/16.
//  Copyright © 2016 Pedro Luis Valdivieso. All rights reserved.
//

#import "APIClient.h"
#import "AppDefaults.h"

@implementation APIClient

#pragma mark - Shared Instance

+ (instancetype)sharedClient {
    static APIClient *apiClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSString *url = APIURL;
        
        apiClient = [[APIClient alloc] initWithBaseURL:[NSURL URLWithString:url]];
        
        apiClient.requestSerializer = [AFJSONRequestSerializer serializer];
        
        if (![[url substringToIndex:5] isEqualToString:@"https"]) {
            apiClient.securityPolicy = [AFSecurityPolicy
                                        policyWithPinningMode:AFSSLPinningModeNone];
        }
    });
    return apiClient;
}

@end
