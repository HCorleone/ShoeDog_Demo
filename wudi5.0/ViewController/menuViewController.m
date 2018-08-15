//
//  menuViewController.m
//  wudi5.0
//
//  Created by 无敌帅枫 on 2018/7/17.
//  Copyright © 2018年 无敌帅枫. All rights reserved.
//

#import "menuViewController.h"

@interface menuViewController ()

@property(strong,nonatomic)UIImageView *ajLogo;
@property(strong,nonatomic)UIButton *loginBtn;
@property(strong,nonatomic)UIButton *signupBtn;

@end

@implementation menuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.ajLogo = [[UIImageView alloc]initWithFrame:CGRectMake(44, 40, 210, 494)];
    [self.ajLogo setImage:[UIImage imageNamed:@"ajLogo"]];
    [self.view addSubview:self.ajLogo];

    self.loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 607, 149, 60)];
    [self.loginBtn setImage:[UIImage imageNamed:@"loginBtn"] forState:UIControlStateNormal];
    [self.view addSubview:self.loginBtn];
    
    self.signupBtn = [[UIButton alloc]initWithFrame:CGRectMake(151, 607, 149, 60)];
    [self.signupBtn setImage:[UIImage imageNamed:@"signupBtn"] forState:UIControlStateNormal];
    [self.view addSubview:self.signupBtn];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
