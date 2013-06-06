//
//  HGYFengJingCellView.h
//  HGYProject
//
//  Created by iphone on 5/28/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGYMuDiCellView : UIView

@property (strong, nonatomic) IBOutlet UIImageView *contentImageView;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

+ (id)muDiCellView;

@end
