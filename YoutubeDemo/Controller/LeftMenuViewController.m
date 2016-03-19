//
//  LeftMenuViewController.m
//  YoutubeDemo
//
//  Created by Hoang Son on 3/19/16.
//  Copyright (c) 2016 Hoang Son. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "HomeViewController.h"
#import "YoutubeRequest.h"
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
    [[YoutubeRequest request] listCategory:^(NSArray *results) {
        self.categoryArray = results;
        [self.menuTableView reloadData];
    } failure:^(NSError *error, NSString *message) {
        
    }];
}

#pragma mark - TableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.categoryArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCell *categoryCell = [tableView dequeueReusableCellWithIdentifier:CategoryCellIdentifier forIndexPath:indexPath];
    CategoryItem *category = [self.categoryArray objectAtIndex:indexPath.row];
    [categoryCell setData:category];
    [self configSytleCell:categoryCell indexPath:indexPath];
    return categoryCell;
}

- (void)configSytleCell:(CategoryCell *)cell indexPath:(NSIndexPath *)indexPath{
    UIView *myBackView = [[UIView alloc] initWithFrame:cell.frame];
    myBackView.backgroundColor = [UIColor redColor];
    cell.selectedBackgroundView = myBackView;
    if (indexPath.row == 0) {
        [cell setFirstSelect:YES];
    }else{
        [cell setFirstSelect:NO];
    }
}



#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCell *cell = (CategoryCell *)[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [cell setFirstSelect:NO];
    
    [[HomeViewController share] hideMenu:^{
        if (self.clickItemAtIndexBlock) {
            self.clickItemAtIndexBlock(indexPath, [self.categoryArray objectAtIndex:indexPath.row]);
        }
    }];
}

@end
