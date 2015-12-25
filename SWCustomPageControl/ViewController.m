//
//  ViewController.m
//  SWCustomPageControl
//
//  Created by 王志龙 on 15/12/25.
//  Copyright © 2015年 王志龙. All rights reserved.
//

#import "ViewController.h"
#import "SWCustomPageControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    
    SWCustomPageControl *pageControl = [[SWCustomPageControl alloc] init];
    [pageControl setNumberOfPages:20];
    [pageControl setCurrentPage:12];
    CGSize sizeOfpageControl = [pageControl sizeForDots];
    [pageControl setFrame:CGRectMake(10, 200, sizeOfpageControl.width, sizeOfpageControl.height)];
    
    [self.view addSubview:pageControl];
    
    SWCustomPageControl *normalPageControl = [[SWCustomPageControl alloc] init];
    [normalPageControl setNumberOfPages:8];
    [normalPageControl setCurrentPage:2];
    CGSize sizeOfnormalPageControl = [normalPageControl sizeForDots];
    [normalPageControl setFrame:CGRectMake(10, 300, sizeOfnormalPageControl.width, sizeOfnormalPageControl.height)];
    
    [self.view addSubview:normalPageControl];
}

@end
