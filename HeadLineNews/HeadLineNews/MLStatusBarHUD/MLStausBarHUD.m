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
    _window.frame = CGRectMake(0, -WINDOW_HEIGHT, [UIScreen mainScreen].bounds.size.width, WINDOW_HEIGHT);
    button.frame = _window.bounds;
    _window.backgroundColor = [UIColor blackColor];
    
    //设置window的等级
    _window.windowLevel = UIWindowLevelAlert;
    
    [_window addSubview:button];
    _window.hidden = NO;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        CGRect frame = _window.frame;
        frame.origin.y = WINDOW_HEIGHT;
        _window.frame = frame;
    });
    
    
    
    
}

+ (void)hiddenMessage {


}


@end
