//
//  HGYMingRenListCell.m
//  HGYProject
//
//  Created by iphone on 5/31/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYMingRenListCell.h"

@interface HGYMingRenListCell ()


@end

@implementation HGYMingRenListCell

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

- (IBAction)mingRenListCellView1Tapped:(id)sender {
    if (self.delegate_) {
        [self.delegate_ mingRenListCell:self didSelectItemAtIndex:0];
    }
}

- (IBAction)mingRenListCellView2Tapped:(id)sender {
    if (self.delegate_) {
        [self.delegate_ mingRenListCell:self didSelectItemAtIndex:1];
    }
}

- (IBAction)mingRenListCellView3Tapped:(id)sender {
    if (self.delegate_) {
        [self.delegate_ mingRenListCell:self didSelectItemAtIndex:2];
    }
}

- (IBAction)mingRenListCellView4Tapped:(id)sender {
    if (self.delegate_) {
        [self.delegate_ mingRenListCell:self didSelectItemAtIndex:3];
    }
}

#pragma mark - static
#define kHGYMingRenListBGImage [UIImage imageNamed:@"mingren_list.png"]

+ (id)mingRenListCell {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"HGYMingRenListCell"
                                                  owner:self
                                                options:nil];
    HGYMingRenListCell *cell = [nibs objectAtIndex:0];
    cell.bg1ImageView.image = kHGYMingRenListBGImage;
    cell.bg2ImageView.image = kHGYMingRenListBGImage;
    cell.bg3ImageView.image = kHGYMingRenListBGImage;
    cell.bg4ImageView.image = kHGYMingRenListBGImage;
    return cell;
}

@end
