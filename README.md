# WBAnimatedTextField
自定义textField视图, 输入时可以设置占位文字是否移动到上方, 自定义leftView, rightView
    WBAnimatedTextField *loginTextField = [[WBAnimatedTextField alloc] initWithFrame:CGRectMake(textFieldX,
                                                                            100,
                                                                            self.view.frame.size.width - 2*textFieldX,
                                                                            textFieldH)];
    loginTextField.placeholderText = @"请输入手机号";
    loginTextField.customTextField.keyboardType = UIKeyboardTypeNumberPad;
    loginTextField.customTextField.delegate = self;
    [self.view addSubview:loginTextField];
  
