//
//  HGYSettingViewController.h
//  HGYProject
//
//  Created by iphone on 5/27/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYRootViewController.h"

@interface HGYSettingViewController : HGYRootViewController

@property (strong, nonatomic) IBOutlet UIImageView *contentBackgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *versionBackgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *versionLabel;
@property (weak, nonatomic) IBOutlet UIButton *updateButton;
@property (weak, nonatomic) IBOutlet UIButton *loginSystemButton;

- (IBAction)updateApp:(id)sender;
- (IBAction)loginSystem:(id)sender;

+ (id)sharedInstance;

@end
