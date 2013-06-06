//
//  HGYLoadDatamodel.h
//  HGYProject
//
//  Created by iphone on 6/3/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HGYDatamodelClass.h"

@interface HGYLoadDatamodel : NSObject

#pragma mark - chan pin
+ (NSArray *)loadChanPins;
+ (NSArray *)loadSubChanPinsWithId:(NSString *)chanPinId;

#pragma mark - jian jie
+ (NSString *)loadJianJie;
+ (NSArray *)loadHonors;

#pragma mark - fuwu
+ (NSArray *)loadFuWus;

#pragma mark - luxian
+ (NSArray *)loadLuXians;

#pragma mark - mingren
+ (NSArray *)loadMingRens;

#pragma mark - fengjing
+ (NSArray *)loadFengJings;

@end
