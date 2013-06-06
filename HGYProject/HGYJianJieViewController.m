//
//  HGYJianJieViewController.m
//  HGYProject
//
//  Created by iphone on 5/27/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYJianJieViewController.h"

@interface HGYJianJieViewController ()

@end

@implementation HGYJianJieViewController {
    NSArray *_honors;
    NSString *_jianJie;
}

#define kHGYJianJieContentMaxHeight 395
#define kHGYJianJieSelectedArrowFrame CGRectMake(703, 462, 28, 14)
#define kHGYHonorSelectedArrowFrame CGRectMake(780, 462, 28, 14)

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.contentBackgroundImageView.image = [UIImage imageNamed:@"jieshao-bg.png"];
    self.detailBackgroundImageView.image = [[UIImage imageNamed:@"jieshao-bgxiao1.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [self.honorButton setTitleColor:kHGYSeperatorColor forState:UIControlStateNormal];
    [self.jianJieButton setTitleColor:kHGYSeperatorColor forState:UIControlStateNormal];
    
    [self.detailBackgroundImageView setHidden:YES];
    [self.arrowImageView setHidden:YES];
}

- (void)viewDidUnload {
    [self setContentBackgroundImageView:nil];
    [self setHonorButton:nil];
    [self setJianJieButton:nil];
    [self setDetailBackgroundImageView:nil];
    [self setScrollView:nil];
    [self setTextView:nil];
    [self setArrowImageView:nil];
    [super viewDidUnload];
}

- (IBAction)showHonor:(id)sender {
    if (self.jianJieButton.isSelected) {
        [self.jianJieButton setSelected:NO];
    }
    if (!self.textView.isHidden) {
        [self.textView setHidden:YES];
    }
    if (self.detailBackgroundImageView.isHidden) {
        [self.detailBackgroundImageView setHidden:NO];
    }
    if (self.arrowImageView.isHidden) {
        [self.arrowImageView setHidden:NO];
        self.arrowImageView.frame = kHGYHonorSelectedArrowFrame;
    }
    if (!self.honorButton.isSelected) {
        [self.honorButton setSelected:YES];
        
        if (self.scrollView.isHidden) {
            [self.scrollView setHidden:NO];
        }
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5f];
        if (!_honors) {
            _honors = [HGYLoadDatamodel loadHonors];
            
            CGFloat scrollWidth = 0.0;
            for (int i = 0; i < [_honors count]; i++) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((180 + 10) * i, 0, 180, 117)];
                imageView.image = [UIImage imageNamed:[_honors objectAtIndex:i]];
                [self.scrollView addSubview:imageView];
                
                scrollWidth += 180 + 10;
            }
            CGRect frame = self.scrollView.frame;
            frame.size.height = 117;
            self.scrollView.frame = frame;
            
            [self.scrollView setContentSize:CGSizeMake(scrollWidth, self.scrollView.frame.size.height)];
        }
        CGRect frame = self.detailBackgroundImageView.frame;
        frame.origin.y -= (self.scrollView.frame.size.height + 40 - frame.size.height);
        frame.size.height = self.scrollView.frame.size.height + 40;
        self.detailBackgroundImageView.frame = frame;
        
        self.arrowImageView.frame = kHGYHonorSelectedArrowFrame;
        
        [UIView commitAnimations];
    }
    
}

- (IBAction)showJianJie:(id)sender {
    if (self.honorButton.isSelected) {
        [self.honorButton setSelected:NO];
    }
    if (!self.scrollView.isHidden) {
        [self.scrollView setHidden:YES];
    }
    if (self.detailBackgroundImageView.isHidden) {
        [self.detailBackgroundImageView setHidden:NO];
    }
    if (self.arrowImageView.isHidden) {
        [self.arrowImageView setHidden:NO];
        self.arrowImageView.frame = kHGYJianJieSelectedArrowFrame;
    }
    if (!self.jianJieButton.isSelected) {
        [self.jianJieButton setSelected:YES];
        
        if (self.textView.isHidden) {
            [self.textView setHidden:NO];
        }
        
        if (!_jianJie) {
            _jianJie = [HGYLoadDatamodel loadJianJie];
            self.textView.text = _jianJie;
        }
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5f];
        
        CGSize size = [_jianJie sizeWithFont:self.textView.font constrainedToSize:CGSizeMake(self.textView.bounds.size.width, __FLT_MAX__) lineBreakMode:NSLineBreakByTruncatingTail];
        
        CGRect frame = self.textView.frame;
        if (size.height > kHGYJianJieContentMaxHeight) {
            frame.size.height = kHGYJianJieContentMaxHeight;
        } else {
            frame.size.height = size.height + 10;
        }
        self.textView.frame = frame;
        self.textView.contentSize = CGSizeMake(self.textView.frame.size.width, size.height);
        
        frame = self.detailBackgroundImageView.frame;
        frame.origin.y -= (self.textView.frame.size.height + 40 - frame.size.height);
        frame.size.height = self.textView.frame.size.height + 40;
        self.detailBackgroundImageView.frame = frame;
        
        self.arrowImageView.frame = kHGYJianJieSelectedArrowFrame;
        
        [UIView commitAnimations];
    }
    
}
@end
