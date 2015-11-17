//
//  MLDetail.h
//  HeadLineNews
//
//  Created by 李明禄 on 15/11/17.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLDetail : NSObject

@property (nonatomic, copy) NSString *body;
@property (nonatomic, strong) NSArray *img;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ptime;

+ (instancetype)detailWithDict:(NSDictionary *) dict;

@end
