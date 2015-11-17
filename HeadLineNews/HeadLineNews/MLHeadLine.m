//
//  MLHeadLine.m
//  HeadLineNews
//
//  Created by 李明禄 on 15/11/16.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "MLHeadLine.h"

@implementation MLHeadLine

+ (instancetype)headLineWidthDict:(NSDictionary *)dict {
    MLHeadLine *headLine = [[self alloc] init];
    
    headLine.title = dict[@"title"];
    headLine.imgsrc = dict[@"imgsrc"];
    headLine.digest = dict[@"digest"];
    headLine.url = dict[@"url"];
    headLine.url_3w = dict[@"url_3w"];
    headLine.docid = dict[@"docid"];
    
    
    return headLine;
}

@end
