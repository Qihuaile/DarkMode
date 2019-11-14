//
//  ViewController.m
//  DarkMode_OC
//
//  Created by shqq on 2019/11/11.
//  Copyright © 2019 shqq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate> {
    NSDictionary *_dataSource;
}

@property (nonatomic, strong) UITableView *tableView;
 
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataSource = @{@"layerViewController":@"LayerController",
                    @"webViewController":@"WebController",
                    @"当当当":@"dangdangd"};
    
    [self.view addSubview:self.tableView];
    
}

- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.backgroundColor = BG_COLOR;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = false;
        _tableView.showsHorizontalScrollIndicator = false;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.00001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.00001;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = _dataSource.allKeys[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *vcString = [_dataSource valueForKey:_dataSource.allKeys[indexPath.row]];
    
    if ([NSClassFromString(vcString) isSubclassOfClass:UIViewController.class]) {
        [self.navigationController pushViewController:[NSClassFromString(vcString) new]  animated:true];
    } else {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"无法将\"%@\"解析为Controller",vcString]
                                                                         message:@""
                                                                  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alertVC addAction:action];
        
        [self presentViewController:alertVC animated:true completion:nil];
    }
}
@end
