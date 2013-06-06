//
//  HGYYuanQuDetailCell.m
//  HGYProject
//
//  Created by iphone on 5/27/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYYuanQuDetailCell.h"

@interface HGYYuanQuDetailCell ()

@end

@implementation HGYYuanQuDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
#ifdef DEBUG
    NSLog(@"image view frame : %@", NSStringFromCGRect(self.yuanQuCellView1.frame));
    NSLog(@"bg image view frame : %@", NSStringFromCGRect(self.bg1ImageView.frame));
#endif
}

- (IBAction)yuanQuCellView1Tapped:(id)sender {
    if (self.delegate_) {
        [self.delegate_ yuanQuDetailCell:self selectItemAtIndex:0];
    }
}

- (IBAction)yuanQuCellView2Tapped:(id)sender {
    if (self.delegate_) {
        [self.delegate_ yuanQuDetailCell:self selectItemAtIndex:1];
    }
}

- (IBAction)yuanQuCellView3Tapped:(id)sender {
    if (self.delegate_) {
        [self.delegate_ yuanQuDetailCell:self selectItemAtIndex:2];
    }
}

#pragma mark - static
#define kHGYYuanQuListBgImage [UIImage imageNamed:@""]

+ (id)yuanQuDetailCell {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"HGYYuanQuDetailCell"
                                                  owner:self
                                                options:nil];
    HGYYuanQuDetailCell *cell = [nibs objectAtIndex:0];
    cell.bg1ImageView.image = kHGYYuanQuListBgImage;
    cell.bg1ImageView.image = kHGYYuanQuListBgImage;
    cell.bg1ImageView.image = kHGYYuanQuListBgImage;
    return cell;
}

@end
