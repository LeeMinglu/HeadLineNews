//
//  MLHeadLineNewsController.m
//  HeadLineNews
//
//  Created by 李明禄 on 15/11/16.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "MLHeadLineNewsController.h"
#import "MLHTTPManager.h"

@interface MLHeadLineNewsController ()

@end

@implementation MLHeadLineNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"头条新闻";
    self.tableView.rowHeight = 60;
    
    MLHTTPManager *manager = [MLHTTPManager manager];
    
    [manager GET:@"http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"请求成功---%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败----%@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeadLine" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"NEWSTitle---%td", indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat: @"news--cotents--%td", indexPath.row];
    
    return cell;
}

@end
