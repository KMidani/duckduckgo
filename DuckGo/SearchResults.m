//
//  SearchResults.m
//  DuckGo
//
//  Created by khalil midani on 3/14/17.
//  Copyright © 2017 Khalil. All rights reserved.
//

#import "SearchResults.h"

#import "DGRelatedTopics.h"
#import "DGTopic.h"
#import "DGParser.h"

#define RELATED_TOPICS_KEY @"RelatedTopics"

@implementation SearchResults

- (BOOL)parseDGDictinory:(NSDictionary *)dictionary {
    if (!dictionary) {
        return NO;
    }
    
    if (dictionary[RELATED_TOPICS_KEY]) {
        self.relatedTopics = [DGParser parseArray:dictionary[RELATED_TOPICS_KEY] withClass:[DGRelatedTopics class]];
        self.topics = [DGParser parseArray:dictionary[RELATED_TOPICS_KEY] withClass:[DGTopic class]];
    }
    
    return YES;
}

@end
