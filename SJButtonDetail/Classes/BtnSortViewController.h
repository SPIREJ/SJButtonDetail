//
//  BtnSortViewController.h
//  SJButtonDetail
//
//  Created by SPIREJ on 16/1/14.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BtnSortViewController : UIViewController

//点击完成的回调
@property(copy, nonatomic) void(^selectedBtnItemBlock)(NSString *btnItemTitles);
@end
