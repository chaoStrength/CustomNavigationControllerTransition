//
//  AppDelegate.m
//  CustomNavigationControllerTransition_OC_Demo
//
//  Created by chao on 2017/11/3.
//

#import "AppDelegate.h"
#import "PushViewController.h"
#import "NavigationDelegate.h"

@interface AppDelegate ()

@property (nonatomic, strong) NavigationDelegate *naviDelegate;// 导航控制器代理，主要为了保持强持有

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    
    // 创建导航控制器代理对象
    self.naviDelegate = [[NavigationDelegate alloc] init];
    
    PushViewController *pushVC = [[PushViewController alloc] init];
    UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController:pushVC];
    // 设置导航控制器的代理为我们自定义的代理
    naviVC.delegate = self.naviDelegate;
    
    self.window.rootViewController = naviVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
