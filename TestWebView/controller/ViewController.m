//
//  ViewController.m
//  TestWebView
//
//  Created by xiaofeishen on 2020/4/2.
//  Copyright © 2020 xiaofeishen. All rights reserved.
//

#import "ViewController.h"
#import "MessageAPI.h"
#import "CreateMessageController.h"
#import "MessageListCell.h"
#import "MessageModel.h"
#import <MJRefresh/MJRefresh.h>

static NSString* const MessageCellIdentifer = @"MessageListCell";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<MessageModel *> *datasource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datasource = @[].mutableCopy;
    self.tableView.rowHeight = 70;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:@"MessageListCell" bundle:nil] forCellReuseIdentifier:MessageCellIdentifer];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    
    [self loadData:YES];
//    [MessageAPI getMessageWithDict:dict];
}

#pragma mark - servers
- (void)refreshHeader {
    [self loadData:YES];
}

- (void)loadMore {
    [self loadData:NO];
}

- (void)loadData:(BOOL)header {
    NSMutableDictionary *dict = @{@"id":@"sxfdmmsqy",@"limit":@(10)}.mutableCopy;
    dict[@"direction"] = header ? @(1):@(0);
    if (!header) {
        dict[@"lastItem"] = @(self.datasource.lastObject.creationTime);
    }
    
    [MessageAPI getMessageWithDict:dict completion:^(NSArray<MessageModel *> * _Nonnull data) {
        if (header) {
            self.datasource = data.mutableCopy;
        } else {
            [self.datasource addObjectsFromArray:data];
        }
        if (header) {
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer resetNoMoreData];
        } else {
            if (data.count == 0) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            } else {
                [self.tableView.mj_footer endRefreshing];
            }
        }
        [self.tableView reloadData];
    }];
}

#pragma mark - action
- (IBAction)createButtonPress:(id)sender {
    CreateMessageController *vc = [[CreateMessageController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageModel *model = self.datasource[indexPath.row];
    MessageListCell *cell = [tableView dequeueReusableCellWithIdentifier:MessageCellIdentifer];
    cell.contentLb.text = model.content;
    
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    formate.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:model.creationTime/1000];
    NSString *ctime = [formate stringFromDate:date];
    cell.timeLb.text = ctime;
    return cell;
}

@end
