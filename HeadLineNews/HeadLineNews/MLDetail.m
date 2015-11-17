//
//  MLDetail.m
//  HeadLineNews
//
//  Created by 李明禄 on 15/11/17.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "MLDetail.h"
#import "MLDetailImage.h"


@implementation MLDetail

+ (instancetype)detailWithDict:(NSDictionary *)dict {
    MLDetail *detail = [[MLDetail alloc] init];
    
    detail.title = dict[@"title"];
    detail.body = dict[@"body"];
    detail.ptime = dict[@"ptime"];
    
    NSArray *imgArray = dict[@"img"];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in imgArray) {
        MLDetailImage *detailImage = [MLDetailImage detailImageWithDict:dict];
        [arrayM addObject:detailImage];
    }
    detail.img = arrayM;
    
    return detail;
}


@end
