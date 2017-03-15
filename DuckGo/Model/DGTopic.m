//
//  DGTopic.m
//  DuckGo
//
//  Created by khalil midani on 3/14/17.
//  Copyright © 2017 Khalil. All rights reserved.
//

#import "DGTopic.h"

#define RESULT_KEY @"Result"
#define ICON_KEY @"Icon"
#define ICON_URL_KEY @"URL"
#define FIRST_URL_KEY @"FirstURL"
#define TEXT_KEY @"Text"

@implementation DGTopic

- (BOOL)parseDGDictinory:(NSDictionary *)dictionary {
    if (!dictionary) {
        return NO;
    }
    
    if (dictionary[FIRST_URL_KEY]) {
        self.firstURL = dictionary[FIRST_URL_KEY];
        self.iconUrl = dictionary[ICON_KEY][ICON_URL_KEY];
        self.text = dictionary[TEXT_KEY];
        return YES;
    }
    
    return NO;
}

@end
