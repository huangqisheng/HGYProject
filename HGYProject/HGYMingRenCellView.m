//
//  HGYMingRenCellView.m
//  HGYProject
//
//  Created by iphone on 6/4/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYMingRenCellView.h"

@implementation HGYMingRenCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - static

#define kHGYMingRenListCellBG [UIImage imageNamed:@"mingren_list.png"]

+ (id)mingRenCellView {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"HGYMingRenCellView" owner:self options:nil];
    HGYMingRenCellView *cell = [nibs objectAtIndex:0];
    cell.image = kHGYMingRenListCellBG;
    return cell;
}


@end
