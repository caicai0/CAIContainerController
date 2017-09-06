//
//  CAIContainerController.m
//  CAIContainerControllerOC
//
//  Created by 李玉峰 on 2017/9/6.
//  Copyright © 2017年 李玉峰. All rights reserved.
//

#import "CAIContainerController.h"

@interface CAIContainerController ()

@property (nonatomic, strong)UIViewController * currentViewController;

@end

@implementation CAIContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.viewControllers && self.viewControllers.count) {
        self.currentViewController = self.viewControllers.firstObject;
    }
}

- (void)viewWillLayoutSubviews {
    if (self.viewControllers && self.currentIndex>=0 && self.currentIndex<self.viewControllers.count) {
        UIViewController * controller = self.viewControllers[self.currentIndex];
        controller.view.frame = self.frameForContentController;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
            self.title = nil;
            [_currentViewController removeFromParentViewController];
        }
        _currentViewController = currentViewController;
        if (_currentViewController) {
            [self addChildViewController:_currentViewController];
            _currentViewController.view.frame = [self frameForContentController];
            [self.view addSubview:_currentViewController.view];
            self.title = _currentViewController.title;
            [_currentViewController didMoveToParentViewController:self];
        }
    }
}

#pragma mark - private

- (CGRect)frameForContentController {
    return CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - [self.bottomLayoutGuide length]);
}

@end
