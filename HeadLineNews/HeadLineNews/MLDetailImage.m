//
//  MLDetailImage.m
//  HeadLineNews
//
//  Created by 李明禄 on 15/11/17.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "MLDetailImage.h"

@implementation MLDetailImage

+ (instancetype)detailImageWithDict:(NSDictionary *)dict {
    MLDetailImage *image = [[MLDetailImage alloc] init];
    
    image.pixel = dict[@"pixel"];
    image.ref = dict[@"ref"];
    image.src = dict[@"src"];
    
    return image;
}

@end
