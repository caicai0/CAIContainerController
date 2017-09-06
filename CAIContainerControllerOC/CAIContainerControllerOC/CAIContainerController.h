//
//  CAIContainerController.h
//  CAIContainerControllerOC
//
//  Created by 李玉峰 on 2017/9/6.
//  Copyright © 2017年 李玉峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAIContainerController : UIViewController

@property (strong , nonatomic)NSArray <UIViewController*>* viewControllers;
@property (assign , nonatomic)NSInteger currentIndex;

- (CGRect)frameForContentController;//重写方法

@end
