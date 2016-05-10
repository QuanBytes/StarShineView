//
//  ViewController.m
//  StartShineView
//
//  Created by LiQuan on 16/5/10.
//  Copyright © 2016年 LiQuan. All rights reserved.
//

#import "ViewController.h"
#import "LQStartShineView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LQStartShineView * view = [[LQStartShineView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
