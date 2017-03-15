//
//  DGParser.m
//  DuckGo
//
//  Created by khalil midani on 3/14/17.
//  Copyright © 2017 Khalil. All rights reserved.
//

#import "DGParser.h"

@implementation DGParser

+ (NSArray *)parseArray:(NSArray *)array withClass:(Class)className {
    NSMutableArray *parsedObjects = [@[] mutableCopy];
    for (NSDictionary *obj in array) {
        id<DGParserProtocol> parsedObject = [[className alloc] init];
        if ([parsedObject parseDGDictinory:obj])
            [parsedObjects addObject:parsedObject];
    }
    return parsedObjects;
}

+ (id)parseDictionary:(NSDictionary *)dictionary withClass:(Class)className {
    id<DGParserProtocol> parsedObject = [[className alloc] init];
    if ([parsedObject parseDGDictinory:dictionary])
        return parsedObject;
    return nil;
}

@end
