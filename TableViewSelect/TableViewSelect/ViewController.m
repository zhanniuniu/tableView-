//
//  ViewController.m
//  TableViewSelect
//
//  Created by dlt_zhanlijun on 16/9/26.
//  Copyright © 2016年 dlt_zhanlijun. All rights reserved.
//

#import "ViewController.h"
#import "ProvinceShowVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)jump:(id)sender {
    
    ProvinceShowVC *showVC = [[ProvinceShowVC alloc] init];
    
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:showVC] animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
