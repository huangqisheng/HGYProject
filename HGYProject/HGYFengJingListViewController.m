//
//  HGYFengJingListViewController.m
//  HGYProject
//
//  Created by iphone on 5/29/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYFengJingListViewController.h"

#import "HGYYuanQuCellView.h"

@interface HGYFengJingListViewController ()

@end

@implementation HGYFengJingListViewController {
    NSArray *_images;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
#warning loading images
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setContentBackgroundImageView:nil];
    [self setTableView:nil];
    [super viewDidUnload];
}

#pragma mark - tableview datasource 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_images) {
        return ([_images count] - 1) / 3 + 1;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 205;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"kFengJingListCell";
    
    HGYYuanQuDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [HGYYuanQuDetailCell yuanQuDetailCell];
    }
    cell.delegate_ = self;
    cell.yuanQuCellView1.image = [_images objectAtIndex:(indexPath.row * 3)];
    
    if ([_images count] > indexPath.row * 3 + 1) {
        cell.yuanQuCellView2.image = [_images objectAtIndex:(indexPath.row * 3 + 1)];
        if ([_images count] > indexPath.row * 3 + 2) {
            cell.yuanQuCellView3.image = [_images objectAtIndex:(indexPath.row * 3 + 2)];
        }
    }
    return cell;
}

#pragma mark - yuanqu detail cell delegate
- (void)yuanQuDetailCell:(HGYYuanQuDetailCell *)cell selectItemAtIndex:(NSInteger)index {
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    UIImage *image = [_images objectAtIndex:(path.row * 3 + index)];
    
#warning image tap
    
}

@end
