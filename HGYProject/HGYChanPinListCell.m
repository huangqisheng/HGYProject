//
//  HGYChanPinListCell.m
//  HGYProject
//
//  Created by iphone on 5/29/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYChanPinListCell.h"

@interface HGYChanPinListCell ()


@end

@implementation HGYChanPinListCell

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

- (IBAction)chanPinListView1Tapped:(id)sender {
    if (self.delegate_) {
        [self.delegate_ chanPinListCell:self didSelectItemAtIndex:0];
    }
}

- (IBAction)chanPinListView2Tapped:(id)sender {
    if (self.delegate_) {
        [self.delegate_ chanPinListCell:self didSelectItemAtIndex:1];
    }
}

- (IBAction)chanPinListView3Tapped:(id)sender {
    if (self.delegate_) {
        [self.delegate_ chanPinListCell:self didSelectItemAtIndex:2];
    }
}

- (IBAction)chanPinListView4Tapped:(id)sender {
    if (self.delegate_) {
        [self.delegate_ chanPinListCell:self didSelectItemAtIndex:3];
    }
}

#pragma mark  - static
#define kHGYChanPinListBGImage [UIImage imageNamed:@"chanpin-bg.png"]

+ (id)chanPinListCell {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"HGYChanPinListCell"
                                                  owner:self
                                                options:nil];
    HGYChanPinListCell *cell = [nibs objectAtIndex:0];
    cell.bg1ImageView.image = kHGYChanPinListBGImage;
    cell.bg2ImageView.image = kHGYChanPinListBGImage;
    cell.bg3ImageView.image = kHGYChanPinListBGImage;
    cell.bg4ImageView.image = kHGYChanPinListBGImage;
    return cell;
}


@end
