//
//  DuckDuckGoApi.h
//  DuckGo
//
//  Created by khalil midani on 3/14/17.
//  Copyright © 2017 Khalil. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchResults;
@interface DuckDuckGoApi : NSObject


+ (void)searchDuckDuckFor:(NSString *)string completion:(void (^)(SearchResults *results,NSError *error))completion;


+ (void)fetchImage:(NSString *)url completion:(void (^)(UIImage *image,NSError *error))completion;

@end
