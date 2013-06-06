//
//  HGYChanPinListCellView.m
//  HGYProject
//
//  Created by iphone on 5/29/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYChanPinListCellView.h"

@implementation HGYChanPinListCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - static

#define kHGYChanPinListCellBG [UIImage imageNamed:@"chanpin-bg.png"]

+ (id)chanPinListCellView {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"HGYChanPinListCellView" owner:self options:nil];
    HGYChanPinListCellView *cell = [nibs objectAtIndex:0];
    cell.backgroundImageView.image = kHGYChanPinListCellBG;
    return cell;
}

@end
