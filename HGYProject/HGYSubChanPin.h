//
//  HGYSubChanPin.h
//  HGYProject
//
//  Created by iphone on 6/4/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYModel.h"

@interface HGYSubChanPin : HGYModel

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *material;
@property (strong, nonatomic) NSString *size;
@property (strong, nonatomic) NSString *feature;
@property (strong, nonatomic) NSString *defaultImage;
@property (strong, nonatomic) NSArray *thumbnails;
@property (strong, nonatomic) NSArray *images;
@property (strong, nonatomic) NSArray *bigImages;

@end
