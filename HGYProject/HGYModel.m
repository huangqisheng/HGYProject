//
//  HGYModel.m
//  HGYProject
//
//  Created by iphone on 6/3/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYModel.h"

@implementation HGYModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
#ifdef DEBUG
    NSLog(@"%@ is not key value coding for key : %@", NSStringFromClass([self class]), key);
#endif
}

@end
