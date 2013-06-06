//
//  HGYFuWu.h
//  HGYProject
//
//  Created by iphone on 6/3/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HGYModel.h"

@interface HGYFuWu : HGYModel

@property (strong, nonatomic) NSString *fuWuId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *defaultImage;
@property (strong, nonatomic) NSString *biaoGe;
@property (strong, nonatomic) NSArray *details;

@end
