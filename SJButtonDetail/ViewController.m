//
//  ViewController.m
//  SJButtonDetail
//
//  Created by SPIREJ on 16/1/13.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "ViewController.h"
#import "BtnTypeViewController.h"
#import "BtnShuXingViewController.h"
#import "imgAanBtnViewController.h"
#import "CodeImgBtnViewController.h"
#import "BtnSortViewController.h"

#define kLabelText   @[@"1、可创建的button类型",@"2、button属性及方法", @"3、xib实现图片，标题一体", @"4、纯代码实现图片，标题一体",@"5、类似平均排序可选且返回选中数据"]
#define kDetailLabelText   @[@"BtnTypeViewController",@"BtnShuXingViewController", @"imgAanBtnViewController", @"CodeImgBtnViewController", @"BtnSortViewController"]

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSMutableArray *dataArr;
@property (nonatomic, copy) NSMutableArray *detailLabelArr;

@end

@implementation ViewController

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithArray:kLabelText];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArr = [NSMutableArray arrayWithArray:kLabelText];
    _detailLabelArr = [NSMutableArray arrayWithArray:kDetailLabelText];
    
    UIView *nullView = [[UIView alloc] init];
    _tableView.tableFooterView = nullView;
}


#pragma maek - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ident = @"identCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ident];
    }
    cell.textLabel.text = _dataArr[indexPath.row];
    cell.detailTextLabel.text = _detailLabelArr[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            BtnTypeViewController *btnTypeVC = [[BtnTypeViewController alloc] init];
            [self.navigationController pushViewController:btnTypeVC animated:YES];
        }
            break;
        case 1:
        {
            BtnShuXingViewController *btnSxVC = [[BtnShuXingViewController alloc] init];
            [self.navigationController pushViewController:btnSxVC animated:YES];
        }
            break;

        case 2:
        {
            imgAanBtnViewController *imgBtnVC = [[imgAanBtnViewController alloc] init];
            [self.navigationController pushViewController:imgBtnVC animated:YES];
        }
            break;
        case 3:
        {
            CodeImgBtnViewController *codeImgBtnVC = [[CodeImgBtnViewController alloc] init];
            [self.navigationController pushViewController:codeImgBtnVC animated:YES];
        }
            break;
        case 4:
        {
            BtnSortViewController *btnSortVC = [[BtnSortViewController alloc] init];
            btnSortVC.selectedBtnItemBlock = ^(NSString *btnItemTitles){
                NSString *str = btnItemTitles;
                NSLog(@"%@",str);
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tip" message:btnItemTitles delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alert show];
            };
            [self.navigationController pushViewController:btnSortVC animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
