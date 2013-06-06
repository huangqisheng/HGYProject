//
//  HHRollViewCell.h
//  HHRollViewPro
//
//  Created by iphone on 4/12/13.
//  Copyright (c) 2013 HH. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface HHRollViewCell : UIView

@property (strong, nonatomic) UIView *contentOverlayView;
@property (readonly, strong, nonatomic) NSString *reuseIdentifier;
- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier;
- (BOOL)firstlySetReuseIdentifier:(NSString *)reuseIdentifier;

@end
