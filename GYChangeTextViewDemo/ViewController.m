//
//  ViewController.m
//  GYChangeTextViewDemo
//
//  Created by mac on 16/6/14.
//  Copyright © 2016年 GY. All rights reserved.
//

#import "ViewController.h"
#import "GYChangeTextView.h"
#import <objc/runtime.h>

@interface ViewController () <GYChangeTextViewDelegate>

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) GYChangeTextView *tView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(100, 200, 50, 20)];
    [button setTitle:@"stop" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button setBackgroundColor:[UIColor blackColor]];
    [button addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    self.button = button;
    
    GYChangeTextView *tView = [[GYChangeTextView alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 40)];
    tView.delegate = self;
    tView.layer.borderWidth = 1.0;  /*为了看的清楚加个边*/
    tView.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:tView];
    self.tView = tView;
    [self.tView animationWithTexts:[NSArray arrayWithObjects:@"这是第1条这是第1条这是第1条这是第1条这是第1条这是第1条这是第1条这是第1条这是第1条这是第1条这是第1条这是第1条这是第1条这是第1条",@"这是第2条",@"这是第3条", nil]];
    
    //首先定义一个全局变量，用它的地址作为关联对象的key
    static char associatedObjectKey;
    //设置关联对象
    objc_setAssociatedObject(self, &associatedObjectKey, @"添加的字符串属性", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    //获取关联对象
    NSString *string = objc_getAssociatedObject(self, &associatedObjectKey);
    NSLog(@"AssociatedObject = %@", string);
    
    objc_setAssociatedObject(self, &associatedObjectKey,@(2), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    //获取关联对象
    NSString *string2 = objc_getAssociatedObject(self, &associatedObjectKey);
    NSLog(@"AssociatedObject = %@", string2);
}




- (void)stop {
    [_tView stopAnimation];
}

- (void)gyChangeTextView:(GYChangeTextView *)textView didTapedAtIndex:(NSInteger)index {
    NSLog(@"%ld",index);
}

@end
