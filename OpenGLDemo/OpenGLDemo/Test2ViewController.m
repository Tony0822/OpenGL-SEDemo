//
//  Test2ViewController.m
//  OpenGLDemo
//
//  Created by gaochongyang on 2018/6/19.
//  Copyright © 2018年 gaochongyang. All rights reserved.
//

#import "Test2ViewController.h"
#import "Quart2DView.h"

@interface Test2ViewController ()
@property (nonatomic, strong) Quart2DView *quartView;
@property (nonatomic, strong) UISlider *slider;

@end

@implementation Test2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    NSLog(@"%s", __func__);
    [self.view addSubview:self.quartView];
    [self.view addSubview:self.slider];
}

- (void)sliderClick:(UISlider *)sender {
    self.quartView.progress = sender.value;
}

- (Quart2DView *)quartView {
    if (!_quartView) {
        _quartView = [[Quart2DView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 100)];
        _quartView.backgroundColor = [UIColor lightGrayColor];
        _quartView.backgroundColor = [UIColor whiteColor];
    }
    return _quartView;
}

- (UISlider *)slider {
    if (!_slider) {
        _slider = [[UISlider alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 30, self.view.bounds.size.width, 30)];
        [_slider addTarget:self action:@selector(sliderClick:) forControlEvents:UIControlEventValueChanged];
    }
    return _slider;
}

+ (void)load {
    NSLog(@"%s", __func__);
}
- (void)loadView {
    [super loadView];
//    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    NSLog(@"%s", __func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%s", __func__);
}

- (void)viewWillLayoutSubviews {
    NSLog(@"%s", __func__);
}

- (void)viewDidLayoutSubviews {
    NSLog(@"%s", __func__);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%s", __func__);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%s", __func__);
}
- (void)dealloc {
    NSLog(@"%s", __func__);
}


@end
