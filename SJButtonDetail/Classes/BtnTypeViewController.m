//
//  BtnTypeViewController.m
//  SJButtonDetail
//
//  Created by SPIREJ on 16/1/13.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "BtnTypeViewController.h"

@interface BtnTypeViewController ()

@end

@implementation BtnTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"buttonTypes";
    
    [self setBtnType:UIButtonTypeCustom frameWithHeight:100];
    [self setBtnType:UIButtonTypeContactAdd frameWithHeight:150];
    [self setBtnType:UIButtonTypeInfoLight frameWithHeight:200];
    
    //画圆角 btn
    [self roundRectBtn];
}

- (UIButton *)setBtnType:(UIButtonType)type frameWithHeight:(CGFloat)height{
    UIButton *btn = [UIButton buttonWithType:type];
    btn.frame = CGRectMake(100, height, 100, 30);
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    
    return btn;
}

- (UIButton *)roundRectBtn{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 250, 100, 30);
    btn.backgroundColor = [UIColor orangeColor];
    btn.layer.cornerRadius = 10;
    btn.layer.masksToBounds = YES;
    return btn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
