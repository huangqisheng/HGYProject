//
//  HGYYuanQuBigImageView.h
//  HGYProject
//
//  Created by iphone on 5/29/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AQGridView.h"

@interface HGYYuanQuBigImageView : UIView <AQGridViewDataSource, AQGridViewDelegate>

@property (weak, nonatomic) IBOutlet AQGridView *gridView;

@property (strong, nonatomic) NSArray *images;
@property (nonatomic) NSInteger originSelectIndex;

#pragma mark - static
+ (id)yuanQuBigImageView;

@end
