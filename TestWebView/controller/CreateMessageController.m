//
//  CreateMessageController.m
//  TestWebView
//
//  Created by xiaofeishen on 2020/4/12.
//  Copyright © 2020 xiaofeishen. All rights reserved.
//

#import "CreateMessageController.h"
#import "MessageAPI.h"
#import <Masonry/Masonry.h>

@interface CreateMessageController ()
@property (nonatomic, strong) UITextField *contentTf;
@property (nonatomic, strong) UIButton *submitButton;
@end

@implementation CreateMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.contentTf = [[UITextField alloc] init];
    self.contentTf.borderStyle = UITextBorderStyleRoundedRect;
    self.contentTf.placeholder = @"input here";
    self.submitButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    [self.contentTf.topAnchor constraintEqualToAnchor:self.view.lef]
    [self.submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    [self.submitButton addTarget:self action:@selector(submitButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.contentTf];
    [self.view addSubview:self.submitButton];
    
    [self.contentTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(44);
    }];
    [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 44));
        make.top.mas_equalTo(self.contentTf.mas_top);
        make.left.mas_equalTo(self.contentTf.mas_right).offset(10);
        make.right.mas_equalTo(0);
    }];
}

- (void)submitButtonPress:(id)sender {
    if (self.contentTf.text.length == 0) {
        return;
    }
    [MessageAPI postMessageWithDict:@{@"id":@"sxfdmmsqy",@"content":self.contentTf.text} completion:^(BOOL success) {
        if (success) {
            NSLog(@"success");
        } else {
            NSLog(@"failed");
        }
    }];
}

@end
