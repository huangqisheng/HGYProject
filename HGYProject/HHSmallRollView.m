//
//  HHSmallRollView.m
//  HHRollViewPro
//
//  Created by iphone on 4/17/13.
//  Copyright (c) 2013 HH. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "HHSmallRollView.h"

#import "HHRollViewCell.h"

@interface HHSmallRollView () {
    NSInteger _numberOfItems;
    NSInteger _centerIndex;      //center cell index in all cells
//    NSInteger _fixedCenterIndex; // center cell index in showing cells: 0, 1, 2

    CGPoint _touchBeginPoint;    //drag begin point in self
    CGPoint _touchCurrentPoint;  //drag moved current point in self
    
    NSTimeInterval _beforeUpdateDate;   //the last update screen date
    
    BOOL _isDragging;            //indicate the touch event is dragging
}

@property (strong, nonatomic) NSMutableArray *showingCells; //current showingcells

@property (strong, nonatomic) NSMutableDictionary *reusableCells;

@property (strong, nonatomic) NSTimer *autoScrollTimer;

@end

@implementation HHSmallRollView
static const int HH_ROLL_CENTER_CELL_Z_POSITION = 2002302;    //center cell zposition

static const float HH_ROOL_DIFF_SCALE_FACTOR = 0.1f;          //diff scale factor between different degree of cell

- (id)init
{
    self = [super init];
    if (self) {
        [self config];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self config];
    }
    return self;
}

- (void)config {
    self.multipleTouchEnabled = YES;
    self.clipsToBounds = YES;
    
    if (self.datasource_) {
        [self.datasource_ numberOfItemsInRollView:self];
    }
    
}

- (void)dealloc {
    if (_autoScrollTimer) {
        [_autoScrollTimer invalidate];
        _autoScrollTimer = nil;
    }
}

- (void)initSubviews {
    if (_numberOfItems <= 0
        || !self.datasource_) {
        _centerIndex = 0;
        return;
    }
    NSInteger count = _numberOfItems;
    _centerIndex = count > 3 ? 2 : count / 2;
    if (!self.showingCells) {
        self.showingCells = [[NSMutableArray alloc] initWithCapacity:count];
    } else {
        [self.showingCells removeAllObjects];
    }
    for (NSInteger i = 0; i < count; i ++) {
        HHRollViewCell *cell = [self.datasource_ rollView:self cellAtIndex:i];
        [self addSubview:cell];
        [self.showingCells addObject:cell];
    }
    
    [self layoutViewsWithMovedDistance:0];
}

#pragma mark - reusable cells
- (HHRollViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier {
    if (self.reusableCells
        && [self.reusableCells count] > 0) {
        NSMutableSet *specificeReuseCellSet = [self.reusableCells objectForKey:identifier];
        if (specificeReuseCellSet
            && [specificeReuseCellSet count] > 0) {
            HHRollViewCell *cell = [specificeReuseCellSet anyObject];
            [specificeReuseCellSet removeObject:cell];
            return cell;
        }
    }
    return nil;
}

#pragma mark - layout 
- (void)layoutSubviews {
    [super layoutSubviews];
    if (!self.showingCells
        || [self.showingCells count] <= 0) {
        if (self.datasource_) {
            _numberOfItems = [self.datasource_ numberOfItemsInRollView:self];
        }
        [self initSubviews];
    }
}

- (void)layoutViewsAnimated:(BOOL)animated {
    if (_centerIndex < 0) {
        _centerIndex = 0;
    } else if (_centerIndex > (_numberOfItems - 1)) {
        _centerIndex = _numberOfItems - 1;
    }
    if (animated) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.8f];
    }
    
    [self layoutViewsWithMovedDistance:0];
    
    if (animated) {
        [UIView commitAnimations];
    }
    
}

