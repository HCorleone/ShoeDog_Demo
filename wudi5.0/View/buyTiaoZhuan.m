//
//  buyTiaoZhuan.m
//  wudi5.0
//
//  Created by 无敌帅枫 on 2018/7/20.
//  Copyright © 2018年 无敌帅枫. All rights reserved.
//

#import "buyTiaoZhuan.h"
#import "UIColor+ColorChange.h"

@implementation buyTiaoZhuan

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:(CGRect)frame];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderWidth = 1;
    self.layer.borderColor = [[UIColor colorWithHexString:@"#D0CACA"] CGColor];
    
    UILabel *soldoutLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, 14, 246, 17)];
    soldoutLabel.text = @"OUT OF STOCK. CHECK BACK LATER OR TRY:";
    soldoutLabel.font = [UIFont fontWithName:@"Oswald" size:15];
    [self addSubview:soldoutLabel];
    
    UIButton *hupuBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 42, 187, 90)];
    [hupuBtn setImage:[UIImage imageNamed:@"hupuBtn"] forState:UIControlStateNormal];
    [self addSubview:hupuBtn];
    
    UIButton *taobaoBtn = [[UIButton alloc]initWithFrame:CGRectMake(screen.size.width/2 + 0.5, 42, 187, 90)];
    [taobaoBtn setImage:[UIImage imageNamed:@"taobaoBtn"] forState:UIControlStateNormal];
    [self addSubview:taobaoBtn];
    
    self.closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 48, screen.size.width, 48)];
    [self.closeBtn setImage:[UIImage imageNamed:@"closeBtn"] forState:UIControlStateNormal];
    [self addSubview:self.closeBtn];
    
    return self;
}


@end
