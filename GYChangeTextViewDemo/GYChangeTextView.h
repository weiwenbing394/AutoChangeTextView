//
//  GYChangeTextView.h
//  GYChangeTextViewDemo
//
//  Created by 大家保 on 2017/2/14.
//  Copyright © 2017年 GY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GYChangeTextView;

@protocol GYChangeTextViewDelegate <NSObject>

- (void)gyChangeTextView:(GYChangeTextView *)textView didTapedAtIndex:(NSInteger)index;

@end


@interface GYChangeTextView : UIView

@property (nonatomic, assign) id<GYChangeTextViewDelegate> delegate;

- (void)animationWithTexts:(NSArray *)textAry;

- (void)stopAnimation;

@end