- (void)layoutViewsWithMovedDistance:(CGFloat)movedDistance {
    CGFloat scaleFactor = movedDistance * 4.0f / self.bounds.size.width;
    for (int i = 0; i < [self.showingCells count]; i ++) {
        HHRollViewCell *cell = [self.showingCells objectAtIndex:i];
        cell.center = [self movedCellCenterWithDiffIndex:(i - _centerIndex)
                                           movedDistance:movedDistance];
        cell.transform = [self movedCellTransformWithDiffIndex:(i - _centerIndex)
                                                   movedFactor:scaleFactor];
        if (movedDistance >= self.bounds.size.width / 8.0f) {
            if (i == _centerIndex - 1) {
                cell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION;
            } else if (i == _centerIndex
                       || i == _centerIndex - 2) {
                cell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION - 1;
            } else if (i == _centerIndex + 1
                       || i == _centerIndex - 3) {
                cell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION - 2;
            } else {
                cell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION - 3;
            }
        } else if (movedDistance <= -self.bounds.size.width / 8.0f) {
            if (i == _centerIndex + 1) {
                cell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION;
            } else if (i == _centerIndex
                       || i == _centerIndex + 2) {
                cell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION - 1;
            } else if (i == _centerIndex - 1
                       || i == _centerIndex + 3) {
                cell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION - 2;
            } else {
                cell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION - 3;
            }
        } else {
            if (i == _centerIndex) {
                cell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION;
            } else if (i == _centerIndex - 1
                       || i == _centerIndex + 1) {
                cell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION - 1;
            } else if (i == _centerIndex - 2
                       || i == _centerIndex + 2) {
                cell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION - 2;
            } else {
                cell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION - 3;
            }
        }
    }
    if (movedDistance >= self.bounds.size.width / 4.0f) {
//        [self removeRightModelCell];
//        [self initLeftModelCell];
        _touchBeginPoint = _touchCurrentPoint;
        _centerIndex --;
    } else if (movedDistance <= - self.bounds.size.width / 4.0f) {
//        [self removeLeftModeCell];
//        [self initRightModelCell];
        _centerIndex ++;
        _touchBeginPoint = _touchCurrentPoint;
    }
}

#pragma mark - auto scroll
- (void)autoScroll {
    if (self.autoScrollTimer) {
        [self.autoScrollTimer invalidate];
        self.autoScrollTimer = nil;
    }
    self.autoScrollTimer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(animatedToNext) userInfo:nil repeats:YES];
}

- (void)animatedToNext {
//    [self removeLeftModeCell];
//    [self initRightModelCell];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0f];
    
    [self layoutViewsWithMovedDistance:0];
    
    [UIView commitAnimations];
}

#pragma mark - touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    _touchBeginPoint = [touch locationInView:self];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    _touchCurrentPoint = [touch locationInView:self];
    
    if (!_isDragging) {
        if (fabsf(_touchBeginPoint.x - _touchCurrentPoint.x) < 3
            && fabsf(_touchBeginPoint.y - _touchCurrentPoint.y) < 3) {
            _isDragging = NO;
            return;
        } else {
            _isDragging = YES;
        }
    }
    if (_beforeUpdateDate) {
        CGFloat timeInterval = touch.timestamp - _beforeUpdateDate;
        if (timeInterval < 0.02) {
            return;
        } else {
            _beforeUpdateDate = [touch timestamp];
        }
    } else {
        _beforeUpdateDate = [touch timestamp];
    }
    
    CGFloat scrollDistance = _touchCurrentPoint.x - _touchBeginPoint.x;
    if (scrollDistance > self.bounds.size.width / 4.0f) {
        scrollDistance = self.bounds.size.width / 4.0f;
    } else if (scrollDistance < - self.bounds.size.width / 4.0f) {
        scrollDistance = - self.bounds.size.width / 4.0f;
    }
    
    [self layoutViewsWithMovedDistance:scrollDistance];
