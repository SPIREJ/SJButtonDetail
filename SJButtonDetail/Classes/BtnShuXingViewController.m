//
//  BtnShuXingViewController.m
//  SJButtonDetail
//
//  Created by SPIREJ on 16/1/13.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "BtnShuXingViewController.h"

@interface BtnShuXingViewController ()

@end

@implementation BtnShuXingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    //btn 类型
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //btn frame
    btn.frame = CGRectMake(0, 0, 100, 50);
    btn.center = self.view.center;
    //背景色
    btn.backgroundColor = [UIColor cyanColor];
    //设置button 的填充图片
    [btn setImage:[UIImage imageNamed:@"share_qq"] forState:UIControlStateNormal];
    //选中状态下的图片
    [btn setImage:[UIImage imageNamed:@"share_pengyouquan"] forState:UIControlStateSelected];
    //背静图片
    [btn setBackgroundImage:[UIImage imageNamed:@"share_weixin"] forState:UIControlStateNormal];
    //设置tag值
    btn.tag = 12345;
    //添加事件
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    //加载到view上
    [self.view addSubview:btn];
}
- (void)btnClick:(UIButton *)btn{
    if (btn.tag == 12345) {
        btn.selected = !btn.selected;
    }
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
