//
//  HGYFengJingViewController.h
//  HGYProject
//
//  Created by iphone on 5/27/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYRootViewController.h"

#import "HGYYuanQuDetailCell.h"

@interface HGYFengJingViewController : HGYRootViewController <UITableViewDataSource, UITableViewDelegate, HGYYuanQuDetailCellDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *contentBackgroundImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
