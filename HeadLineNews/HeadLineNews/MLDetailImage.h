//
//  MLDetailImage.h
//  HeadLineNews
//
//  Created by 李明禄 on 15/11/17.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLDetailImage : NSObject

@property (nonatomic, copy) NSString *pixel;
@property (nonatomic, copy) NSString *ref;
@property (nonatomic, copy) NSString *src;

+ (instancetype)detailImageWithDict:(NSDictionary *) dict;
@end
