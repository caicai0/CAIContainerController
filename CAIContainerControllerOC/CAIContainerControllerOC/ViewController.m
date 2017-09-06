//
//  ViewController.m
//  CAIContainerControllerOC
//
//  Created by 李玉峰 on 2017/9/6.
//  Copyright © 2017年 李玉峰. All rights reserved.
//

#import "ViewController.h"
#import "CAIContainerView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CAIContainerView *container;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.container.controller = self;
    
    
    UIViewController * c1 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"c1"];
    UIViewController * c2 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"c2"];
    self.container.viewControllers = @[c1,c2];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.container.currentIndex = 1;
    });
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
