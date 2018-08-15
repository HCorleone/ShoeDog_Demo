//
//  homeTableViewCell.m
//  wudi5.0
//
//  Created by 无敌帅枫 on 2018/6/8.
//  Copyright © 2018年 无敌帅枫. All rights reserved.
//

#import "homeTableViewCell.h"
@interface homeTableViewCell ()

@property (strong,nonatomic) UILabel *SneakerName;
@property (strong,nonatomic) UILabel *SneakerBuy;
@property (strong,nonatomic) UILabel *SneakerPrice;
@property (strong,nonatomic) UILabel *ReleaseData;
@property (strong,nonatomic) UIImageView *SneakerImage;

@end

@implementation homeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:@"cellId"];
    
    if (self) {
        
        //添加图片SneakerImageView
        CGFloat imageViewWidth = 150;
        CGFloat imageViewHeight = 104;
        CGFloat imageViewLeftView = 10;
        
        self.SneakerImage = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewLeftView, 0,imageViewWidth, imageViewHeight)];
        self.SneakerImage.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.SneakerImage];
        
        //添加标签SneakerName
        CGFloat SneakerNameLabelWidth = 180;
        CGFloat SneakerNameLabelHeight = 17.5;
        CGFloat SneakerNameTopView = 20;
        CGFloat SneakerNameLeftView = 175;
        
        self.SneakerName = [[UILabel alloc] initWithFrame:CGRectMake(SneakerNameLeftView, SneakerNameTopView, SneakerNameLabelWidth, SneakerNameLabelHeight)];
        self.SneakerName.font = [UIFont fontWithName:@"Oswald" size:15];
        [self addSubview:self.SneakerName];
        
        //添加标签SneakerPrice
        CGFloat SneakerPriceLabelWidth = 28.5;
        CGFloat SneakerPriceLabelHeight = 15;
        CGFloat SneakerPriceTopView = 40.5;
        CGFloat SneakerPriceLeftView = 257;
        
        self.SneakerPrice = [[UILabel alloc]initWithFrame:CGRectMake(SneakerPriceLeftView, SneakerPriceTopView, SneakerPriceLabelWidth, SneakerPriceLabelHeight)];
        self.SneakerPrice.font = [UIFont fontWithName:@"Oswald" size:13];
        self.SneakerPrice.textColor = [UIColor redColor];
        [self addSubview:self.SneakerPrice];
        
        //添加标签Buy Now From
        self.SneakerBuy = [[UILabel alloc]initWithFrame:CGRectMake(175, 37.5, 74.5, 19.5)];
        self.SneakerBuy.font = [UIFont fontWithName:@"Oswald-Light" size:13];
        [self addSubview:self.SneakerBuy];
        
        //添加标签ReleaseData
        self.ReleaseData = [[UILabel alloc]initWithFrame:CGRectMake(175, 55.5, 100, 19.5)];
        self.ReleaseData.font = [UIFont fontWithName:@"Oswald-Light" size:13];
        [self addSubview:self.ReleaseData];
        
    }
    
    return self;

}


- (void)setModel:(sneakerDataModel *)model {
    _model = model;
    
    self.SneakerName.text = model.sneakerName;
    self.SneakerImage.image = [UIImage imageNamed:model.sneakerName];
    self.SneakerPrice.text = model.sneakerPrice;
    self.ReleaseData.text = model.releaseData;
    self.SneakerBuy.text = @"BUY NOW FROM";
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
