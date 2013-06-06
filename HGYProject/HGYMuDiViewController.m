//
//  HGYMuDiViewController.m
//  HGYProject
//
//  Created by iphone on 6/3/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYMuDiViewController.h"
#import "HGYDetailViewController.h"

#import "HGYMuDiCellView.h"

@interface HGYMuDiViewController ()

@end

@implementation HGYMuDiViewController {
    NSArray *_subChanPins;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.rollView.delegate_ = self;
    self.rollView.datasource_ = self;
    
    if (!_subChanPins) {
        _subChanPins = [HGYLoadDatamodel loadSubChanPinsWithId:self.chanPinId];
    }
    
}

#pragma mark - roll view datasource

#define HH_ROLL_VIEW_SUBVIEW_TAG 1020213

- (NSInteger)numberOfItemsInRollView:(HHSmallRollView *)rollView {
    if (_subChanPins) {
        return [_subChanPins count];
    }
    return 0;
}

- (HHRollViewCell *)rollView:(HHSmallRollView *)rollView cellAtIndex:(NSInteger)index {
    static NSString *identifier = @"kHGYMuDiCell";
    HHRollViewCell *cell = [rollView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        HGYMuDiCellView *cellView = [HGYMuDiCellView muDiCellView];
        cellView.tag = HH_ROLL_VIEW_SUBVIEW_TAG;
        cell = [[HHRollViewCell alloc] initWithFrame:cellView.frame
                                     reuseIdentifier:identifier];
        
        [cell addSubview:cellView];
    }
    HGYMuDiCellView *cellView = (HGYMuDiCellView *)[cell viewWithTag:HH_ROLL_VIEW_SUBVIEW_TAG];
    
    HGYSubChanPin *subChanPin = [_subChanPins objectAtIndex:index];
    cellView.contentImageView.image = [UIImage imageNamed:subChanPin.defaultImage];
    cellView.titleLabel.text = subChanPin.name;
    
    return cell;
}

#pragma mark - roll view delegate
- (void)rollView:(HHSmallRollView *)rollView didSelectCellAtIndex:(NSInteger)index {
    NSLog(@"select me : %d", index);
    HGYDetailViewController *viewController = [[HGYDetailViewController alloc] initWithNibName:nil bundle:nil];
    viewController.subChanPin = [_subChanPins objectAtIndex:index];
    if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]) {
        [self presentViewController:viewController animated:YES completion:nil];
    } else {
        [self presentModalViewController:viewController animated:YES];
    }
}


@end
