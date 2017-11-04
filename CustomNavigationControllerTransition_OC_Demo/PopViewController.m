//
//  PopViewController.m
//  CustomNavigationControllerTransition_OC_Demo
//
//  Created by chao on 2017/11/3.
//

#import "PopViewController.h"
#import "NavigationDelegate.h"

@interface PopViewController ()

@property (nonatomic, strong) UIButton *popButton; // pop按钮
@property (nonatomic, strong) NavigationDelegate *navigationDelegate;// 导航控制器代理对象

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"StackTop";
    self.view.backgroundColor = [UIColor colorWithRed:149.0 / 255.0
                                                green:217 / 255.0
                                                 blue:124 / 255.0
                                                alpha:1.0];
    
    // 创建pop按钮
    self.popButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.popButton setTitle:@"Pop Me" forState:UIControlStateNormal];
    self.popButton.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [self.popButton addTarget:self action:@selector(popButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.popButton];
    self.popButton.translatesAutoresizingMaskIntoConstraints = false;
    
    // 水平对齐
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.popButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    // 竖直对齐
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.popButton
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    // 添加从屏幕左侧滑动的手势
    UIScreenEdgePanGestureRecognizer *gesture = [[UIScreenEdgePanGestureRecognizer alloc] init];
    gesture.edges = UIRectEdgeLeft;
    [gesture addTarget:self action:@selector(handleEdgePanGesture:)];
    [self.view addGestureRecognizer:gesture];
}

#pragma mark - Action
/**
 * pop按钮被点击
 * @param sender pop按钮
 */
- (void)popButtonDidClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

/**
 * 处理屏幕边缘手势滑动
 * @param gesture 滑动手势
 */
- (void)handleEdgePanGesture:(UIPanGestureRecognizer *)gesture {
    // 获取滑动的水平偏移量
    CGFloat translationX = fabs([gesture translationInView:gesture.view].x);
    // 计算完成的百分比
    CGFloat percent = translationX / self.view.bounds.size.width;
    switch (gesture.state) {
        // 识别到左边缘侧滑的手势
        case UIGestureRecognizerStateBegan: {
            if ([self.navigationController.delegate isMemberOfClass:NavigationDelegate.class]) {
                self.navigationDelegate = self.navigationController.delegate;
                self.navigationDelegate.interactive = true;
                [self.navigationController popViewControllerAnimated:true];
            }
            break;
        }
        // 左边缘侧滑手势继续滑动
        case UIGestureRecognizerStateChanged: {
            if (self.navigationDelegate) {
                // 更新转场的进度值
                [self.navigationDelegate.interactionController updateInteractiveTransition:percent];
            }
            break;
        }
        // 左边缘侧滑手势取消或结束时
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded: {
            if (self.navigationDelegate) {
                // 如果转场进度超过了一半，那么就完成转场
                if (percent > 0.5) {
                    [self.navigationDelegate.interactionController finishInteractiveTransition];
                } else {
                // 否则，取消转场
                    [self.navigationDelegate.interactionController cancelInteractiveTransition];
                }
                self.navigationDelegate.interactive = false;
            }
            break;
        }
        default:
            break;
    }
}

@end
