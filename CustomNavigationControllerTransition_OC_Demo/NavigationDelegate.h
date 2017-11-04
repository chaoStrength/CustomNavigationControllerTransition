//
//  NavigationDelegate.h
//  CustomNavigationControllerTransition_OC_Demo
//
//  Created by chao on 2017/11/3.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NavigationDelegate : NSObject <UINavigationControllerDelegate>

@property (nonatomic, assign) BOOL interactive;// 是否交互，用于作标识
@property (nonatomic, strong ) UIPercentDrivenInteractiveTransition *interactionController;// 交互控制器

@end

NS_ASSUME_NONNULL_END
