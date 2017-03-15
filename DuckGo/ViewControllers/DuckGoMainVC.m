//
//  DuckGoMainVC.m
//  DuckGo
//
//  Created by khalil midani on 3/14/17.
//  Copyright © 2017 Khalil. All rights reserved.
//

#import "DuckGoMainVC.h"
#import "DuckDuckGoApi.h"


#import "SearchResults.h"

#import "DGTopicListVC.h"

@interface DuckGoMainVC ()

@property (nonatomic,weak) IBOutlet UITextField *searchInput;
@property (nonatomic,weak) IBOutlet UIActivityIndicatorView *loader;

@end

@implementation DuckGoMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_loader setHidden:YES];
}

- (IBAction)searchTab:(UIButton *)sender {
    if (![_searchInput.text isEqualToString:@""]) {
        [self search];
    }
}

- (void)search {
    [_loader setHidden:NO];
    [_loader startAnimating];
    [DuckDuckGoApi searchDuckDuckFor:_searchInput.text completion:^(SearchResults *results, NSError *error) {
        if (results && !error) {
            dispatch_async(dispatch_get_main_queue(), ^{
            [self performSegueWithIdentifier:@"ShowTopicListSegue" sender:results];    
            });
            
        }
        NSLog(@"%@",error);
        [_loader stopAnimating];
    }];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowTopicListSegue"]) {
        DGTopicListVC *vc = segue.destinationViewController;
        vc.results = sender;
    }
}


@end
