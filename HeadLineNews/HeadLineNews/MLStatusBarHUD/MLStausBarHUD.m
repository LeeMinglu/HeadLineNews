//
//  MLStausBarHUD.m
//  HeadLineNews
//
//  Created by 李明禄 on 15/11/18.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "MLStausBarHUD.h"
#import <UIKit/UIKit.h>

//提示信息高度
#define WINDOW_HEIGHT 20

//字体大小
#define WINDOW_FONT 12

UIWindow *_window;

@implementation MLStausBarHUD

+ (void)showMessage:(NSString *)message {
    
    //创建一个button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:message forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"MLStausBarHUD.bundle/success"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:WINDOW_FONT];
    
    
    //创建window
    _window = [[UIWindow alloc] init];
    _window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, WINDOW_HEIGHT);
    button.frame = _window.bounds;
    _window.backgroundColor = [UIColor blackColor];
    
    //设置window的等级
    _window.windowLevel = UIWindowLevelAlert;
    
    [_window addSubview:button];
    _window.hidden = NO;
    
}


@end
