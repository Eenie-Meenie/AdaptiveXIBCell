//
//  BaseViewController.m
//  AdaptiveCell
//
//  Created by bnysc on 2016/12/5.
//  Copyright © 2016年 HB. All rights reserved.
//

#import "BaseViewController.h"
#import <MJExtension.h>
#import "AdaptiveModel.h"
#import "AdaptiveTableViewCell.h"

#define Space 10          // 间距

static NSString *identifier = @"AdaptiveTableViewCell";

@interface BaseViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation BaseViewController

#pragma mark - 懒加载
- (NSArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [AdaptiveModel mj_objectArrayWithFilename:@"ModelList.plist"];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
//    [self.tableView registerClass:[AdaptiveTableViewCell class] forCellReuseIdentifier:identifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"AdaptiveTableViewCell" bundle:nil] forCellReuseIdentifier:@"AdaptiveCell"];
    
    
    // self-sizing(iOS8以后才支持)
    // 设置tableView所有的cell的真实高度是自动计算的(根据设置的约束)
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    // 设置tableView的估算高度
    self.tableView.estimatedRowHeight = 44;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view dataSource

// 设置单元格行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

// 设置单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AdaptiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AdaptiveCell" forIndexPath:indexPath];
    // 传递数组模型
    cell.model = self.dataSource[indexPath.row];
    return cell;
}


#pragma mark - table view delegate

#pragma mark - accessory method

@end
