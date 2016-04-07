//
//  AnimationTextField.m
//  登陆界面的动画
//
//  Created by zhangjiang on 15/6/12.
//  Copyright (c) 2015年 张江. All rights reserved.
//

#import "WBAnimatedTextField.h"


@interface WBAnimatedTextField ()
<UITextFieldDelegate>

{
    UILabel     *_placeholderLabel;
    
    CGFloat     _viewWidth;
    CGFloat     _viewHeight;

    BOOL        _isNeedMove;
}

@end

@implementation WBAnimatedTextField

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
        [self setupSubviewWithFrame:frame];
    }
    return self;
}

- (void)setupSubviewWithFrame:(CGRect)frame {

    self.userInteractionEnabled = YES;

    _viewWidth = frame.size.width;
    _viewHeight = frame.size.height;
    _isNeedMove = YES;
    
    // 输入框
    _customTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, _viewWidth, _viewHeight)];
    _customTextField.textAlignment = NSTextAlignmentLeft;
    _customTextField.font = [UIFont systemFontOfSize:16.f];
    _customTextField.backgroundColor = [UIColor whiteColor];
    _customTextField.tintColor = [UIColor blackColor];
    _customTextField.layer.cornerRadius = 8;
    _customTextField.layer.borderColor =  [UIColor redColor].CGColor;
    _customTextField.layer.borderWidth = 1;
    [_customTextField addTarget:self action:@selector(textFieldValueChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_customTextField];

    // 输入框左视图
    _customTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    _customTextField.leftViewMode = UITextFieldViewModeAlways;

    // 输入框右视图 clear
    UIView *clearBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    clearButton.frame = CGRectMake(0, 0, 20, 20);
    clearButton.layer.cornerRadius = 10;
    clearButton.backgroundColor = [UIColor lightGrayColor];
    [clearButton setImage:[UIImage imageNamed:@"dismiss"] forState:UIControlStateNormal];
    [clearButton setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [clearButton addTarget:self action:@selector(clearButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [clearBgView addSubview:clearButton];
    _customTextField.rightView = clearBgView;
    _customTextField.rightViewMode = UITextFieldViewModeWhileEditing;

    // 占位label
    _placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, _viewWidth, _viewHeight)];
    _placeholderLabel.textColor = [UIColor lightGrayColor];
    _placeholderLabel.textAlignment = NSTextAlignmentLeft;
    _placeholderLabel.font = [UIFont systemFontOfSize:15.f];
    [self addSubview:_placeholderLabel];
}

- (void)textFieldValueChange:(UITextField *)textField {

    if (self.hideAnimated) {
        _placeholderLabel.hidden = textField.text.length ? YES :NO;
    
    } else {

        if (_isNeedMove) {
            _isNeedMove = NO;
            [UIView animateWithDuration:0.5f animations:^{
                _placeholderLabel.frame = CGRectMake(0, -_viewHeight/2, _viewWidth, _viewHeight/2);
                _placeholderLabel.font = [UIFont systemFontOfSize:9.f];
            }];
            
        } else if (!_customTextField.text.length) {
            _isNeedMove = YES;
            [UIView animateWithDuration:0.5f animations:^{
                _placeholderLabel.frame = CGRectMake(15, 0, _viewWidth, _viewHeight);
                _placeholderLabel.font = [UIFont systemFontOfSize:15.f];
            }];
        }
    }
}

// 清空内容
- (void)clearButtonClick {
    _customTextField.text = @"";
    [self textFieldValueChange:_customTextField];
}

#pragma mark -  set

// 获得占位字符
- (void)setPlaceholderText:(NSString *)placeholderText {
    _placeholderText = placeholderText;
    _placeholderLabel.text = _placeholderText;
}

@end
