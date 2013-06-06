//
//  HGYRootViewController.h
//  HGYProject
//
//  Created by iphone on 5/27/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HGYViewControllerConstants.h"
#import "HGYDatamodelImport.h"
#import "HGYLoadDatamodel.h"

@interface HGYRootViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *titleBGImageView;

- (IBAction)goToMainPage:(id)sender;
- (IBAction)goToSetting:(id)sender;

- (IBAction)back:(id)sender;

@end
