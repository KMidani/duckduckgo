//
//  DGRelatedTopics.m
//  DuckGo
//
//  Created by khalil midani on 3/14/17.
//  Copyright © 2017 Khalil. All rights reserved.
//

#import "DGRelatedTopics.h"
#import "DGTopic.h"

#define NAME_KEY @"Name"
#define TOPICS_KEY @"Topics"

@implementation DGRelatedTopics

- (BOOL)parseDGDictinory:(NSDictionary *)dictionary {
    if (!dictionary) {
        return NO;
    }
    
    
    if (dictionary[NAME_KEY] && dictionary[TOPICS_KEY]) {
        self.name = dictionary[NAME_KEY];
        self.topics = [DGParser parseArray:dictionary[TOPICS_KEY] withClass:[DGTopic class]];
        return YES;
    }
    return NO;
}

@end