//    for (int i = 0; i < [self.showingCells count]; i ++) {
//        HHRollViewCell *cell = [self.showingCells objectAtIndex:i];
//        cell.center = [self movedCellCenterWithDiffIndex:(i - 2)
//                                           movedDistance:scrollDistance];
//        cell.transform = [self movedCellTransformWithDiffIndex:(i - 2)
//                                                   movedFactor:scaleFactor];
//        
//    }
//    if (scrollDistance >= self.bounds.size.width / 8.0f) {
//        HHRollViewCell *leftCell = [self.showingCells objectAtIndex:1];
//        HHRollViewCell *centerCell = [self.showingCells objectAtIndex:2];
//        
//        leftCell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION;
//        centerCell.layer.zPosition = HH_ROLL_SECOND_DEGREE_CELL_Z_POSITION;
//        [leftCell showFront];
//        [centerCell fadeBack];
//        if (leftCell.center.x >= self.bounds.size.width / 2) {
//            [self initLeftModelCell];
//            [self removeRightModelCell];
//            _touchBeginPoint = _touchCurrentPoint;
//        }
//    } else if (scrollDistance <= - self.bounds.size.width / 8.0f) {
//        HHRollViewCell *rightCell = [self.showingCells objectAtIndex:3];
//        HHRollViewCell *centerCell = [self.showingCells objectAtIndex:2];
//        rightCell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION;
//        centerCell.layer.zPosition = HH_ROLL_SECOND_DEGREE_CELL_Z_POSITION;
//        [rightCell showFront];
//        [centerCell fadeBack];
//        if (rightCell.center.x <= self.bounds.size.width / 2) {
//            [self initRightModelCell];
//            [self removeLeftModeCell];
//            _touchBeginPoint = _touchCurrentPoint;
//        }
//    } else {
//        HHRollViewCell *leftCell = [self.showingCells objectAtIndex:1];
//        HHRollViewCell *rightCell = [self.showingCells objectAtIndex:3];
//        HHRollViewCell *centerCell = [self.showingCells objectAtIndex:2];
//        
//        centerCell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION;
//        leftCell.layer.zPosition = HH_ROLL_SECOND_DEGREE_CELL_Z_POSITION;
//        [centerCell showFront];
//        [leftCell fadeBack];
//        [rightCell fadeBack];
//    }
//    _touchBeforePoint = _touchCurrentPoint;
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (_isDragging) {
//        UITouch *touch = [touches anyObject];
//        _touchCurrentPoint = [touch locationInView:self];
//        CGFloat rate = ((float)(_touchCurrentPoint.x - _touchBeginPoint.x)) / (touch.timestamp - _beforeUpdateDate);
//        [self decelerateWithRate:[NSNumber numberWithDouble:rate]];
        [self layoutViewsAnimated:YES];
        _isDragging = NO;
    } else {
        UITouch *touch = [touches anyObject];
        for (int i = -2; i < 3; i ++) {
            if (_centerIndex + i < 0
                || _centerIndex + i >= _numberOfItems) {
                continue;
            }
            HHRollViewCell *cell = [self.showingCells objectAtIndex:(_centerIndex + i)];
            CGPoint point = [touch locationInView:cell];
            if (CGRectContainsPoint(cell.bounds, point)) {
                //notify delegate, center item click
                if (self.delegate_
                    && [self.delegate_ respondsToSelector:@selector(rollView:didSelectCellAtIndex:)]) {
                    [self.delegate_ rollView:self didSelectCellAtIndex:(_centerIndex + i)];
                }
//                break;
            }
        }
        
    }
    
    _touchBeginPoint = CGPointZero;
    _touchCurrentPoint = CGPointZero;
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    if (_isDragging) {
        [self layoutViewsAnimated:YES];
    }
    _touchBeginPoint = CGPointZero;
    _touchCurrentPoint = CGPointZero;
    [super touchesCancelled:touches withEvent:event];
#ifdef DEBUG
    NSLog(@"touches canceled .......................");
#endif
}

#define kHGYDeceleration 50000.0f

- (void)decelerateWithRate:(NSNumber *)rateN {
    CGFloat rate = [rateN doubleValue];
    CGFloat a = rate > 0 ? - kHGYDeceleration : kHGYDeceleration;
    if (ABS(rate) <= kHGYDeceleration * 0.05) {
        [self layoutViewsAnimated:YES];
        return;
    }
    CGFloat scrollDistance = rate * 0.05f + 0.5 * a * 0.05 * 0.05;
    if (scrollDistance > self.bounds.size.width / 4.0f) {
        scrollDistance = self.bounds.size.width / 4.0f;
    } else if (scrollDistance < - self.bounds.size.width / 4.0f) {
        scrollDistance = - self.bounds.size.width / 4.0f;
    }

    [self layoutViewsWithMovedDistance:scrollDistance];

    rate = rate + a * 0.05;
    [self performSelector:@selector(decelerateWithRate:)
               withObject:[NSNumber numberWithDouble:rate]
               afterDelay:0.05f];
}

