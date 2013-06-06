//
//  HGYPopoverView.m
//  HGYProject
//
//  Created by iphone on 5/28/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYPopoverView.h"

@implementation HGYPopoverView {
    BOOL _isShowing;
}

- (void)setContentView:(UIView *)contentView {
    if (contentView
        && _contentView != contentView) {
        
        [_contentView removeFromSuperview];
        
        _contentView = contentView;
        
        CGRect frame = _contentView.frame;
        _contentView.frame = CGRectMake((self.frame.size.width - frame.size.width) / 2, (self.frame.size.height - frame.size.height) / 2, frame.size.width, frame.size.height);
        [self addSubview:_contentView];
    }
}

- (void)showInView:(UIView *)view {
    [self showInView:view animated:NO];
}

- (void)showInView:(UIView *)view animated:(BOOL)animated {
    if (_isShowing) {
        return;
    }
    _isShowing = YES;
    self.alpha = 0;
    self.center = CGPointMake(view.bounds.size.width / 2, view.bounds.size.height / 2);
    [view addSubview:self];
    if (animated) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3f];
    }
    self.alpha = 1.0f;
    if (animated) {
        [UIView commitAnimations];
    }
}

- (IBAction)onTap:(id)sender {
    if (sender) {
        UITapGestureRecognizer *tap = (UITapGestureRecognizer*)sender;
        CGPoint location = [tap locationInView:self.contentView];
        if (!CGRectContainsPoint(self.contentView.bounds, location)) {
            [self removeFromSuperview];
            _isShowing = NO;
        }
    } else {
        [self removeFromSuperview];
        _isShowing = NO;
    }
}

+ (id)popoverView {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"HGYPopoverView"
                                                  owner:self
                                                options:nil];
    return [nibs objectAtIndex:0];
}

@end
