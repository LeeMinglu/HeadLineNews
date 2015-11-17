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

/** 新闻url */
@property (nonatomic , copy) NSString *url;
/** 新闻url */
@property (nonatomic , copy) NSString *url_3w;
/** 新闻id */
@property (nonatomic , copy) NSString *docid;

+ (instancetype) headLineWidthDict:(NSDictionary *)dict;

@end
