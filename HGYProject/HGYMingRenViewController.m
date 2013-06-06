//
//  HGYMingRenViewController.m
//  HGYProject
//
//  Created by iphone on 5/27/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYMingRenViewController.h"
#import "HGYDetailViewController.h"

#import "HGYMingRenCellView.h"

@interface HGYMingRenViewController ()

@end

@implementation HGYMingRenViewController {
    NSArray *_mingRens;
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
    
    self.rollView.datasource_ = self;
    self.rollView.delegate_ = self;
    
    if (!_mingRens) {
        _mingRens = [HGYLoadDatamodel loadMingRens];
    }
}

- (void)viewDidUnload {
    [self setRollView:nil];
    [super viewDidUnload];
}

#pragma mark - roll view datasource

#define HH_ROLL_VIEW_SUBVIEW_TAG 1023213

- (NSInteger)numberOfItemsInRollView:(HHSmallRollView *)rollView {
    if (_mingRens) {
        return [_mingRens count];
    }
    return 0;
}

- (HHRollViewCell *)rollView:(HHSmallRollView *)rollView cellAtIndex:(NSInteger)index {
    static NSString *identifier = @"kHGYMingRenListCell";
    HHRollViewCell *cell = [rollView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        HGYMingRenCellView *cellView = [HGYMingRenCellView mingRenCellView];
        cellView.tag = HH_ROLL_VIEW_SUBVIEW_TAG;
        cell = [[HHRollViewCell alloc] initWithFrame:cellView.frame
                                     reuseIdentifier:identifier];
        
        [cell addSubview:cellView];
    }
    HGYMingRenCellView *cellView = (HGYMingRenCellView *)[cell viewWithTag:HH_ROLL_VIEW_SUBVIEW_TAG];
    
    HGYMingRen *mingRen = [_mingRens objectAtIndex:index];
    cellView.imageView.image = [UIImage imageNamed:mingRen.defaultImage];
    cellView.titleLabel.text = mingRen.name;
    
    return cell;
}

#pragma mark - roll view delegate
- (void)rollView:(HHSmallRollView *)rollView didSelectCellAtIndex:(NSInteger)index {
    NSLog(@"select me : %d", index);
    
    HGYDetailViewController *viewController = [[HGYDetailViewController alloc] initWithNibName:nil bundle:nil];
    viewController.mingRen = [_mingRens objectAtIndex:index];
    if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]) {
        [self presentViewController:viewController animated:YES completion:nil];
    } else {
        [self presentModalViewController:viewController animated:YES];
    }
}

//#pragma mark - tableview datasource
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if (_mingRens) {
//        return ([_mingRens count] - 1) / 4 + 1;
//    }
//    return 0;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 235;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *identifier = @"HGYMingRenListCell";
//    
//    HGYMingRenListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (!cell) {
//        cell = [HGYMingRenListCell mingRenListCell];
//    }
//    cell.delegate_ = self;
//    HGYMingRen *mingRen1 = [_mingRens objectAtIndex:(indexPath.row * 4)];
//    cell.mingRenListCellView1.image = [UIImage imageNamed:[mingRen1 defaultImage]];
//    cell.mingRenListCellTitleLabel1.text = [mingRen1 name];
//
//    //有第二张图
//    if ([_mingRens count] > indexPath.row * 4 + 1) {
//        HGYMingRen *mingRen2 = [_mingRens objectAtIndex:(indexPath.row * 4 + 1)];
//        cell.bg2ImageView.hidden = NO;
//        cell.mingRenListCellView2.image = [UIImage imageNamed:[mingRen2 defaultImage]];
//        cell.mingRenListCellTitleLabel2.text = [mingRen2 name];
//
//        //有第三张图
//        if ([_mingRens count] > indexPath.row * 4 + 2) {
//            HGYMingRen *mingRen3 = [_mingRens objectAtIndex:(indexPath.row * 4 + 2)];
//            cell.bg3ImageView.hidden = NO;
//            cell.mingRenListCellView3.image = [UIImage imageNamed:[mingRen3 defaultImage]];
//            cell.mingRenListCellTitleLabel3.text = [mingRen3 name];
//
//            //有第四张图
//            if ([_mingRens count] > indexPath.row * 4 + 3) {
//                HGYMingRen *mingRen4 = [_mingRens objectAtIndex:(indexPath.row * 4 + 3)];
//                cell.bg4ImageView.hidden = NO;
//                cell.mingRenListCellView4.image = [UIImage imageNamed:[mingRen4 defaultImage]];
//                cell.mingRenListCellTitleLabel4.text = [mingRen4 name];
//            } else {
//                cell.bg4ImageView.hidden = YES;
//            }
//        } else {
//            cell.bg3ImageView.hidden = YES;
//            cell.bg4ImageView.hidden = YES;
//        }
//    } else {
//        cell.bg2ImageView.hidden = YES;
//        cell.bg3ImageView.hidden = YES;
//        cell.bg4ImageView.hidden = YES;
//    }
//    return cell;
//}
//
//#pragma mark - mingren cell delegate
//- (void)mingRenListCell:(HGYMingRenListCell *)cell didSelectItemAtIndex:(NSInteger)index {
//#warning mingren
//}

@end
