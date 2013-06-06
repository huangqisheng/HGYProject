//
//  HGYFuWuListCellView.m
//  HGYProject
//
//  Created by iphone on 6/4/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYFuWuListCellView.h"

@implementation HGYFuWuListCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - static

#define kHGYFuWuListCellBG [UIImage imageNamed:@"BZFW-bg.png"]

+ (id)fuWuListCellView {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"HGYFuWuListCellView"
                                                  owner:self
                                                options:nil];
    HGYFuWuListCellView *cell = [nibs objectAtIndex:0];
    cell.contentBackgroundImageView.image = kHGYFuWuListCellBG;
    return cell;
}

@end
