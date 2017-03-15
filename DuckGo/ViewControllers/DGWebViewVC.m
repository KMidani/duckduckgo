//
//  DGWebViewVC.m
//  DuckGo
//
//  Created by khalil midani on 3/14/17.
//  Copyright © 2017 Khalil. All rights reserved.
//

#import "DGWebViewVC.h"

@interface DGWebViewVC ()<UIWebViewDelegate>

@property (nonatomic,weak)IBOutlet UIWebView *webView;

@end

@implementation DGWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
}

@end
