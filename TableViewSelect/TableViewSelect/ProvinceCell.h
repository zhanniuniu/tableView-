//
//  ProvinceCell.h
//  TableViewSelect
//
//  Created by dlt_zhanlijun on 16/9/26.
//  Copyright © 2016年 dlt_zhanlijun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ProvinceCell,ProvinceModel;
@protocol ProvinceDelegate <NSObject>

- (void)provinceSelected:(ProvinceCell *)cell selected:(BOOL)selected;

@end

@interface ProvinceCell : UITableViewCell

@property(nonatomic,assign)id delegate;
@property (nonatomic,strong) UIButton *selectBtn;

- (void)setContentView:(ProvinceModel *)model;

@end
