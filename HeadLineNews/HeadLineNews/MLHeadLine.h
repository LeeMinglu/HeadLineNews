//
//  MLHeadLine.h
//  HeadLineNews
//
//  Created by 李明禄 on 15/11/16.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLHeadLine : NSObject
/**
 *  图像
 */
@property (nonatomic, copy) NSString *imgsrc;

/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  子标题
 */
@property (nonatomic, copy) NSString *digest;

+ (instancetype) headLineWidthDict:(NSDictionary *)dict;

@end
