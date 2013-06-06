//
//  HGYLoadDatamodel.m
//  HGYProject
//
//  Created by iphone on 6/3/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYLoadDatamodel.h"
#import "HGYDatamodelImport.h"

#import "HGYDatamodelResolveUtils.h"

@implementation HGYLoadDatamodel

+ (NSArray *)loadChanPins {
    NSArray *chanPinDics = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HGY-ChanPin" ofType:@"plist"]];
    return [HGYDatamodelResolveUtils resolveChanPins:chanPinDics];
}

+ (NSArray *)loadSubChanPinsWithId:(NSString *)chanPinId {
    NSArray *subChanPinDics = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:chanPinId ofType:@"plist"]];
    return [HGYDatamodelResolveUtils resolveSubChanPins:subChanPinDics];
}

+ (NSString *)loadJianJie {
    NSString *jianJie = [[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HGY-JianJie" ofType:@"plist"]] objectForKey:@"jianJie"];
    return jianJie;
}

+ (NSArray *)loadHonors {
    NSArray *honors = [[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HGY-JianJie" ofType:@"plist"]] objectForKey:@"honors"];
    return honors;
}

+ (NSArray *)loadFuWus {
    NSArray *fuWuDics = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HGY-FuWu" ofType:@"plist"]];
    return [HGYDatamodelResolveUtils resolveFuWus:fuWuDics];
}

+ (NSArray *)loadLuXians {
    NSArray *luXianDics = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HGY-LuXian" ofType:@"plist"]];
    return [HGYDatamodelResolveUtils resolveLuXians:luXianDics];
}

+ (NSArray *)loadMingRens {
    NSArray *mingRenDics = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HGY-MingRen" ofType:@"plist"]];
    return [HGYDatamodelResolveUtils resolveMingRens:mingRenDics];
}

+ (NSArray *)loadFengJings {
    NSArray *fengJings = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HGY-FengJing" ofType:@"plist"]];
    return [HGYDatamodelResolveUtils resolveFengJings:fengJings];
}

@end
