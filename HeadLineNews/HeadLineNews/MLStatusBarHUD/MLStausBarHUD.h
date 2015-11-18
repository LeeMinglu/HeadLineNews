//
//  MLStausBarHUD.h
//  HeadLineNews
//
//  Created by 李明禄 on 15/11/18.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MLStausBarHUD : NSObject

/**
 *  显示信息 (此方法已过期,建议使用XXXX方法 )
 *
 *  @param msg   文字内容
 *  @param image 图片对象
 */
+ (void)showMessage:(NSString *)message image:(UIImage *)image;

/**
 *  显示信息
 *
 *  @param msg   文字内容
 *  @param imageName 图片名称 (图片高度最好在 20 以内, 仅限于本地图片)
 */
+ (void)showMessage:(NSString *)message imageName:(NSString *)imageName;

/**
 *  显示成功信息
 *
 *  @param message 成功参数
 */
+ (void)showSucess:(NSString *)message;


/**
 *  隐藏信息
 */
+ (void)showError:(NSString *)message;

/**
 *  显示加载信息
 */
+(void) showLoading:(NSString *)message;






@end
