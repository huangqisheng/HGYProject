//
//  HGYJianJieViewController.h
//  HGYProject
//
//  Created by iphone on 5/27/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYRootViewController.h"

@interface HGYJianJieViewController : HGYRootViewController

@property (weak, nonatomic) IBOutlet UIImageView *contentBackgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *detailBackgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;

@property (weak, nonatomic) IBOutlet UIButton *honorButton;
@property (weak, nonatomic) IBOutlet UIButton *jianJieButton;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction)showHonor:(id)sender;
- (IBAction)showJianJie:(id)sender;


@end
