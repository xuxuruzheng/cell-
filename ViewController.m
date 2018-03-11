//
//  ViewController.m
//  cell自适应
//
//  Created by 徐征 on 2017/12/13.
//  Copyright © 2017年 徐征. All rights reserved.
//

//获取屏幕 宽度、高度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "TableViewCell.h"
#import "UIViewController+CacheHeight.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *cellLists;                 //cell数组
//@property (nonatomic, strong)NSMutableDictionary *heightAtIndexPath;    //缓存高度
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createUI];
}

#pragma mark ----创建视图
- (void)createUI
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];
}

#pragma mark ---- UITableViewDelegate,UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class])];
    cell.label.text = self.cellLists[indexPath.row];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellLists.count;
}

/*
//缓存高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *number = [self.heightAtIndexPath objectForKey:indexPath];
    if (number)
    {
        return number.floatValue;
    }
    else
    {
        return 100;
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *number = @(cell.frame.size.height);
    [self.heightAtIndexPath setObject:number forKey:indexPath];
}
 */

#pragma mark ---- lazy loading
- (NSMutableArray *)cellLists
{
    if (!_cellLists)
    {
        _cellLists = [NSMutableArray arrayWithCapacity:0];
        
        for (int i = 0; i < 30; i++)
        {
            NSString *allString = @"蓝湖是冰岛著名的户外浴池，是世界著名的地热温泉，位于雷克雅未克市东南方向。人们称蓝湖是个“天然美容院”。蓝湖的形成十分特别，海水经过地下高热火山熔岩层而吸收热量，水中含有许多化学与矿物结晶，这些结晶已被冰岛医学院证明对舒解精神压力，具有某种疗效，因此从蓝湖中提炼出来的各种产品也受到肯定。进入蓝湖不可莽撞，沿着沙地缓缓下去，水底起伏不平，要小心避免撞到忽然出现的熔岩。蓝湖是冰岛著名的户外浴池，是世界著名的地热温泉，位于雷克雅未克市东南方向。人们称蓝湖是个“天然美容院”。蓝湖的形成十分特别，海水经过地下高热火山熔岩层而吸收热量，水中含有许多化学与矿物结晶，这些结晶已被冰岛医学院证明对舒解精神压力，具有某种疗效，因此从蓝湖中提炼出来的各种产品也受到肯定。进入蓝湖不可莽撞，沿着沙地缓缓下去，水底起伏不平，要小心避免撞到忽然出现的熔岩。蓝湖是冰岛著名的户外浴池，是世界著名的地热温泉，位于雷克雅未克市东南方向。人们称蓝湖是个“天然美容院”。蓝湖的形成十分特别，海水经过地下高热火山熔岩层而吸收热量，水中含有许多化学与矿物结晶，这些结晶已被冰岛医学院证明对舒解精神压力，具有某种疗效，因此从蓝湖中提炼出来的各种产品也受到肯定。进入蓝湖不可莽撞，沿着沙地缓缓下去，水底起伏不平，要小心避免撞到忽然出现的熔岩。蓝湖是冰岛著名的户外浴池，是世界著名的地热温泉，位于雷克雅未克市东南方向。人们称蓝湖是个“天然美容院”。蓝湖的形成十分特别，海水经过地下高热火山熔岩层而吸收热量，水中含有许多化学与矿物结晶，这些结晶已被冰岛医学院证明对舒解精神压力，具有某种疗效，因此从蓝湖中提炼出来的各种产品也受到肯定。进入蓝湖不可莽撞，沿着沙地缓缓下去，水底起伏不平，要小心避免撞到忽然出现的熔岩。蓝湖是冰岛著名的户外浴池，是世界著名的地热温泉，位于雷克雅未克市东南方向。人们称蓝湖是个“天然美容院”。蓝湖的形成十分特别，海水经过地下高热火山熔岩层而吸收热量，水中含有许多化学与矿物结晶，这些结晶已被冰岛医学院证明对舒解精神压力，具有某种疗效，因此从蓝湖中提炼出来的各种产品也受到肯定。进入蓝湖不可莽撞，沿着沙地缓缓下去，水底起伏不平，要小心避免撞到忽然出现的熔岩。蓝湖是冰岛著名的户外浴池，是世界著名的地热温泉，位于雷克雅未克市东南方向。人们称蓝湖是个“天然美容院”。蓝湖的形成十分特别，海水经过地下高热火山熔岩层而吸收热量，水中含有许多化学与矿物结晶，这些结晶已被冰岛医学院证明对舒解精神压力，具有某种疗效，因此从蓝湖中提炼出来的各种产品也受到肯定。进入蓝湖不可莽撞，沿着沙地缓缓下去，水底起伏不平，要小心避免撞到忽然出现的熔岩。蓝湖是冰岛著名的户外浴池，是世界著名的地热温泉，位于雷克雅未克市东南方向。人们称蓝湖是个“天然美容院”。蓝湖的形成十分特别，海水经过地下高热火山熔岩层而吸收热量，水中含有许多化学与矿物结晶，这些结晶已被冰岛医学院证明对舒解精神压力，具有某种疗效，因此从蓝湖中提炼出来的各种产品也受到肯定。进入蓝湖不可莽撞，沿着沙地缓缓下去，水底起伏不平，要小心避免撞到忽然出现的熔岩。蓝湖是冰岛著名的户外浴池，是世界著名的地热温泉，位于雷克雅未克市东南方向。人们称蓝湖是个“天然美容院”。蓝湖的形成十分特别，海水经过地下高热火山熔岩层而吸收热量，水中含有许多化学与矿物结晶，这些结晶已被冰岛医学院证明对舒解精神压力，具有某种疗效，因此从蓝湖中提炼出来的各种产品也受到肯定。进入蓝湖不可莽撞，沿着沙地缓缓下去，水底起伏不平，要小心避免撞到忽然出现的熔岩。";
            NSInteger index = arc4random() % allString.length;
            NSString *subString = [allString substringToIndex:index];
            [_cellLists addObject:subString];
        }
    }
    return _cellLists;
}

/*
- (NSMutableDictionary *)heightAtIndexPath
{
    if (!_heightAtIndexPath)
    {
        _heightAtIndexPath = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    return _heightAtIndexPath;
}
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
