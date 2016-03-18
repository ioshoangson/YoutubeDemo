//
//  LeftMenuViewController.m
//  YoutubeDemo
//
//  Created by Hoang Son on 3/19/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "CategoryCell.h"

static NSString *CategoryCellIdentifier = @"CategoryCellIdentifier";

@interface LeftMenuViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *menuTableView;
@property (nonatomic, strong) NSArray *categoryArray;

@end

@implementation LeftMenuViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self requestListCategoryFromYoutube];
}

#pragma mark - Request Data
- (void)requestListCategoryFromYoutube{
    
}

#pragma mark - TableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.categoryArray count] + 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCell *categoryCell = [tableView dequeueReusableCellWithIdentifier:CategoryCellIdentifier forIndexPath:indexPath];
    [categoryCell setData:nil];
    return categoryCell;
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
