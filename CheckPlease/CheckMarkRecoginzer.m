//
//  CheckMarkRecoginzer.m
//  CheckPlease
//
//  Created by wanghuiyong on 31/01/2017.
//  Copyright © 2017 Personal Organization. All rights reserved.
//

#import "CheckMarkRecoginzer.h"
#import "CGPointUtils.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

static CGFloat const kMinimumCheckMarkAngle = 50;
static CGFloat const kMaximumCheckMarkAngle = 135;
static CGFloat const kMinimumCheckMarkLength = 10;

@implementation CheckMarkRecoginzer {
    CGPoint lastPreviousPoint;
    CGPoint lastCurrentPoint;
    CGFloat lineLengthSoFar;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];	// 手势识别器的视图?
    lastPreviousPoint = point;
    lastCurrentPoint = point;
    lineLengthSoFar = 0;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    CGPoint previousPoint = [touch previousLocationInView:self.view];
    CGPoint currentPoint = [touch locationInView:self.view];
    CGFloat angle = angleBetweenLines(lastPreviousPoint, lastCurrentPoint, previousPoint, currentPoint);
    
    if (angle >= kMinimumCheckMarkAngle && angle <= kMaximumCheckMarkAngle && lineLengthSoFar > kMinimumCheckMarkLength) {
        self.state = UIGestureRecognizerStateRecognized;
    }
    
    lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
    lastPreviousPoint = previousPoint;
    lastCurrentPoint = currentPoint;
}

@end
