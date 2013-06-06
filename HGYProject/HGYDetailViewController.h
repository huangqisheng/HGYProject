//
//  HGYDetailViewController.h
//  HGYProject
//
//  Created by iphone on 6/4/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYRootViewController.h"

#import "AQGridView.h"

@interface HGYDetailViewController : HGYRootViewController <AQGridViewDataSource, AQGridViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *contentBackgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;

@property (weak, nonatomic) IBOutlet AQGridView *gridView;
@property (weak, nonatomic) IBOutlet UIView *seperatorView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel1;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel1;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel2;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel2;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel3;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel3;

@property (strong, nonatomic) HGYMingRen *mingRen;
@property (strong, nonatomic) HGYSubChanPin *subChanPin;

- (IBAction)showBigImage:(id)sender;


@end
