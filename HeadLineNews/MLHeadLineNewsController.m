//
//  MLHeadLineNewsController.m
//  HeadLineNews
//
//  Created by 李明禄 on 15/11/16.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "MLHeadLineNewsController.h"
#import "MLHTTPManager.h"
#import "MLHeadLine.h"
#import "UIImageView+WebCache.h"

@interface MLHeadLineNewsController ()

@property (nonatomic, strong) NSArray *HeadLineNews;
@end

@implementation MLHeadLineNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"头条新闻";
    self.tableView.rowHeight = 60;
    
//    1.初始化管理器
    MLHTTPManager *manager = [MLHTTPManager manager];
    
    //2.请求头条新闻数据
    [manager GET:@"http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html" parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        
        NSArray *html = responseObject[@"T1348647853363"];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        
        
        for (NSDictionary *dict in html) {
            MLHeadLine *headLine = [MLHeadLine headLineWidthDict:dict];
            
            [arrayM addObject:headLine];
        }
        
        self.HeadLineNews = arrayM;
        
        //重新加载数据,否则不显示数据
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败----%@", error);
        
    }];
    
  
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.HeadLineNews.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeadLine" forIndexPath:indexPath];
    
    MLHeadLine *headLine = self.HeadLineNews[indexPath.row];
    
    cell.textLabel.text = headLine.title;
    cell.detailTextLabel.text = headLine.digest;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:headLine.imgsrc] placeholderImage:[UIImage imageNamed:@"loading"]];
    NSLog(@"cell.textLabel.text\n");
    
    return cell;
}

@end
