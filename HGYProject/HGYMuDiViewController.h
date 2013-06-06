//
//  HGYMuDiViewController.h
//  HGYProject
//
//  Created by iphone on 6/3/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYRootViewController.h"

#import "HHSmallRollView.h"

@interface HGYMuDiViewController : HGYRootViewController <HHRollViewDatasource, HHRollViewDelegate>

@property (weak, nonatomic) IBOutlet HHSmallRollView *rollView;

@property (strong, nonatomic) NSString *chanPinId;

@end
