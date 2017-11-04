//
//  SlideAnimationController.h
//  CustomNavigationControllerTransition_OC_Demo
//
//  Created by chao on 2017/11/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SlideAnimationController : NSObject <UIViewControllerAnimatedTransitioning>

/**
 * 初始化
 * @param operation 类型，push或pop
 */
- (instancetype)initWithType:(UINavigationControllerOperation)operation;

@end

NS_ASSUME_NONNULL_END
