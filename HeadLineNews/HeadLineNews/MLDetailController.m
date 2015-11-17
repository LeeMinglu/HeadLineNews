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

@interface MLDetailController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation MLDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"新闻详情";
    
    self.webView.delegate = self;
    
//    self.headline
    NSString *url = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/%@/full.html", self.headline.docid];
    NSLog(@"地址是%@",url);
    
    //分别在url及url_3w中进行测试
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.headline.url]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.headline.url_3w]];
    
    [self.webView loadRequest:request];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark: 实现webView的协议 
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
