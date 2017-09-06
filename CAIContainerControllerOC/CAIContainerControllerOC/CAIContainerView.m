//
//  CAIContainerView.m
//  CAIContainerControllerOC
//
//  Created by 李玉峰 on 2017/9/6.
//  Copyright © 2017年 李玉峰. All rights reserved.
//

#import "CAIContainerView.h"

@interface CAIContainerView()

@property (nonatomic, strong)UIViewController * currentViewController;

@end

@implementation CAIContainerView

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)didMoveToWindow{
    if (self.viewControllers && self.viewControllers.count) {
        self.currentViewController = self.viewControllers.firstObject;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (self.viewControllers && self.currentIndex>=0 && self.currentIndex<self.viewControllers.count) {
        UIViewController * controller = self.viewControllers[self.currentIndex];
        controller.view.frame = self.frameForContentController;
    }
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers{
    if (_viewControllers != viewControllers) {
        _viewControllers = viewControllers;
        self.currentIndex = 0;
    }
}

- (void)setCurrentIndex:(NSInteger)currentIndex{
    if (currentIndex>=0) {
        _currentIndex = currentIndex;
        if (self.viewControllers && self.currentIndex>=0 && self.currentIndex<self.viewControllers.count) {
            UIViewController * controller = self.viewControllers[self.currentIndex];
            self.currentViewController = controller;
        }
    }
}

- (void)setCurrentViewController:(UIViewController *)currentViewController{
    if (_currentViewController != currentViewController) {
        if (_currentViewController) {
            [_currentViewController willMoveToParentViewController:nil];
            [_currentViewController.view removeFromSuperview];
            [_currentViewController removeFromParentViewController];
        }
        _currentViewController = currentViewController;
        if (_currentViewController) {
            [self.controller addChildViewController:_currentViewController];
            _currentViewController.view.frame = [self frameForContentController];
            [self addSubview:_currentViewController.view];
            [_currentViewController didMoveToParentViewController:self.controller];
        }
    }
}

#pragma mark - private

- (CGRect)frameForContentController {
    return CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
}

@end
