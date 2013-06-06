//
//  HGYMingRenListCell.h
//  HGYProject
//
//  Created by iphone on 5/31/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HGYMingRenListCell;

@protocol HGYMingRenListCellDelegate <NSObject>

- (void)mingRenListCell:(HGYMingRenListCell *)cell didSelectItemAtIndex:(NSInteger)index;

@end

@interface HGYMingRenListCell : UITableViewCell

@property (weak, nonatomic) id<HGYMingRenListCellDelegate> delegate_;

@property (weak, nonatomic) IBOutlet UIImageView *mingRenListCellView1;
@property (weak, nonatomic) IBOutlet UILabel *mingRenListCellTitleLabel1;
@property (weak, nonatomic) IBOutlet UIImageView *mingRenListCellView2;
@property (weak, nonatomic) IBOutlet UILabel *mingRenListCellTitleLabel2;
@property (weak, nonatomic) IBOutlet UIImageView *mingRenListCellView3;
@property (weak, nonatomic) IBOutlet UILabel *mingRenListCellTitleLabel3;
@property (weak, nonatomic) IBOutlet UIImageView *mingRenListCellView4;
@property (weak, nonatomic) IBOutlet UILabel *mingRenListCellTitleLabel4;

@property (weak, nonatomic) IBOutlet UIImageView *bg1ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bg2ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bg3ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bg4ImageView;


- (IBAction)mingRenListCellView1Tapped:(id)sender;
- (IBAction)mingRenListCellView2Tapped:(id)sender;
- (IBAction)mingRenListCellView3Tapped:(id)sender;
- (IBAction)mingRenListCellView4Tapped:(id)sender;

#pragma mark - static
+ (id)mingRenListCell;

@end
