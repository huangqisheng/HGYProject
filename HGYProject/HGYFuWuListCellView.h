//
//  HGYFuWuListCellView.h
//  HGYProject
//
//  Created by iphone on 6/4/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGYFuWuListCellView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *contentBackgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

#pragma mark - static

+ (id)fuWuListCellView;

@end
