//
//  HGYPenHuaViewController.m
//  HGYProject
//
//  Created by iphone on 6/5/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "HGYPenHuaViewController.h"

@interface HGYPenHuaViewController ()

@end

@implementation HGYPenHuaViewController

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
    
    self.contentBackgroundView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.contentBackgroundView.layer.shadowOffset = CGSizeMake(1, 1);
    self.contentBackgroundView.layer.shadowOpacity = 0.6f;
    
    self.biaoGeImageView.image = [UIImage imageNamed:self.fuWu.biaoGe];
    NSArray *details = self.fuWu.details;
    if (details
        && [details count] > 0) {
        self.imageView1.image = [UIImage imageNamed:[details objectAtIndex:0]];
        if ([details count] > 1) {
            self.imageView2.image = [UIImage imageNamed:[details objectAtIndex:1]];
        }
    }
    self.titleLabel.text = self.fuWu.name;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
