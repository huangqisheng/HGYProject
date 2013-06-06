//
//  HGYChanPinListCellView.h
//  HGYProject
//
//  Created by iphone on 5/29/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGYChanPinListCellView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

+ (id)chanPinListCellView;

@end
