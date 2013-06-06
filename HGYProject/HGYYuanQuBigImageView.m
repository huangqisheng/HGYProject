//
//  HGYYuanQuBigImageView.m
//  HGYProject
//
//  Created by iphone on 5/29/13.
//  Copyright (c) 2013 HGY. All rights reserved.
//

#import "HGYYuanQuBigImageView.h"

@implementation HGYYuanQuBigImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setImages:(NSArray *)images {
    if (images
        && _images != images) {
        _images = images;
        
        if (self.gridView) {
            [self.gridView setLayoutDirection:AQGridViewLayoutDirectionHorizontal];
            [self.gridView reloadData];
            if (self.originSelectIndex > 0) {
                [self.gridView scrollToItemAtIndex:self.originSelectIndex atScrollPosition:AQGridViewScrollPositionNone animated:NO];
            }
        }
    }
}

- (void)setOriginSelectIndex:(NSInteger)originSelectIndex {
    if (originSelectIndex != _originSelectIndex) {
        _originSelectIndex = originSelectIndex;
        
        if ([self.gridView numberOfItems] > 0) {
            [self.gridView scrollToItemAtIndex:self.originSelectIndex atScrollPosition:AQGridViewScrollPositionMiddle animated:NO];
        }
    }
}

#pragma mark - grid view datasource

#define kHGYYuanQuBigImageViewTag 123098

- (NSUInteger)numberOfItemsInGridView:(AQGridView *)gridView {
    if (self.images) {
        return [self.images count];
    }
    return 0;
}

- (CGSize)portraitGridCellSizeForGridView:(AQGridView *)gridView {
    return CGSizeMake(804, 548);
}

- (AQGridViewCell *)gridView:(AQGridView *)gridView cellForItemAtIndex:(NSUInteger)index {
    static NSString *identifier = @"kHGYYuanQuBigImageCell";
    
    AQGridViewCell *cell = [gridView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[AQGridViewCell alloc] initWithFrame:CGRectMake(0, 0, 804, 548) reuseIdentifier:identifier];
        [cell setSelectionStyle:AQGridViewCellSelectionStyleNone];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 804, 548)];
        imageView.tag = kHGYYuanQuBigImageViewTag;
        [cell.contentView addSubview:imageView];
    }
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:kHGYYuanQuBigImageViewTag];
    imageView.image = [UIImage imageNamed:[self.images objectAtIndex:index]];
    return cell;
}

#pragma mark - static
+ (id)yuanQuBigImageView {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"HGYYuanQuBigImageView"
                                                  owner:self
                                                options:nil];
    return [nibs objectAtIndex:0];
}

@end
