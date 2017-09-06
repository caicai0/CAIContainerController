//
//  CAIContainerView.h
//  CAIContainerControllerOC
//
//  Created by 李玉峰 on 2017/9/6.
//  Copyright © 2017年 李玉峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAIContainerView : UIView

@property (weak, nonatomic)IBInspectable UIViewController * controller;
@property (strong , nonatomic)NSArray <UIViewController*>* viewControllers;
@property (assign , nonatomic)NSInteger currentIndex;

@end
