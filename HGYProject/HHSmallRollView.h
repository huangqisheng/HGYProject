//
//  HHSmallRollView.h
//  HHRollViewPro
//
//  Created by iphone on 4/17/13.
//  Copyright (c) 2013 HH. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HHRollViewCell.h"

@class HHRollViewCell;
@class HHSmallRollView;

@protocol HHRollViewDatasource <NSObject>

- (HHRollViewCell *)rollView:(HHSmallRollView *)rollView cellAtIndex:(NSInteger)index;
- (NSInteger)numberOfItemsInRollView:(HHSmallRollView *)rollView;

@end

@protocol HHRollViewDelegate <NSObject>

- (void)rollView:(HHSmallRollView *)rollView didSelectCellAtIndex:(NSInteger)index;

@end

@interface HHSmallRollView : UIView

@property (weak, nonatomic) id<HHRollViewDatasource> datasource_;
@property (weak, nonatomic) id<HHRollViewDelegate> delegate_;

- (HHRollViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;

#pragma mark - auto scroll
- (void)autoScroll;

@end
