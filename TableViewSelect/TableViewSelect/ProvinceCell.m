//
//  ProvinceCell.m
//  TableViewSelect
//
//  Created by dlt_zhanlijun on 16/9/26.
//  Copyright © 2016年 dlt_zhanlijun. All rights reserved.
//

#import "ProvinceCell.h"
#import "ProvinceModel.h"
@interface ProvinceCell ()
{
    UILabel *_textLable;
//    UIButton *_selectBtn;
}
@end

@implementation ProvinceCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addContentView];
    }
    return self;
}

- (void)addContentView
{
    _textLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/4.0*3, self.frame.size.height)];
    [_textLable setAdjustsFontSizeToFitWidth:YES];
    [self.contentView addSubview:_textLable];
    
    _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_selectBtn setFrame:CGRectMake(CGRectGetMaxX(_textLable.frame)+20, 10, self.frame.size.height-20, self.frame.size.height-20)];
    [_selectBtn setBackgroundImage:[UIImage imageNamed:@"select_n"] forState:UIControlStateNormal];
    [_selectBtn setBackgroundImage:[UIImage imageNamed:@"select_y"] forState:UIControlStateSelected];
    [_selectBtn addTarget:self action:@selector(slectedButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_selectBtn];
    
}

- (void)slectedButtonPressed:(UIButton *)btn
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(provinceSelected:selected:)]) {
        [self.delegate provinceSelected:self selected:btn.selected];
    }
}


- (void)setContentView:(ProvinceModel *)model
{
    _textLable.text = model.text;
    if (model.selected) {
        _selectBtn.selected = YES;
    }
    else
    {
        _selectBtn.selected = NO;
    }
}

@end
