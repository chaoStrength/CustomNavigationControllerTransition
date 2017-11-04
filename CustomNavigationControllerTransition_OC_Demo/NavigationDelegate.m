//
//  NavigationDelegate.m
//  CustomNavigationControllerTransition_OC_Demo
//
//  Created by chao on 2017/11/3.
//

#import "NavigationDelegate.h"
#import "SlideAnimationController.h"

@interface NavigationDelegate ()

@end

@implementation NavigationDelegate

- (instancetype)init {
    if (self = [super init]) {
        _interactive = false;
        _interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
    }
    return self;
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return [[SlideAnimationController alloc] initWithType:operation];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.interactive? self.interactionController : nil;
}

@end
