//
//  MLDetailController.m
//  HeadLineNews
//
//  Created by 李明禄 on 15/11/17.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "MLDetailController.h"
#import "MLHeadLine.h"
#import "MLHTTPManager.h"
#import "MLDetail.h"
#import "MLDetailImage.h"
#import "MLStausBarHUD.h"
#import "MJExtension.h"

@interface MLDetailController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) MLDetail *detail;


@end

@implementation MLDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"新闻详情";
   
    self.webView.delegate = self;
    [MLStausBarHUD showLoading:@"正在加载中!"];
    
//    self.headline
    NSString *url = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/%@/full.html", self.headline.docid];
    
        MLHTTPManager *manager = [MLHTTPManager manager];
    
        [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
            
            NSLog(@"请求成功----%@", responseObject);
            
//            进入详细新闻后保存到桌面上
//            [responseObject writeToFile:@"/Users/luoriver/Desktop/detail.plist" atomically:YES];
            
//            self.detail = [MLDetail detailWithDict:responseObject[self.headline.docid]];
            
            self.detail = [MLDetail objectWithKeyValues:responseObject[self.headline.docid]];
            
            [self showNewDetail];

        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"请求失败----%@",error);
        }];
    

    //分别在url及url_3w中进行测试
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.headline.url]];
    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.headline.url_3w]];
    
//    [self.webView loadRequest:request];
    
    
    
    
}

- (void)showNewDetail {
    
    //创建一个可变数组
    NSMutableString *html = [NSMutableString string];
    
    [html appendString:@"<html>"];
    [html appendString:@"<head>"];
    //添加css样式表
  [html appendFormat:@"<link rel=\"stylesheet\" href=\"%@\">",[[NSBundle mainBundle] URLForResource:@"MLDetail.css" withExtension:nil]];
    
    
    [html appendString:@"</head>"];
    

    [html appendString:@"<body>"];
    
    [html appendString:[self setupBody]];
    
    [html appendString:@"</body>"];
    [html appendString:@"</html>"];
    
    
    [self.webView loadHTMLString:html baseURL:nil];

}

/**
 *  设置html  body
 *
 *  @return <#return value description#>
 */
- (NSString *)setupBody {
    NSMutableString *body = [NSMutableString string];
    
    //设置新闻标题
    [body appendFormat:@"<div class=\"title\">%@</div>", self.detail.title];
    //设置发稿时间
    [body appendFormat:@"<div class=\"time\">%@</div>", self.detail.ptime];
    
    //拼接图片
    [body appendString:self.detail.body];
    // 将图片插入body对应的标记中  比如: <!--IMG#0-->
    for (MLDetailImage *img in self.detail.img) {
        
        NSMutableString *imgHtml = [NSMutableString string];
        
        [imgHtml appendString:@"<div>"];
         
//        <img src="/images/furclothing/standard/tb2azagfpxxxxanxxxxxxxxxxxx_537608854.jpg">
        
        // img.pixel -->  550*344
//        分隔字符串
        NSArray *pixel = [img.pixel componentsSeparatedByString:@"*"]; // [550, 344]
        
        int width = [[pixel firstObject] intValue];
        int height = [[pixel lastObject] intValue];
        int maxWidth = [UIScreen mainScreen].bounds.size.width * 0.8;
        if (width > maxWidth) { // 限制宽度
            height = height * maxWidth / width;
            width = maxWidth;
        }
        
        //定义javaScrip脚本
        NSString *onload = @"this.onclick = function() {"
                            "window.location.href = 'ml:saveImageToAblum:&' + this.src"
                            "};";
        
        //执行javaScrip的脚本
        [imgHtml appendFormat:@"<img onload=\"%@\" width=\"%d\" height=\"%d\" src=\"%@\">",onload, width, height, img.src];

        
         [imgHtml appendString:@"</div>"];
        
        //将字符串进行替换
        [body replaceOccurrencesOfString:img.ref withString:imgHtml options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];
    }
    
   
    
    return body;
}


- (void)saveImageToAblum:(NSString *)imgSrc {
    
    UIAlertController  *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否要保存图片到相册?" preferredStyle:(UIAlertControllerStyleActionSheet)];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        //UIWeb的缓存由NSURLCache来管理
        NSURLCache *cache = [NSURLCache sharedURLCache];
        
        //从网页的缓存中获取图片
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:imgSrc]];
        
        NSCachedURLResponse *response = [cache cachedResponseForRequest:request];
        
        NSData *imageData = response.data;
        
        //保存图片
        UIImage *image = [UIImage imageWithData:imageData];
        
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        
//        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        
        
    }]];
    
    
    [alert addAction:[UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    if (error) {
        [MLStausBarHUD showError:@"保存失败"];
    }else {
        [MLStausBarHUD showSucess:@"保存成功"];
    }
}


#pragma mark: 实现webView的协议 
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *url = request.URL.absoluteString;
    
    //定义字符串的范围
    NSRange range = [url rangeOfString:@"ml:"];
    
    if (range.length > 0) {
        NSUInteger loc = range.location + range.length;
        
//     获取方法名  及参数
        NSString *path = [url substringFromIndex:loc];
        
        NSArray *methodNameAndParam = [path componentsSeparatedByString:@"&"];
        
        NSString *methodName = methodNameAndParam.firstObject;
        NSString *param = nil;
        
        if (methodNameAndParam.count > 1) {
            param = methodNameAndParam.lastObject;
        }
        
        //将字符串转换成SEL方法
        SEL methodSel = NSSelectorFromString(methodName);
        
        if ([self respondsToSelector:methodSel]) {
            [self performSelector:methodSel withObject:param];
        }
        
        return NO;
        
    }
    return YES;
    
    
}

@end
