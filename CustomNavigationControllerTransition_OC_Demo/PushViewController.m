//
//  PushViewController.m
//  CustomNavigationControllerTransition_OC_Demo
//
//  Created by chao on 2017/11/3.
//

#import "PushViewController.h"
#import "PopViewController.h"

@interface PushViewController ()

@property (nonatomic, strong) UIButton *pushButton;// push按钮

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"RootVC";
    self.view.backgroundColor = [UIColor colorWithRed:255 / 255.0
                                                green:83 / 255.0
                                                 blue:89 / 255.0
                                                alpha:1.0];
    
    // 创建push按钮
    self.pushButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.pushButton setTitle:@"Push" forState:UIControlStateNormal];
    self.pushButton.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [self.pushButton addTarget:self action:@selector(pushButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pushButton];
    self.pushButton.translatesAutoresizingMaskIntoConstraints = false;
    
    // 水平对齐
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.pushButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    // 竖直对齐
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.pushButton
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
}

#pragma mark - Action
/**
 * push按钮被点击
 * @param sender push按钮
 */
- (void)pushButtonDidClicked:(id)sender {
    PopViewController *popVC = [[PopViewController alloc] init];
    [self.navigationController pushViewController:popVC animated:true];
}

@end
