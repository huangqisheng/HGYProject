//
//  HGYPopoverView.h
//  HGYProject
//
//  Created by iphone on 5/28/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGYPopoverView : UIView

@property (strong, nonatomic) UIView *contentView;

- (void)showInView:(UIView *)view;
- (void)showInView:(UIView *)view animated:(BOOL)animated;
- (IBAction)onTap:(id)sender;
+ (id)popoverView;



@end
