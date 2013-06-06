//
//  HGYDatamodelResolveUtils.h
//  HGYProject
//
//  Created by iphone on 6/3/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HGYDatamodelClass.h"

@interface HGYDatamodelResolveUtils : NSObject

#pragma mark - chan pin
+ (HGYChanPin *)resolveChanPin:(NSDictionary *)dic;
+ (NSArray *)resolveChanPins:(NSArray *)array;
+ (HGYSubChanPin *)resolveSubChanPin:(NSDictionary *)dic;
+ (NSArray *)resolveSubChanPins:(NSArray *)array;

#pragma mark - fuwu
+ (HGYFuWu *)resolveFuWu:(NSDictionary *)dic;
+ (NSArray *)resolveFuWus:(NSArray *)array;

#pragma mark - luxian
+ (HGYLuXian *)resolveLuXian:(NSDictionary *)dic;
+ (NSArray *)resolveLuXians:(NSArray *)array;

#pragma mark - mingren
+ (HGYMingRen *)resolveMingRen:(NSDictionary *)dic;
+ (NSArray *)resolveMingRens:(NSArray *)array;

#pragma mark - fengjing
+ (HGYFengJing *)resolveFengJing:(NSDictionary *)dic;
+ (NSArray *)resolveFengJings:(NSArray *)array;

@end
