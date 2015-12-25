//
//  SBCustomPageControl.h
//  animate
//
//  Created by 王志龙 on 15/12/24.
//  Copyright © 2015年 王志龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWCustomPageControl : UIView

@property (nonatomic, assign) NSUInteger currentPage;
@property (nonatomic, assign) NSUInteger numberOfPages;
@property (nonatomic, assign) NSUInteger numberOfDots;

- (CGSize)sizeForDots;
@end