//#pragma mark - load cell
//- (void)initLeftModelCell {
//    if (self.datasource_) {
//        NSInteger diffIndex = -3;
//        NSInteger modelIndex = 0;
//        modelIndex = _centerIndex - 3;
//        diffIndex = -3;
//        if (modelIndex < 0) {
//            return;
//        }
//        
//        HHRollViewCell *cell = [self.datasource_ rollView:self
//                                              cellAtIndex:modelIndex];
//        cell.center = [self cellCenterWithDiffIndex:diffIndex];
//        cell.transform = [self cellTransformWithDiffIndex:diffIndex];
//        cell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION + diffIndex;
//        [self addSubview:cell];
//        [self.showingCells insertObject:cell atIndex:0];
//    }
////    HHRollViewCell *cell = [
//    
//}
//
//- (void)removeLeftModeCell {
//    if ([self.showingCells count] > 0) {
//        HHRollViewCell *cell = [self.showingCells objectAtIndex:0];
//        if (cell.reuseIdentifier) {
//            if (!self.reusableCells) {
//                self.reusableCells = [[NSMutableDictionary alloc] init];
//            }
//            NSMutableSet *reuseCellSet = [self.reusableCells objectForKey:cell.reuseIdentifier];
//            if (!reuseCellSet) {
//                reuseCellSet = [[NSMutableSet alloc] init];
//                [self.reusableCells setObject:reuseCellSet forKey:cell.reuseIdentifier];
//            }
//            if ([reuseCellSet count] <= 3) {
////                cell.transform = CGAffineTransformIdentity;
//                [reuseCellSet addObject:cell];
//            }
//        }
//        [cell removeFromSuperview];
//        [self.showingCells removeObjectAtIndex:0];
//        
//        _centerIndex ++;
//        if (_centerIndex >= _numberOfItems) {
//            _centerIndex -= _numberOfItems;
//        }
//    }
//}
//
//- (void)initRightModelCell {
//    if (self.datasource_) {
//        NSInteger diffIndex = 3;
//        NSInteger modelIndex = 0;
//        modelIndex = _centerIndex + 3;
//        diffIndex = 3;
//        if (modelIndex >= _numberOfItems) {
//            return;
//        }
//        HHRollViewCell *cell = [self.datasource_ rollView:self
//                                              cellAtIndex:modelIndex];
//        cell.center = [self cellCenterWithDiffIndex:diffIndex];
//        cell.transform = [self cellTransformWithDiffIndex:diffIndex];
//        cell.layer.zPosition = HH_ROLL_CENTER_CELL_Z_POSITION - diffIndex;
//        [self addSubview:cell];
//        [self.showingCells addObject:cell];
//    }
//}
//
//- (void)removeRightModelCell {
//    if ([self.showingCells count] > 0) {
//        HHRollViewCell *cell = [self.showingCells lastObject];
//        if (cell.reuseIdentifier) {
//            if (!self.reusableCells) {
//                self.reusableCells = [[NSMutableDictionary alloc] init];
//            }
//            NSMutableSet *reuseCellSet = [self.reusableCells objectForKey:cell.reuseIdentifier];
//            if (!reuseCellSet) {
//                reuseCellSet = [[NSMutableSet alloc] init];
//                [self.reusableCells setObject:reuseCellSet forKey:cell.reuseIdentifier];
//            }
//            if ([reuseCellSet count] <= 3) {
//                [reuseCellSet addObject:cell];
//            }
//        }
//        [cell removeFromSuperview];
//        [self.showingCells removeLastObject];
//        
//        _centerIndex --;
//        if (_centerIndex < 0) {
//            _centerIndex += _numberOfItems;
//        }
//    }
//}

#pragma mark - calculate center
- (CGPoint)cellCenterWithDiffIndex:(NSInteger)diffIndex {
    CGPoint center;
    
    center.y = self.bounds.size.height / 2;
    center.x = (diffIndex + 2) * self.bounds.size.width / 4;
//    switch (diffIndex) {
//        case 0:
//            center.x = self.bounds.size.width / 2;
//            break;
//            
//        case -1:
//            center.x = self.bounds.size.width / 4;
//            break;
//            
//        case -2:
//            center.x = 0;
//            break;
//            
//        case 1:
//            center.x = self.bounds.size.width * 3 / 4 ;
//            break;
//            
//        case 2:
//            center.x = self.bounds.size.width;
//            break;
//            
//        default: {
//            if (diffIndex < 0) {
//                center.x = - self.bounds.size.width / 4;
//            } else {
//                center.x = self.bounds.size.width * 5 / 4;
//            }
//        }
//    }
    
    return center;
}

