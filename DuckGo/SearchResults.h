//
//  SearchResults.h
//  DuckGo
//
//  Created by khalil midani on 3/14/17.
//  Copyright © 2017 Khalil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGParser.h"

@interface SearchResults : NSObject <DGParserProtocol>

@property (nonatomic,strong) NSArray *topics;
@property (nonatomic,strong) NSArray *relatedTopics;

@end
