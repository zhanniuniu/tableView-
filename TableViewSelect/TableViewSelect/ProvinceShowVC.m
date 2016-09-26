//
//  ProvinceShowVC.m
//  TableViewSelect
//
//  Created by dlt_zhanlijun on 16/9/26.
//  Copyright © 2016年 dlt_zhanlijun. All rights reserved.
//

#import "ProvinceShowVC.h"
#import "pinyin.h"
#import "ProvinceModel.h"
#import "ProvinceCell.h"
@interface ProvinceShowVC ()<UITableViewDelegate,UITableViewDataSource,ProvinceDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_arrayData;
    NSMutableDictionary *_mydic;
}
@end

@implementation ProvinceShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addContentView];
    
    [self loadData];
    // Do any additional setup after loading the view.
}

- (void)addContentView
{

    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)loadData
{
    if (!_arrayData) {
       _arrayData = [NSMutableArray arrayWithCapacity:20];
    }
    
    if (!_mydic) {
        _mydic = [[NSMutableDictionary alloc] init];
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"schoolData" ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    NSArray *array = [[NSArray alloc] init];
    array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    for (NSDictionary *dic in array) {
        NSString *provinceName = dic[@"provinceName"];
        [_arrayData addObject:provinceName];
    }
    
    for (int character = 'a'; character<='z'; character++) {
        NSMutableArray *characterArray = [[NSMutableArray alloc] init];
        [_mydic setObject:characterArray forKey:[NSString stringWithFormat:@"%c",character]];
    }
    for (NSString *provinceName in _arrayData) {
        NSString *character = [NSString stringWithFormat:@"%@",[pinyin pinyinFirstLetter:[provinceName characterAtIndex:0]]];
        NSMutableArray *dicNsmArray = [_mydic objectForKey:character];
        ProvinceModel *model = [ProvinceModel provinceModelWithText:provinceName slected:NO];
        [dicNsmArray addObject:model];
    }
    
    for (char character = 'a'; character<='z'; character++) {
        NSString *characterNsstring = [NSString stringWithFormat:@"%c",character];
        NSMutableArray *dicArray = [_mydic objectForKey:characterNsstring];
        if (dicArray.count==0) {
            [_mydic removeObjectForKey:characterNsstring];
        }
    }
    
    
    [_tableView reloadData];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _mydic.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *array = [_mydic.allKeys sortedArrayUsingSelector:@selector(compare:)];
    NSString *character = array[section];
    return [character uppercaseString];
}

#pragma mark UITableViewDelegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"mycell";
    ProvinceCell *cell= [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[ProvinceCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentify];
        cell.delegate = self;
    }
    NSArray *array = [_mydic.allKeys sortedArrayUsingSelector:@selector(compare:)];
    NSString *character = array[indexPath.section];
    NSArray *provinceArray = [_mydic objectForKey:character];
    ProvinceModel *model = provinceArray[indexPath.row];
    
    [cell setContentView:model];
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = [_mydic.allKeys sortedArrayUsingSelector:@selector(compare:)];
    NSString *character = array[section];
    NSArray *provinceArray = [_mydic objectForKey:character];
    return provinceArray.count;
}

#pragma mark ProvinceDelegate

-(void)provinceSelected:(ProvinceCell *)cell selected:(BOOL)selected
{
    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
    NSLog(@"第%ld个####第%ld组",indexPath.row,indexPath.section);
    NSArray *array = [_mydic.allKeys sortedArrayUsingSelector:@selector(compare:)];
    NSString *character = array[indexPath.section];
    NSArray *provinceArray = [_mydic objectForKey:character];
    ProvinceModel *model = provinceArray[indexPath.row];
    model.selected = !model.selected;
    if (model.selected) {
        NSLog(@"选择了");
        cell.selectBtn.selected = NO;
    }
    else
    {
        NSLog(@"取消了");
        cell.selectBtn.selected = YES;
    }
    [_tableView reloadData];
}


@end
