//
//  HGYChanPinViewController.m
//  HGYProject
//
//  Created by iphone on 5/27/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "HGYChanPinViewController.h"
#import "HGYMuDiViewController.h"

#import "HGYChanPinListCellView.h"

@interface HGYChanPinViewController ()

@end

@implementation HGYChanPinViewController {
    NSArray *_chanPins;
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
    
    if (!_chanPins) {
        _chanPins = [HGYLoadDatamodel loadChanPins];
    }
    self.rollView.delegate_ = self;
    self.rollView.datasource_ = self;
}

- (void)viewDidUnload {
    [self setRollView:nil];
    [super viewDidUnload];
}

#pragma mark - roll view datasource

#define HH_ROLL_VIEW_SUBVIEW_TAG 1110213

- (NSInteger)numberOfItemsInRollView:(HHSmallRollView *)rollView {
    if (_chanPins) {
        return [_chanPins count];
    }
    return 0;
}

- (HHRollViewCell *)rollView:(HHSmallRollView *)rollView cellAtIndex:(NSInteger)index {
    static NSString *identifier = @"kHGYChanPinListCell";
    HHRollViewCell *cell = [rollView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        HGYChanPinListCellView *cellView = [HGYChanPinListCellView chanPinListCellView];
        cellView.tag = HH_ROLL_VIEW_SUBVIEW_TAG;
        cell = [[HHRollViewCell alloc] initWithFrame:cellView.frame
                                     reuseIdentifier:identifier];
        
        [cell addSubview:cellView];
    }
    HGYChanPinListCellView *cellView = (HGYChanPinListCellView *)[cell viewWithTag:HH_ROLL_VIEW_SUBVIEW_TAG];
    HGYChanPin *chanPin = [_chanPins objectAtIndex:index];
    cellView.imageView.image = [UIImage imageNamed:[chanPin defaultImage]];
    cellView.textLabel.text = chanPin.name;
    
    return cell;
}

#pragma mark - roll view delegate
- (void)rollView:(HHSmallRollView *)rollView didSelectCellAtIndex:(NSInteger)index {
    NSLog(@"select me : %d", index);
    
    HGYChanPin *chanPin = [_chanPins objectAtIndex:index];
    
    HGYMuDiViewController *viewController = [[HGYMuDiViewController alloc] initWithNibName:nil bundle:nil];
    viewController.chanPinId = chanPin.chanPinId;
    if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]) {
        [self presentViewController:viewController animated:YES completion:nil];
    } else {
        [self presentModalViewController:viewController animated:YES];
    }
}

@end
