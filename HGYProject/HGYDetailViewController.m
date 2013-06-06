//
//  HGYDetailViewController.m
//  HGYProject
//
//  Created by iphone on 6/4/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "HGYDetailViewController.h"
#import "HGYPopoverView.h"
#import "HGYYuanQuBigImageView.h"

@interface HGYDetailViewController ()

@end

@implementation HGYDetailViewController {
    __weak NSArray *_thumbnails;
    __weak NSArray *_images;
    __weak NSArray *_bigImages;
    __weak NSString *_name;
    __weak NSString *_detail1;
    __weak NSString *_detail2;
    __weak NSString *_detail3;
    __weak NSString *_title1;
    __weak NSString *_title2;
    __weak NSString *_title3;
    
    NSInteger _selectIndex;
}

#define kHGYDetailCellTag 124324

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
    
    self.seperatorView.backgroundColor = kHGYSeperatorColor;
    self.titleLabel1.backgroundColor = kHGYSeperatorColor;
    self.titleLabel1.layer.cornerRadius = 10.0f;
    self.titleLabel1.clipsToBounds = YES;
    self.titleLabel2.backgroundColor = kHGYSeperatorColor;
    self.titleLabel2.layer.cornerRadius = 10.0f;
    self.titleLabel2.clipsToBounds = YES;
    self.titleLabel3.backgroundColor = kHGYSeperatorColor;
    self.titleLabel3.layer.cornerRadius = 10.0f;
    self.titleLabel3.clipsToBounds = YES;
    if (self.mingRen) {
        _thumbnails = self.mingRen.thumbnails;
        _images = self.mingRen.images;
        _name = self.mingRen.name;
        _title1 = @"生前荣誉";
        _title2 = @"个人经历";
        _detail1 = self.mingRen.honors;
        _detail2 = self.mingRen.profile;
    } else if (self.subChanPin) {
        _thumbnails = self.subChanPin.thumbnails;
        _images = self.subChanPin.images;
        _name = self.subChanPin.name;
        _title1 = @"墓碑材质";
        _title2 = @"墓地尺寸";
        _title3 = @"墓地特点";
        _detail1 = self.subChanPin.material;
        _detail2 = self.subChanPin.size;
        _detail3 = self.subChanPin.feature;
    }
    self.titleLabel.text = _name;
    self.nameLabel.text = _name;
    self.titleLabel1.text = _title1;
    self.titleLabel2.text = _title2;
    self.titleLabel3.text = _title3;
    self.detailLabel1.text = _detail1;
    self.detailLabel2.text = _detail2;
    self.detailLabel3.text = _detail3;
    
    [self layoutViews];
    
    _selectIndex = 0;
    self.gridView.layoutDirection = AQGridViewLayoutDirectionHorizontal;
    [self.gridView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [self.gridView setAutoresizesSubviews:YES];
    [self.gridView reloadData];
}

- (void)layoutViews {
    CGRect frame;
    if (self.mingRen) {
        self.titleLabel3.hidden = YES;
        self.detailLabel3.hidden = YES;
    } else {
        self.nameLabel.hidden = YES;
        self.seperatorView.hidden = YES;
        
        frame = self.titleLabel1.frame;
        frame.origin.y = self.nameLabel.frame.origin.y;
        self.titleLabel1.frame = frame;
        
        
    }
    
    frame = self.detailLabel1.frame;
    CGSize detail1Size = [self.detailLabel1.text sizeWithFont:self.detailLabel1.font constrainedToSize:CGSizeMake(frame.size.width, __FLT_MAX__) lineBreakMode:self.detailLabel1.lineBreakMode];
    frame.size.height = detail1Size.height;
    frame.origin.y = self.titleLabel1.frame.origin.y + self.titleLabel1.frame.size.height + 10;
    self.detailLabel1.frame = frame;
    
    frame = self.titleLabel2.frame;
    frame.origin.y = self.detailLabel1.frame.origin.y + self.detailLabel1.frame.size.height + 20;
    self.titleLabel2.frame = frame;
    
    frame = self.detailLabel2.frame;
    CGSize detail2Size = [self.detailLabel2.text sizeWithFont:self.detailLabel2.font constrainedToSize:CGSizeMake(frame.size.width, __FLT_MAX__) lineBreakMode:self.detailLabel2.lineBreakMode];
    frame.size.height = detail2Size.height;
    frame.origin.y = self.titleLabel2.frame.origin.y + self.titleLabel2.frame.size.height + 10;
    self.detailLabel2.frame = frame;
    
    if (!self.titleLabel3.isHidden) {
        frame = self.titleLabel3.frame;
        frame.origin.y = self.detailLabel2.frame.origin.y + self.detailLabel2.frame.size.height + 20;
        self.titleLabel3.frame = frame;
        
        frame = self.detailLabel3.frame;
        CGSize detail3Size = [self.detailLabel3.text sizeWithFont:self.detailLabel3.font constrainedToSize:CGSizeMake(frame.size.width, __FLT_MAX__) lineBreakMode:self.detailLabel3.lineBreakMode];
        frame.size.height = detail3Size.height;
        frame.origin.y = self.titleLabel3.frame.origin.y + self.titleLabel3.frame.size.height + 10;
        self.detailLabel3.frame = frame;
        
#ifdef DEBUG
        NSLog(@"detail label3 frame : %@", NSStringFromCGRect(self.detailLabel3.frame));
#endif
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, self.detailLabel3.frame.origin.y + self.detailLabel3.frame.size.height + 20);
        
#ifdef DEBUG
        NSLog(@"content size : %@", NSStringFromCGSize(self.scrollView.contentSize));
#endif
    } else {
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, self.detailLabel2.frame.origin.y + self.detailLabel2.frame.size.height + 20);
    }

}

