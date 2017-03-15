//
//  DGParser.h
//  DuckGo
//
//  Created by khalil midani on 3/14/17.
//  Copyright © 2017 Khalil. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DGParserProtocol <NSObject>

- (BOOL)parseDGDictinory:(NSDictionary*)dictionary;

@end

@interface DGParser : NSObject

+ (NSArray *)parseArray:(NSArray *)array withClass:(Class)className;
+ (id)parseDictionary:(NSDictionary *)dictionary withClass:(Class)className;

@end
