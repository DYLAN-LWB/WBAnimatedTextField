//
//  ViewController.m
//  WBAnimatedTextField
//
//  Created by 李伟宾 on 16/4/7.
//  Copyright © 2016年 dylan_lwb. All rights reserved.
//

#import "ViewController.h"
#import "WBAnimatedTextField.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat textFieldX = 20;
    CGFloat textFieldH = 40;
    
    // 登录
    WBAnimatedTextField *loginTextField = [[WBAnimatedTextField alloc] initWithFrame:CGRectMake(textFieldX,
                                                                            100,
                                                                            self.view.frame.size.width - 2*textFieldX,
                                                                            textFieldH)];
    loginTextField.placeholderText = @"请输入手机号";
    loginTextField.customTextField.keyboardType = UIKeyboardTypeNumberPad;
    loginTextField.customTextField.delegate = self;
    [self.view addSubview:loginTextField];
    
    // 注册
    WBAnimatedTextField *pwdTextField = [[WBAnimatedTextField alloc] initWithFrame:CGRectMake(textFieldX,
                                                                          CGRectGetMaxY(loginTextField.frame) + textFieldH,
                                                                          self.view.frame.size.width - 2*textFieldX,
                                                                          textFieldH)];
    pwdTextField.placeholderText = @"请输入密码";
    pwdTextField.customTextField.keyboardType = UIKeyboardTypeAlphabet;
    pwdTextField.customTextField.secureTextEntry = YES;
    [self.view addSubview:pwdTextField];

    WBAnimatedTextField *otherTextField = [[WBAnimatedTextField alloc] initWithFrame:CGRectMake(textFieldX,
                                                                                              CGRectGetMaxY(pwdTextField.frame) + textFieldH,
                                                                                              self.view.frame.size.width - 2*textFieldX,
                                                                                              textFieldH)];
    otherTextField.placeholderText = @"屏蔽上移动画";
    otherTextField.customTextField.keyboardType = UIKeyboardTypeAlphabet;
    otherTextField.hideAnimated = YES;
    [self.view addSubview:otherTextField];
}

// 当长度大于11位时禁止输入
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return textField.text.length - range.length + string.length > 11 ? NO : YES;
}

@end
