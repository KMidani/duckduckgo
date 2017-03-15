//
//  DGTopicListVC.m
//  DuckGo
//
//  Created by khalil midani on 3/14/17.
//  Copyright © 2017 Khalil. All rights reserved.
//

#import "DGTopicListVC.h"

#import "SearchResults.h"
#import "DGRelatedTopics.h"
#import "DGTopic.h"

#import "HeaderCell.h"
#import "TopicCell.h"

#import "DGWebViewVC.h"
@interface DGTopicListVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation DGTopicListVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Toipcs Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.results.relatedTopics.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0)
        return self.results.topics.count;
    
    DGRelatedTopics *related = self.results.relatedTopics[section-1];
    return related.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DGTopic *topic;
    if (indexPath.section == 0) {
        topic = self.results.topics[indexPath.row];
    }else {
        DGRelatedTopics *related = self.results.relatedTopics[indexPath.section-1];
        topic = related.topics[indexPath.row];
    }
    TopicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicCell"];
    [cell setTopic:topic];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    HeaderCell *hCell = [tableView dequeueReusableCellWithIdentifier:@"HeaderCell"];
    if (section == 0) {
        hCell.title.text = @"Topics";
    }else {
        DGRelatedTopics *related = self.results.relatedTopics[section-1];
        hCell.title.text = related.name;
    }
    
    return hCell;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DGTopic *topic;
    if (indexPath.section == 0) {
        topic = self.results.topics[indexPath.row];
    }else {
        DGRelatedTopics *related = self.results.relatedTopics[indexPath.section-1];
        topic = related.topics[indexPath.row];
    }
    [self performSegueWithIdentifier:@"ShowFullTopic" sender:topic.firstURL];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowFullTopic"]) {
        DGWebViewVC *vc = segue.destinationViewController;
        vc.url = sender;
    }
    
}


@end
