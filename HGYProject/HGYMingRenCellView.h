//
//  HGYMingRenCellView.h
//  HGYProject
//
//  Created by iphone on 6/4/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGYMingRenCellView : UIImageView

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

+ (id)mingRenCellView;

@end
