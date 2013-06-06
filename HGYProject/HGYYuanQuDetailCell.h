//
//  HGYYuanQuDetailCell.h
//  HGYProject
//
//  Created by iphone on 5/27/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HGYYuanQuCellView;
@class HGYYuanQuDetailCell;

@protocol HGYYuanQuDetailCellDelegate <NSObject>

- (void)yuanQuDetailCell:(HGYYuanQuDetailCell *)cell selectItemAtIndex:(NSInteger)index;

@end

@interface HGYYuanQuDetailCell : UITableViewCell

@property (weak, nonatomic) id<HGYYuanQuDetailCellDelegate> delegate_;

@property (weak, nonatomic) IBOutlet UIImageView *yuanQuCellView1;
@property (weak, nonatomic) IBOutlet UIImageView *yuanQuCellView2;
@property (weak, nonatomic) IBOutlet UIImageView *yuanQuCellView3;

@property (weak, nonatomic) IBOutlet UIImageView *bg1ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bg2ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bg3ImageView;

- (IBAction)yuanQuCellView1Tapped:(id)sender;
- (IBAction)yuanQuCellView2Tapped:(id)sender;
- (IBAction)yuanQuCellView3Tapped:(id)sender;

#pragma mark - static
+ (id)yuanQuDetailCell;

@end
