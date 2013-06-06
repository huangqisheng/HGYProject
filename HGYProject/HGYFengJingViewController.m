//
//  HGYFengJingViewController.m
//  HGYProject
//
//  Created by iphone on 5/27/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYFengJingViewController.h"
#import "HGYYuanQuBigImageView.h"
#import "HGYPopoverView.h"

//#import "HGYFengJingCellView.h"

@interface HGYFengJingViewController ()

@end

@implementation HGYFengJingViewController {
    NSArray *_fengJings;
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
    
    self.contentBackgroundImageView.image = [[UIImage imageNamed:@"content_bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    
    if (!_fengJings) {
        _fengJings = [HGYLoadDatamodel loadFengJings];
    }
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
    if (_fengJings) {
        return ([_fengJings count] - 1) / 3 + 1;
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
    HGYFengJing *fengJing1 = [_fengJings objectAtIndex:(indexPath.row * 3)];
    cell.yuanQuCellView1.image = [UIImage imageNamed:fengJing1.thumbnail];
    
#warning detail
    //有第二张图
    if ([_fengJings count] > indexPath.row * 3 + 1) {
        HGYFengJing *fengJing2 = [_fengJings objectAtIndex:(indexPath.row * 3 + 1)];
        cell.yuanQuCellView2.image = [UIImage imageNamed:fengJing2.thumbnail];
        cell.bg2ImageView.hidden = NO;
        
        //有第三张图
        if ([_fengJings count] > indexPath.row * 3 + 2) {
            HGYFengJing *fengJing3 = [_fengJings objectAtIndex:(indexPath.row * 3 + 2)];
            cell.yuanQuCellView3.image = [UIImage imageNamed:fengJing3.thumbnail];
            cell.bg3ImageView.hidden = NO;
        } else {
            cell.bg3ImageView.hidden = YES;
        }
    } else {
        cell.bg2ImageView.hidden = YES;
        cell.bg3ImageView.hidden = YES;
    }
    return cell;
}

#pragma mark - chanpin list cell delegate
- (void)yuanQuDetailCell:(HGYYuanQuDetailCell *)cell
       selectItemAtIndex:(NSInteger)index {
    NSMutableArray *images = [[NSMutableArray alloc] initWithCapacity:[_fengJings count]];
    for (HGYFengJing *fengJing in _fengJings) {
        [images addObject:fengJing.image];
    }
    
    HGYYuanQuBigImageView *view = [HGYYuanQuBigImageView yuanQuBigImageView];
    view.originSelectIndex = index;
    view.images = images;
    
    HGYPopoverView *popover = [HGYPopoverView popoverView];
    popover.contentView = view;
    
    [popover showInView:self.view animated:YES];
}

//#pragma mark - roll view datasource
//
//#define HH_ROLL_VIEW_SUBVIEW_TAG 1020203
//
//- (NSInteger)numberOfItemsInRollView:(HHSmallRollView *)rollView {
//    return 10;
//}
//
//- (HHRollViewCell *)rollView:(HHSmallRollView *)rollView cellAtIndex:(NSInteger)index {
//    static NSString *identifier = @"myReuseCell";
//    HHRollViewCell *cell = [rollView dequeueReusableCellWithIdentifier:identifier];
//    if (!cell) {
//        HGYFengJingCellView *cellView = [HGYFengJingCellView fengJingCellView];
//        cellView.tag = HH_ROLL_VIEW_SUBVIEW_TAG;
//        cell = [[HHRollViewCell alloc] initWithFrame:cellView.frame
//                                     reuseIdentifier:identifier];
//        
//        [cell addSubview:cellView];
//    }
//    HGYFengJingCellView *cellView = (HGYFengJingCellView *)[cell viewWithTag:HH_ROLL_VIEW_SUBVIEW_TAG];
//    
//    return cell;
//}
//
//#pragma mark - roll view delegate
//- (void)rollView:(HHSmallRollView *)rollView didSelectCellAtIndex:(NSInteger)index {
//    
//}

@end
