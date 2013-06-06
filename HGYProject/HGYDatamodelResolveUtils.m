//
//  HGYDatamodelResolveUtils.m
//  HGYProject
//
//  Created by iphone on 6/3/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYDatamodelResolveUtils.h"

#import "HGYDatamodelImport.h"

@implementation HGYDatamodelResolveUtils

#pragma mark - chan pin
+ (HGYChanPin *)resolveChanPin:(NSDictionary *)dic {
    if (!dic
        || [dic count] <= 0) {
        return nil;
    }
    HGYChanPin *object = [[HGYChanPin alloc] init];
    for (NSString *key in dic) {
        [object setValue:[dic objectForKey:key] forKey:key];
    }
    return object;
}

+ (NSArray *)resolveChanPins:(NSArray *)array {
    if (!array
        || [array count] <= 0) {
        return nil;
    }
    NSMutableArray *objects = [[NSMutableArray alloc] initWithCapacity:[array count]];
    for (NSDictionary *dic in array) {
        HGYChanPin *object = [self resolveChanPin:dic];
        if (object) {
            [objects addObject:object];
        }
    }
    return objects;
}

+ (HGYSubChanPin *)resolveSubChanPin:(NSDictionary *)dic {
    if (!dic
        || [dic count] <= 0) {
        return nil;
    }
    HGYSubChanPin *object = [[HGYSubChanPin alloc] init];
    for (NSString *key in dic) {
        [object setValue:[dic objectForKey:key] forKey:key];
    }
    return object;
}

+ (NSArray *)resolveSubChanPins:(NSArray *)array {
    if (!array
        || [array count] <= 0) {
        return nil;
    }
    NSMutableArray *objects = [[NSMutableArray alloc] initWithCapacity:[array count]];
    for (NSDictionary *dic in array) {
        HGYSubChanPin *object = [self resolveSubChanPin:dic];
        if (object) {
            [objects addObject:object];
        }
    }
    return objects;
}

#pragma mark - fuwu
+ (HGYFuWu *)resolveFuWu:(NSDictionary *)dic {
    if (!dic
        || [dic count] <= 0) {
        return nil;
    }
    HGYFuWu *object = [[HGYFuWu alloc] init];
    for (NSString *key in dic) {
        [object setValue:[dic objectForKey:key] forKey:key];
    }
    return object;
}

+ (NSArray *)resolveFuWus:(NSArray *)array {
    if (!array
        || [array count] <= 0) {
        return nil;
    }
    NSMutableArray *objects = [[NSMutableArray alloc] initWithCapacity:[array count]];
    for (NSDictionary *dic in array) {
        HGYFuWu *object = [self resolveFuWu:dic];
        if (object) {
            [objects addObject:object];
        }
    }
    return objects;
}

#pragma mark - luxian
+ (HGYLuXian *)resolveLuXian:(NSDictionary *)dic {
    if (!dic
        || [dic count] <= 0) {
        return nil;
    }
    HGYLuXian *object = [[HGYLuXian alloc] init];
    for (NSString *key in dic) {
        if ([@"points" isEqualToString:key]) {
            NSArray *points = [self resolvePoints:[dic objectForKey:@"points"]];
            if (points) {
                object.points = points;
            }
        } else {
            [object setValue:[dic objectForKey:key] forKey:key];
        }
    }
    return object;
}

+ (NSArray *)resolvePoints:(NSArray *)array {
    if (!array
        || [array count] <= 0) {
        return nil;
    }
    NSMutableArray *objects = [[NSMutableArray alloc] initWithCapacity:[array count]];
    for (NSDictionary *dic in array) {
        CGPoint point;
        point.x = [[dic objectForKey:@"x"] floatValue];
        point.y = [[dic objectForKey:@"y"] floatValue];
        NSValue *object = [NSValue valueWithCGPoint:point];
        if (object) {
            [objects addObject:object];
        }
    }
    return objects;
}

+ (NSArray *)resolveLuXians:(NSArray *)array {
    if (!array
        || [array count] <= 0) {
        return nil;
    }
    NSMutableArray *objects = [[NSMutableArray alloc] initWithCapacity:[array count]];
    for (NSDictionary *dic in array) {
        HGYLuXian *object = [self resolveLuXian:dic];
        if (object) {
            [objects addObject:object];
        }
    }
    return objects;
}

#pragma mark - mingren
+ (HGYMingRen *)resolveMingRen:(NSDictionary *)dic {
    if (!dic
        || [dic count] <= 0) {
        return nil;
    }
    HGYMingRen *object = [[HGYMingRen alloc] init];
    for (NSString *key in dic) {
        [object setValue:[dic objectForKey:key] forKey:key];
    }
    return object;
}

+ (NSArray *)resolveMingRens:(NSArray *)array {
    if (!array
        || [array count] <= 0) {
        return nil;
    }
    NSMutableArray *objects = [[NSMutableArray alloc] initWithCapacity:[array count]];
    for (NSDictionary *dic in array) {
        HGYMingRen *object = [self resolveMingRen:dic];
        if (object) {
            [objects addObject:object];
        }
    }
    return objects;
}

#pragma mark - fengjing
+ (HGYFengJing *)resolveFengJing:(NSDictionary *)dic {
    if (!dic
        || [dic count] <= 0) {
        return nil;
    }
    HGYFengJing *object = [[HGYFengJing alloc] init];
    for (NSString *key in dic) {
        [object setValue:[dic objectForKey:key] forKey:key];
    }
    return object;
}

+ (NSArray *)resolveFengJings:(NSArray *)array {
    if (!array
        || [array count] <= 0) {
        return nil;
    }
    NSMutableArray *objects = [[NSMutableArray alloc] initWithCapacity:[array count]];
    for (NSDictionary *dic in array) {
        HGYFengJing *object = [self resolveFengJing:dic];
        if (object) {
            [objects addObject:object];
        }
    }
    return objects;
}

@end
