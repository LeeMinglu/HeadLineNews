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

+ (void)showMessage:(NSString *)message image:(UIImage *)image {
    
    if (_window) return;
    //创建一个button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:message forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:WINDOW_FONT];
    
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    //创建window
    _window = [[UIWindow alloc] init];
    _window.frame = CGRectMake(0, -WINDOW_HEIGHT, [UIScreen mainScreen].bounds.size.width, WINDOW_HEIGHT);
    button.frame = _window.bounds;
    _window.backgroundColor = [UIColor blackColor];
    
    //设置window的等级
    _window.windowLevel = UIWindowLevelAlert;
    
    [_window addSubview:button];
    _window.hidden = NO;
    
    [UIView animateWithDuration:2.0 animations:^{
        
        CGRect frame = _window.frame;
        frame.origin.y = 0;
        _window.frame = frame;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            
            CGRect frame = _window.frame;
            frame.origin.y = -WINDOW_HEIGHT;
            _window.frame = frame;
            
        } completion:^(BOOL finished) {
            _window = nil;
        }];
        
    }];
}

+ (void)showMessage:(NSString *)message imageName:(NSString *)imageName {
    [self showMessage:message image:[UIImage imageNamed:imageName]];
}


+ (void)showSucess:(NSString *)message {
    [self showMessage:message imageName:@"MLStausBarHUD.bundle/success"];
}


+ (void)showError:(NSString *)message {
    [self showMessage:message imageName:@"MLStausBarHUD.bundle/error"];
}

+ (void)showLoading:(NSString *)message {
    
    if (_window) return;
    //创建window
    _window = [[UIWindow alloc] init];
    _window.frame = CGRectMake(0, -WINDOW_HEIGHT, [UIScreen mainScreen].bounds.size.width, WINDOW_HEIGHT);
    _window.backgroundColor = [UIColor blackColor];
    
    //设置window的等级
    _window.windowLevel = UIWindowLevelAlert;
    _window.hidden = NO;
    UILabel *label = [[UILabel alloc] init];
    
    label.frame = _window.bounds;
    label.text = message;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [_window addSubview:label];
    
    //添加指示器
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    //让指示器转动起来
    [indicatorView startAnimating];
    
    //设置frame
    indicatorView.frame = CGRectMake(0, 0, WINDOW_HEIGHT, WINDOW_HEIGHT);
    
    [_window addSubview:indicatorView];
    
    [UIView animateWithDuration:2.0 animations:^{
        
        CGRect frame = _window.frame;
        frame.origin.y = 0;
        _window.frame = frame;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            
            CGRect frame = _window.frame;
            frame.origin.y = -WINDOW_HEIGHT;
            _window.frame = frame;
            
        } completion:^(BOOL finished) {
            _window = nil;
        }];
        
    }];
    
    
}


@end
