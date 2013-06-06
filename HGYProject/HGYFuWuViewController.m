//
//  HGYFuWuViewController.m
//  HGYProject
//
//  Created by iphone on 5/27/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYFuWuViewController.h"
#import "HGYLiYiViewController.h"
#import "HGYZhuiSiViewController.h"
#import "HGYPenHuaViewController.h"

#import "HGYFuWuListCellView.h"

@interface HGYFuWuViewController ()

@end

@implementation HGYFuWuViewController {
    NSArray *_fuWus;
    
    NSInteger _count;
}

#define kHGYFuWuListCellGap 15.0

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
    
    if (!_fuWus) {
        _fuWus = [HGYLoadDatamodel loadFuWus];
    }
    _count = [_fuWus count];
    
    if (_count > 0) {
        static CGFloat cellCenterY = 352.0f;
        CGFloat viewWidth = 1024.0f;
        CGFloat factor = (_count - 1) * 0.5;
        
        for (int i = 0; i < _count; i ++) {
            HGYFuWu *fuWu = [_fuWus objectAtIndex:i];
            
            HGYFuWuListCellView *view = [HGYFuWuListCellView fuWuListCellView];
            view.imageView.image = [UIImage imageNamed:fuWu.defaultImage];
            view.titleLabel.text = fuWu.name;
            [self.view addSubview:view];
            view.center = CGPointMake((view.frame.size.width + 15) * (i - factor) + viewWidth / 2, cellCenterY);
            switch (i) {
                case 0: {
                    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fuWu1Tapped:)];
                    [view addGestureRecognizer:tap];
                    break;
                }
                    
                case 1: {
                    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fuWu2Tapped:)];
                    [view addGestureRecognizer:tap];
                    break;
                }
                    
                case 2: {
                    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fuWu3Tapped:)];
                    [view addGestureRecognizer:tap];
                    break;
                }
                    
                case 3: {
                    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fuWu4Tapped:)];
                    [view addGestureRecognizer:tap];
                    break;
                }
                    
                default:
                    break;
            }
        }
        
    }
    
}

- (void)fuWu1Tapped:(id)sender {
    NSLog(@"11111111))))))~~~~~~~~~");
    
    [self pushToFuWuDetailViewControllerWithFuWu:[_fuWus objectAtIndex:0]];
}

- (void)fuWu2Tapped:(id)sender {
    NSLog(@"22222222))))))~~~~~~~~~");
    
    if ([_fuWus count] > 1) {
        [self pushToFuWuDetailViewControllerWithFuWu:[_fuWus objectAtIndex:1]];
    }
    
}

- (void)fuWu3Tapped:(id)sender {
    NSLog(@"333333333))))))~~~~~~~~~");
    
    if ([_fuWus count] > 2) {
        [self pushToFuWuDetailViewControllerWithFuWu:[_fuWus objectAtIndex:2]];
    }
}

- (void)fuWu4Tapped:(id)sender {
    NSLog(@"44444444))))))~~~~~~~~~");
    
    if ([_fuWus count] > 3) {
        [self pushToFuWuDetailViewControllerWithFuWu:[_fuWus objectAtIndex:3]];
    }
}

- (void)pushToFuWuDetailViewControllerWithFuWu:(HGYFuWu *)fuWu {
    HGYRootViewController *viewController = nil;
    if ([@"fuwu-phzb" isEqualToString:fuWu.fuWuId]) {
        
        HGYPenHuaViewController *penHuaViewController = [[HGYPenHuaViewController alloc] initWithNibName:nil bundle:nil];
        penHuaViewController.fuWu = fuWu;
        viewController = penHuaViewController;
        
    } else if ([@"fuwu-lyzs" isEqualToString:fuWu.fuWuId]) {
        
        HGYZhuiSiViewController *zhuiSiViewController = [[HGYZhuiSiViewController alloc] initWithNibName:nil bundle:nil];
        zhuiSiViewController.fuWu = fuWu;
        viewController = zhuiSiViewController;
        
    } else {
        
        HGYLiYiViewController *liYiViewController = [[HGYLiYiViewController alloc] initWithNibName:nil bundle:nil];
        liYiViewController.fuWu = fuWu;
        viewController = liYiViewController;
        
    }
    if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]) {
        [self presentViewController:viewController animated:YES completion:nil];
    } else {
        [self presentModalViewController:viewController animated:YES];
    }
}

@end
