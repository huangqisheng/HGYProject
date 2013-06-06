//
//  HGYChanPinViewController.h
//  HGYProject
//
//  Created by iphone on 5/27/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYRootViewController.h"

#import "HHSmallRollView.h"

@interface HGYChanPinViewController : HGYRootViewController <HHRollViewDatasource, HHRollViewDelegate>

@property (weak, nonatomic) IBOutlet HHSmallRollView *rollView;


@end
