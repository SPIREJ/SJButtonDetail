//
//  BtnSortViewController.m
//  SJButtonDetail
//
//  Created by SPIREJ on 16/1/14.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "BtnSortViewController.h"
#import "UIView+LBExtension.h"

#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight  [UIScreen mainScreen].bounds.size.height

//btn 高度
#define kBtnHeight  35
//btn 之间的距离
#define kPadding  25
//btn 距离屏幕左边的位置
#define kLeftSpace  10

//btn  titles
#define kBtnTitles  @[@"日常消费", @"杨过小龙女之大战江湖", @"屌丝程序员结婚", @"LOL", @"卡哇伊", @"詹姆斯", @"史蒂夫·纳什", @"太子妃升职记", @"哦我的鬼神大人", @"其他选项"]

@interface BtnSortViewController ()
{
    UIView *_view;
    UIButton *_navRightBtn;
}
@property(nonatomic, strong) NSMutableArray *selectedBtnArray; //存放被选中的btn
@end

@implementation BtnSortViewController

- (NSMutableArray *)selectedBtnArray{
    if (!_selectedBtnArray) {
        _selectedBtnArray = [NSMutableArray array];
    }
    return _selectedBtnArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"btnSortAndSelect";
    
    //初始化背景View
    [self setUI];
    //导航栏右边的btn
    [self setNavRightBtn];
    //设置各btnItem的位置
    [self setBtnItemsPosition];
    
    [self selectedBtnArray];
}

- (void)setUI{
    _view = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.width, 100)];
    _view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_view];
    
}
- (void)setNavRightBtn{
    _navRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _navRightBtn.frame = CGRectMake(0, 0, 40, 40);
    [_navRightBtn setTitle:@"完成" forState:UIControlStateNormal];
    _navRightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_navRightBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_navRightBtn];
    [_navRightBtn addTarget:self action:@selector(rightBarButtonItemTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
}
- (void)setBtnItemsPosition{
    //第一个btn的起点
    CGSize size = CGSizeMake(kLeftSpace, 50);
    //间距
    CGFloat padding = kPadding;
    NSArray *titleArr = kBtnTitles;
    
    for (int i = 0; i < titleArr.count; i++) {
        //获取 title 的长度
        CGFloat keyWordWidth = [self getSizeByString:titleArr[i] andFontSize:14].width;
        if (keyWordWidth > kDeviceWidth) {
            keyWordWidth = kDeviceWidth;
        }
        if (kDeviceWidth - size.width < keyWordWidth) { //另起一行
            size.height += 45;
            size.width = kLeftSpace;
        }
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(size.width, size.height, keyWordWidth, kBtnHeight)];
        //btn 处理
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.layer.borderColor = [UIColor orangeColor].CGColor;
        button.layer.borderWidth = 1;
        button.layer.cornerRadius = 15;
        button.layer.masksToBounds = YES;
        
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [_view addSubview:button];
        
        button.tag = 200+i;
        [button addTarget:self action:@selector(tagBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        //起点 变化
        size.width += keyWordWidth + padding;
        //背景View的高度
        _view.height = size.height + 50;
    }
}

- (void)rightBarButtonItemTouchUpInside{
    NSString *str = [_selectedBtnArray componentsJoinedByString:@","];
    self.selectedBtnItemBlock(str);
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)tagBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        sender.backgroundColor = [UIColor redColor];
        sender.titleLabel.textColor = [UIColor whiteColor];
        sender.layer.borderColor = [UIColor redColor].CGColor;
        [_selectedBtnArray addObject:sender.titleLabel.text];
    }else{
        sender.backgroundColor = [UIColor whiteColor];
        [_selectedBtnArray removeObject:sender.titleLabel.text];
    }
}

- (CGSize)getSizeByString:(NSString *)string andFontSize:(CGFloat)fontSize{
    CGSize size = [string boundingRectWithSize:CGSizeMake(200, fontSize) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    size.width += 25;
    return size;
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
