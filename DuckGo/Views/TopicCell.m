//
//  TopicCell.m
//  DuckGo
//
//  Created by khalil midani on 3/15/17.
//  Copyright © 2017 Khalil. All rights reserved.
//

#import "TopicCell.h"
#import "DGTopic.h"
#import "DuckDuckGoApi.h"

@interface TopicCell ()

@property (nonatomic,weak) IBOutlet UIImageView *iconView;
@property (nonatomic,weak) IBOutlet UILabel *textView;

@end

@implementation TopicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTopic:(DGTopic*)topic {
    self.textView.text = topic.text;
    [DuckDuckGoApi fetchImage:topic.iconUrl completion:^(UIImage *image, NSError *error) {
        if (image) {
            _iconView.image = image;
        }
    }];
}

@end
