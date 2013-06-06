//
//  HGYRootViewController.m
//  HGYProject
//
//  Created by iphone on 5/27/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYRootViewController.h"

#import "HGYSettingViewController.h"
#import "HGYPopoverView.h"

@interface HGYRootViewController ()

@end

@implementation HGYRootViewController {
    UIPopoverController *_popover;
}

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
    
    self.backgroundImageView.image = [UIImage imageNamed:@"background.png"];
    self.titleBGImageView.image = kHGYTitleImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToMainPage:(id)sender {
    if ([self respondsToSelector:@selector(dismissViewControllerAnimated:completion:)]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self dismissModalViewControllerAnimated:YES];
    }
}

- (IBAction)goToSetting:(id)sender {
    
    HGYSettingViewController *viewController = [HGYSettingViewController sharedInstance];
    HGYPopoverView *popover = [HGYPopoverView popoverView];
    popover.contentView = viewController.view;
    [popover showInView:self.view animated:YES];
}

- (IBAction)back:(id)sender {
    if ([self respondsToSelector:@selector(dismissViewControllerAnimated:completion:)]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self dismissModalViewControllerAnimated:YES];
    }
}

@end
