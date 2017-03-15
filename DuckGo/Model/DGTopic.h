//
//  DGTopic.h
//  DuckGo
//
//  Created by khalil midani on 3/14/17.
//  Copyright © 2017 Khalil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGParser.h"

@interface DGTopic : NSObject<DGParserProtocol>

@property (nonatomic,strong) NSString *result;
@property (nonatomic,strong) NSString *iconUrl;
@property (nonatomic,strong) NSString *firstURL;
@property (nonatomic,strong) NSString *text;

@end