- (CGPoint)movedCellCenterWithDiffIndex:(NSInteger)diffIndex
                          movedDistance:(CGFloat)movedDistance {
    CGPoint center;
    
    CGPoint originCenter = [self cellCenterWithDiffIndex:diffIndex];
    
    center.y = self.bounds.size.height / 2;
    center.x = originCenter.x + movedDistance;
    
//    switch (diffIndex) {
//        case 0:
//            center.x = originCenter.x + movedDistance;
//            break;
//            
//        case -1:
//            center.x = originCenter.x + movedDistance;
//            break;
//            
//        case -2:
//            center.x = originCenter.x + movedDistance;
//            break;
//            
//        case 1:
//            center.x = originCenter.x + movedDistance;
//            break;
//            
//        case 2:
//            center.x = originCenter.x + movedDistance;
//            break;
//            
//        default: {
//            center.x = originCenter.x + movedDistance;
//        }
//    }
//    if (movedDistance <= 0) {
//        if (diffIndex <= 0) {
//            center.x = originCenter.x + movedDistance * pow(2, diffIndex);
//        } else {
//            center.x = originCenter.x + movedDistance * pow(2, 1 - diffIndex);
//        }
//    } else {
//        if (diffIndex < 0) {
//            center.x = originCenter.x + movedDistance * pow(2, diffIndex + 1);
//        } else {
//            center.x = originCenter.x + movedDistance * pow(2, -diffIndex);
//        }
//    }
    return center;
}

#pragma mark - scale transform
- (CGAffineTransform)cellTransformWithDiffIndex:(NSInteger)diffIndex {
//    CGAffineTransform transform = CGAffineTransformMakeScale(1.0 - fabsf(diffIndex) * HH_ROOL_DIFF_SCALE_FACTOR, 1.0 - fabs(diffIndex) * HH_ROOL_DIFF_SCALE_FACTOR);
//    return transform;
    if (diffIndex == 0) {
        return CGAffineTransformIdentity;
    } else {
        return CGAffineTransformMakeScale(1.0 - HH_ROOL_DIFF_SCALE_FACTOR, 1.0 - HH_ROOL_DIFF_SCALE_FACTOR);
    }
}

- (CGAffineTransform)movedCellTransformWithDiffIndex:(NSInteger)diffIndex
                                         movedFactor:(CGFloat)movedFactor {
    CGFloat scaleFactor = 1.0f;
    
//    if (diffIndex < 0) {
//        scaleFactor = 1.0 - fabsf(diffIndex) * HH_ROOL_DIFF_SCALE_FACTOR + movedFactor * HH_ROOL_DIFF_SCALE_FACTOR;
//    } else if (diffIndex > 0) {
//        scaleFactor = 1.0 - diffIndex * HH_ROOL_DIFF_SCALE_FACTOR - movedFactor * HH_ROOL_DIFF_SCALE_FACTOR;
//    }  else {
//        scaleFactor = 1.0 - diffIndex * HH_ROOL_DIFF_SCALE_FACTOR - fabsf(movedFactor) * HH_ROOL_DIFF_SCALE_FACTOR;
//    }
    if (diffIndex == 0) {
        scaleFactor = 1.0 - fabsf(movedFactor) * HH_ROOL_DIFF_SCALE_FACTOR;
    } else if (diffIndex == 1 && movedFactor < 0) {
        scaleFactor = 1.0 + fabsf(movedFactor) * HH_ROOL_DIFF_SCALE_FACTOR - HH_ROOL_DIFF_SCALE_FACTOR;
    } else if (diffIndex == -1 && movedFactor > 0) {
        scaleFactor = scaleFactor = 1.0 + fabsf(movedFactor) * HH_ROOL_DIFF_SCALE_FACTOR - HH_ROOL_DIFF_SCALE_FACTOR;
    } else {
        scaleFactor = 1.0 - HH_ROOL_DIFF_SCALE_FACTOR;
    }
    if (scaleFactor > 1.0f) {
        scaleFactor = 2.0f - scaleFactor;
    }
    
    return CGAffineTransformMakeScale(scaleFactor, scaleFactor);
}

@end
