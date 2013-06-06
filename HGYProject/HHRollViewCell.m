//
//  HHRollViewCell.m
//  HHRollViewPro
//
//  Created by iphone on 4/12/13.
//  Copyright (c) 2013 HH. All rights reserved.
//

#import "HHRollViewCell.h"

@implementation HHRollViewCell

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithFrame:frame];
    if (self) {
        _reuseIdentifier = reuseIdentifier;
    }
    return self;
}

- (BOOL)firstlySetReuseIdentifier:(NSString *)reuseIdentifier {
    if (!_reuseIdentifier) {
        _reuseIdentifier = reuseIdentifier;
        return YES;
    }
    return NO;
}

@end
