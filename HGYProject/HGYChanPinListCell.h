//
//  HGYChanPinListCell.h
//  HGYProject
//
//  Created by iphone on 5/29/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HGYChanPinListCellView;
@class HGYChanPinListCell;

@protocol HGYChanPinListCellDelegate <NSObject>

- (void)chanPinListCell:(HGYChanPinListCell *)cell didSelectItemAtIndex:(NSInteger)index;

@end

@interface HGYChanPinListCell : UITableViewCell

@property (weak, nonatomic) id<HGYChanPinListCellDelegate> delegate_;

@property (weak, nonatomic) IBOutlet UIImageView *chanPinListView1;
@property (weak, nonatomic) IBOutlet UILabel *chanPinListTitleLabel1;
@property (weak, nonatomic) IBOutlet UIImageView *chanPinListView2;
@property (weak, nonatomic) IBOutlet UILabel *chanPinListTitleLabel2;
@property (weak, nonatomic) IBOutlet UIImageView *chanPinListView3;
@property (weak, nonatomic) IBOutlet UILabel *chanPinListTitleLabel3;
@property (weak, nonatomic) IBOutlet UIImageView *chanPinListView4;
@property (weak, nonatomic) IBOutlet UILabel *chanPinListTitleLabel4;

@property (weak, nonatomic) IBOutlet UIImageView *bg1ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bg2ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bg3ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bg4ImageView;

- (IBAction)chanPinListView1Tapped:(id)sender;
- (IBAction)chanPinListView2Tapped:(id)sender;
- (IBAction)chanPinListView3Tapped:(id)sender;
- (IBAction)chanPinListView4Tapped:(id)sender;

#pragma mark  - static
+ (id)chanPinListCell;

@end
