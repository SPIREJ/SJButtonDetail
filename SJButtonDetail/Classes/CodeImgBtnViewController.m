//
//  CodeImgBtnViewController.m
//  SJButtonDetail
//
//  Created by SPIREJ on 16/1/13.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "CodeImgBtnViewController.h"

@interface CodeImgBtnViewController ()

@end

@implementation CodeImgBtnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"codeEdge";
    
    [self setUI];
}
- (void)setUI {
    //第一种
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 48, 70);
    btn.center = CGPointMake(self.view.frame.size.width/2, 200);
    btn.backgroundColor = [UIColor orangeColor];
    //1.给 btn 添加图片
    [btn setImage:[UIImage imageNamed:@"share_mesage"] forState:UIControlStateNormal];
    //2.设置image 在 btn 上的位置(上，左，下，右)
    btn.imageEdgeInsets = UIEdgeInsetsMake(-15, 0, 0, 0);
    //3.添加标题
    [btn setTitle:@"短信" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    //4.设置 title 在 btn 上的位置
    btn.titleEdgeInsets = UIEdgeInsetsMake(60, -48, 5, 0);
    btn.tag = 10001;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //第二种
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(0, 0, 48, 70);
    btn1.center = CGPointMake(self.view.frame.size.width/2, 300);
    btn1.backgroundColor = [UIColor orangeColor];
    //1.给 btn 添加图片
    [btn1 setImage:[UIImage imageNamed:@"share_mesage"] forState:UIControlStateNormal];
    //2.设置image 在 btn 上的位置(上，左，下，右)
    btn1.imageEdgeInsets = UIEdgeInsetsMake(20, 0, 0, 0);
    //3.添加标题
    [btn1 setTitle:@"短信" forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    //4.设置 title 在 btn 上的位置
    btn1.titleEdgeInsets = UIEdgeInsetsMake(-50, -48, 0, 0);
    btn1.tag = 10002;
    [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:btn];
    [self.view addSubview:btn1];
}

- (void)btnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
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
