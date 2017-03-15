//
//  DuckDuckGoApi.m
//  DuckGo
//
//  Created by khalil midani on 3/14/17.
//  Copyright © 2017 Khalil. All rights reserved.
//

#import "DuckDuckGoApi.h"
#import "DGParser.h"
#import "SearchResults.h"

#define BASEURL @"http://api.duckduckgo.com/"
#define SEARCHURL @"?q=%@&format=json&pretty=1"

@implementation DuckDuckGoApi

+ (void)searchDuckDuckFor:(NSString *)string completion:(void (^)(SearchResults *results,NSError *error))completion {
    
    NSString *urlComponant = [NSString stringWithFormat:SEARCHURL,string];
    NSString *fullUrl = [NSString stringWithFormat:@"%@%@",BASEURL,urlComponant];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:fullUrl]];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *serialized = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (!error && serialized) {
           SearchResults *result = [DGParser parseDictionary:serialized withClass:[SearchResults class]];
            if (request) {
                completion (result,nil);
                return;
            }
            
        }
        completion (nil,error);
    }] resume];
}

+ (void)fetchImage:(NSString *)url completion:(void (^)(UIImage *image,NSError *error))completion {
    NSURLRequest *imageRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]
                                                  cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                              timeoutInterval:60];
    
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [[session dataTaskWithRequest:imageRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            completion ([UIImage imageWithData:data],nil);
            return;
        }
        completion(nil,error);
    }] resume];
    
    
    
}

@end
