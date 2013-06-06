//
//  HGYFengJingCellView.m
//  HGYProject
//
//  Created by iphone on 5/28/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYMuDiCellView.h"

@implementation HGYMuDiCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (id)muDiCellView {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"HGYMuDiCellView"
                                                  owner:self
                                                options:nil];
    return [nibs objectAtIndex:0];
}

@end
