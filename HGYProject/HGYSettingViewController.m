//
//  HGYSettingViewController.m
//  HGYProject
//
//  Created by iphone on 5/27/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYSettingViewController.h"

@interface HGYSettingViewController ()

@end

@implementation HGYSettingViewController

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
    
    [self.contentBackgroundImageView setImage:[[UIImage imageNamed:@"setting_bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)]];
    [self.updateButton setBackgroundImage:[[UIImage imageNamed:@"gx.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)] forState:UIControlStateNormal];
    [self.loginSystemButton  setBackgroundImage:[[UIImage imageNamed:@"dl.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)] forState:UIControlStateNormal];
    [self.versionBackgroundImageView setImage:[[UIImage imageNamed:@"banben.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)]];
}

- (void)viewDidUnload {
    [self setContentBackgroundImageView:nil];
    [self setVersionLabel:nil];
    [self setUpdateButton:nil];
    [self setLoginSystemButton:nil];
    [self setVersionBackgroundImageView:nil];
    [super viewDidUnload];
}

- (IBAction)updateApp:(id)sender {
}

- (IBAction)loginSystem:(id)sender {
}

#pragma mark - static
static HGYSettingViewController *settingViewController;

+ (id)sharedInstance {
    if (!settingViewController) {
        settingViewController = [[HGYSettingViewController alloc] initWithNibName:nil bundle:nil];
    }
    return settingViewController;
}

@end
