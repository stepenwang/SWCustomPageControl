//
//  SBCustomPageControl.m
//  animate
//
//  Created by 王志龙 on 15/12/24.
//  Copyright © 2015年 王志龙. All rights reserved.
//

#import "SWCustomPageControl.h"
#define kDefaultItemSize 20

@implementation SWCustomPageControl

- (void)commonInit {
    if (self.subviews.count > 0) {
        for (UIView *view in self.subviews) {
            [view removeFromSuperview];
        }
    }
    for (int i = 0; i < self.numberOfDots; i++) {
        UIImageView *dot = [[UIImageView alloc] init];
        [dot setTag:100 + i];
        [dot setFrame:CGRectMake(i * 20 + 10, 0, 10, 10)];
        [self addSubview:dot];
    }
}

- (CGSize)sizeForDots {
    return CGSizeMake(self.numberOfDots * 20, 30);
}

- (void)setNumberOfPages:(NSUInteger)numberOfPages {
    if (numberOfPages > 1) {
        self.hidden = NO;
        _numberOfPages = numberOfPages;
        _numberOfDots = numberOfPages > 9 ? 9 : numberOfPages;
        [self commonInit];
    }else {
        self.hidden = YES;
    }
}

- (void)setCurrentPage:(NSUInteger)currentPage {
    currentPage++;
    if (currentPage <= self.numberOfPages) {
        _currentPage = currentPage;
        [self updateDots];
    }
}

- (void)updateDots {
    for(int i = 0; i < self.numberOfDots; i++) {
        UIImageView *dot = [self viewWithTag:100 + i];
        [self setDot:dot number:i];
        [dot setHidden:NO];
    }
    if (self.numberOfPages > 9) {
        UIImageView *dot = [self viewWithTag:104];
        [dot setTransform:CGAffineTransformMakeScale(2, 2)];
        [dot setImage:[self imageFromText:[NSString stringWithFormat:@"%lu",(unsigned long)self.currentPage]]];
        dot.clipsToBounds = NO;
        [dot setBackgroundColor:[UIColor clearColor]];
        [dot.layer setCornerRadius:0];
        
        if (self.currentPage > 1) {
            UIImageView *predot = [self viewWithTag:103];
            predot.hidden = NO;
            [predot setTransform:CGAffineTransformMakeScale(1.6, 1.6)];
            [predot setImage:[self imageFromText:[NSString stringWithFormat:@"%lu",(unsigned long)self.currentPage - 1]]];
            predot.clipsToBounds = NO;
            [predot setBackgroundColor:[UIColor clearColor]];
            [predot.layer setCornerRadius:0];
        }
        
        if (self.currentPage < self.numberOfPages) {
            UIImageView *afterdot = [self viewWithTag:105];
            afterdot.hidden = NO;
            [afterdot setTransform:CGAffineTransformMakeScale(1.6, 1.6)];
            [afterdot setImage:[self imageFromText:[NSString stringWithFormat:@"%lu",(unsigned long)self.currentPage + 1]]];
            afterdot.clipsToBounds = NO;
            [afterdot setBackgroundColor:[UIColor clearColor]];
            [afterdot.layer setCornerRadius:0];
        }
        
        if (self.currentPage < 5) {
            for (int i = 0; i < 5 - self.currentPage; i++) {
                UIView *dotView = [self viewWithTag:100 + i];
                [dotView setHidden:YES];
            }
        }
        
        if (self.numberOfPages - self.currentPage < 5) {
            for (int i = 8 ; i > (4 + (self.numberOfPages - self.currentPage)); i--) {
                UIView *dotView = [self viewWithTag:100 + i];
                [dotView setHidden:YES];
            }
        }
    }
    
}

- (UIImage *)imageFromText:(NSString *)content{
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(kDefaultItemSize, kDefaultItemSize),NO,0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetCharacterSpacing(ctx, 10);
    CGContextSetTextDrawingMode (ctx, kCGTextFillStroke);
    NSMutableParagraphStyle *para = [[NSMutableParagraphStyle alloc] init];
    [para setAlignment:NSTextAlignmentCenter];
    
    [content drawInRect:CGRectMake(0, 0, kDefaultItemSize, kDefaultItemSize) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16], NSForegroundColorAttributeName:[UIColor whiteColor], NSParagraphStyleAttributeName: para}];
    // transfer image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)setDot:(UIView *)view number:(NSInteger) number{
    if (self.numberOfPages < 9 && number == self.currentPage - 1) {
        [view setBackgroundColor:[UIColor whiteColor]];
    }
    else {
        [view setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.2]];
    }
    [view.layer setCornerRadius:CGRectGetHeight(view.frame)/2];
    view.clipsToBounds = YES;
}

@end
