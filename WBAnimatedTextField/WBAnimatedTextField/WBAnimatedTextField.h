//
//  AnimationTextField.h
//  登陆界面的动画
//
//  Created by zhangjiang on 15/6/12.
//  Copyright (c) 2015年 张江. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WBAnimatedTextField : UIView


@property (nonatomic, strong) UITextField *customTextField;

/** 占位字符 */
@property (nonatomic, copy) NSString *placeholderText;

/** 屏蔽占位字符上移动画 */
@property (nonatomic, assign) BOOL hideAnimated;


@end
