//
//  HGYPenHuaViewController.h
//  HGYProject
//
//  Created by iphone on 6/5/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYRootViewController.h"

@interface HGYPenHuaViewController : HGYRootViewController

@property (strong, nonatomic) HGYFuWu *fuWu;

@property (weak, nonatomic) IBOutlet UIView *contentBackgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *biaoGeImageView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;

@end
