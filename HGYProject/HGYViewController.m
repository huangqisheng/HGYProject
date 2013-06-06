//
//  HGYViewController.m
//  HGYProject
//
//  Created by iphone on 5/27/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYViewController.h"

@interface HGYViewController ()

@end

@implementation HGYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.contentBackgroundImageView.image = [[UIImage imageNamed:@"content_bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    
    [self performSelector:@selector(animatedShowLiuChengButton)
               withObject:nil
               afterDelay:0.0f];
    [self performSelector:@selector(animatedShowChanPinButton)
               withObject:nil
               afterDelay:0.0f];
    [self performSelector:@selector(animatedShowJianJieButton)
               withObject:nil
               afterDelay:0.2f];
    [self performSelector:@selector(animatedShowFuWuButton)
               withObject:nil
               afterDelay:0.2f];
    [self performSelector:@selector(animatedShowFengJingButton)
               withObject:nil
               afterDelay:0.4f];
    [self performSelector:@selector(animatedShowGouMaiButton)
               withObject:nil
               afterDelay:0.4f];
    [self performSelector:@selector(animatedShowMingRenButton)
               withObject:nil
               afterDelay:0.6f];
    [self performSelector:@selector(animatedShowJiaoTongButton)
               withObject:nil
               afterDelay:0.6f];
}

- (void)viewDidUnload {
    [self setBackgroundImageView:nil];
    [self setContentBackgroundImageView:nil];
    [self setLiuChengButton:nil];
    [self setChanPinButton:nil];
    [self setJianJieButton:nil];
    [self setFuWuButton:nil];
    [self setFengJingButton:nil];
    [self setGouMaiButton:nil];
    [self setMingRenButton:nil];
    [self setJiaoTongButton:nil];
    [super viewDidUnload];
}

#define kHGYMainUpperButtonY 22
#define kHGYMainLowerButtonY 185
#define kHGYMainShowButtonDuration 0.8f

- (void)animatedShowLiuChengButton {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:kHGYMainShowButtonDuration];
    
    CGRect frame = self.liuChengButton.frame;
    frame.origin.y = kHGYMainUpperButtonY;
    self.liuChengButton.frame = frame;
    
    [UIView commitAnimations];
}

- (void)animatedShowChanPinButton {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:kHGYMainShowButtonDuration];
    
    CGRect frame = self.chanPinButton.frame;
    frame.origin.y = kHGYMainLowerButtonY;
    self.chanPinButton.frame = frame;
    
    [UIView commitAnimations];
}

- (void)animatedShowJianJieButton {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:kHGYMainShowButtonDuration];
    
    CGRect frame = self.jianJieButton.frame;
    frame.origin.y = kHGYMainUpperButtonY;
    self.jianJieButton.frame = frame;
    
    [UIView commitAnimations];
}

- (void)animatedShowFuWuButton {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:kHGYMainShowButtonDuration];
    
    CGRect frame = self.fuWuButton.frame;
    frame.origin.y = kHGYMainLowerButtonY;
    self.fuWuButton.frame = frame;
    
    [UIView commitAnimations];
}

- (void)animatedShowFengJingButton {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:kHGYMainShowButtonDuration];
    
    CGRect frame = self.fengJingButton.frame;
    frame.origin.y = kHGYMainUpperButtonY;
    self.fengJingButton.frame = frame;
    
    [UIView commitAnimations];
}

- (void)animatedShowGouMaiButton {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:kHGYMainShowButtonDuration];
    
    CGRect frame = self.gouMaiButton.frame;
    frame.origin.y = kHGYMainLowerButtonY;
    self.gouMaiButton.frame = frame;
    
    [UIView commitAnimations];
}

- (void)animatedShowMingRenButton {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:kHGYMainShowButtonDuration];
    
    CGRect frame = self.mingRenButton.frame;
    frame.origin.y = kHGYMainUpperButtonY;
    self.mingRenButton.frame = frame;
    
    [UIView commitAnimations];
}

- (void)animatedShowJiaoTongButton {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:kHGYMainShowButtonDuration];
    
    CGRect frame = self.jiaoTongButton.frame;
    frame.origin.y = kHGYMainLowerButtonY;
    self.jiaoTongButton.frame = frame;
    
    [UIView commitAnimations];
}

@end
