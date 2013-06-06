//
//  HGYFengJingListViewController.h
//  HGYProject
//
//  Created by iphone on 5/29/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYRootViewController.h"

#import "HGYYuanQuDetailCell.h"

@interface HGYFengJingListViewController : HGYRootViewController <UITableViewDataSource, UITableViewDelegate, HGYYuanQuDetailCellDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *contentBackgroundImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)back:(id)sender;

@end