- (void)viewDidUnload {
    [self setBigImageView:nil];
    [self setGridView:nil];
    [self setNameLabel:nil];
    [self setSeperatorView:nil];
    [self setTitleLabel1:nil];
    [self setDetailLabel1:nil];
    [self setTitleLabel2:nil];
    [self setDetailLabel2:nil];
    [self setTitleLabel3:nil];
    [self setDetailLabel3:nil];
    [self setBackgroundImageView:nil];
    [self setContentBackgroundImageView:nil];
    [self setScrollView:nil];
    [super viewDidUnload];
}

#pragma mark - aqgridview datasource
- (NSUInteger)numberOfItemsInGridView:(AQGridView *)gridView {
    if (_thumbnails) {
        return [_thumbnails count];
    }
    return 0;
}

- (CGSize)portraitGridCellSizeForGridView:(AQGridView *)gridView {
    return CGSizeMake(70, 65);
}

- (AQGridViewCell *)gridView:(AQGridView *)gridView cellForItemAtIndex:(NSUInteger)index {
    static NSString *identifier = @"kHGYDetailCell";
    AQGridViewCell *cell = [gridView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[AQGridViewCell alloc] initWithFrame:CGRectMake(0, 0, 70, 65) reuseIdentifier:identifier];
        [cell setSelectionStyle:AQGridViewCellSelectionStyleNone];
        cell.backgroundColor = [UIColor blackColor];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 65, 65)];
        imageView.tag = kHGYDetailCellTag;
        [cell.contentView addSubview:imageView];
    }
    UIImageView *view = (UIImageView*)[cell viewWithTag:kHGYDetailCellTag];
    view.image = [UIImage imageNamed:[_thumbnails objectAtIndex:index]];
    
    if (index == _selectIndex) {
        view.layer.borderColor = kHGYSeperatorColor.CGColor;
        view.layer.borderWidth = 2.0f;
        self.bigImageView.image = [UIImage imageNamed:[_images objectAtIndex:index]];
    } else {
        view.layer.borderColor = [UIColor clearColor].CGColor;
        view.layer.borderWidth = 0.0f;
    }
    
    return cell;
}

#pragma mark - gridview delegate
- (void)gridView:(AQGridView *)gridView didSelectItemAtIndex:(NSUInteger)index {
    AQGridViewCell *cell = [gridView cellForItemAtIndex:index];
    UIImageView *view = (UIImageView*)[cell viewWithTag:kHGYDetailCellTag];
    view.layer.borderColor = kHGYSeperatorColor.CGColor;
    view.layer.borderWidth = 2.0f;
    
    AQGridViewCell *cell1 = [gridView cellForItemAtIndex:_selectIndex];
    UIImageView *view1 = (UIImageView*)[cell1 viewWithTag:kHGYDetailCellTag];
    view1.layer.borderColor = [UIColor clearColor].CGColor;
    view1.layer.borderWidth = 0.0f;
    _selectIndex = index;
    
    self.bigImageView.image = [UIImage imageNamed:[_images objectAtIndex:index]];
}


- (IBAction)showBigImage:(id)sender {
    NSArray *images = nil;
    if (self.mingRen) {
        images = self.mingRen.images;
    } else if (self.subChanPin) {
        images = self.subChanPin.images;
    }
    
    
    HGYYuanQuBigImageView *view = [HGYYuanQuBigImageView yuanQuBigImageView];
    view.originSelectIndex = _selectIndex;
    view.images = images;
    
    HGYPopoverView *popover = [HGYPopoverView popoverView];
    popover.contentView = view;
    
    [popover showInView:self.view animated:YES];
}
@end
