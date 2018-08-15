//
//  homeTableViewController.m
//  wudi5.0
//
//  Created by 无敌帅枫 on 2018/6/8.
//  Copyright © 2018年 无敌帅枫. All rights reserved.
//

#import "homeTableViewController.h"
#import "HomeTableViewCell.h"
#import "detailViewController.h"
#import "newView.h"
#import "sneakerDataModel.h"

@interface homeTableViewController ()

@property(strong,nonatomic) NSMutableArray *listData;

@end

@implementation homeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //给导航栏添加左右按钮
    self.navigationController.navigationBar.tintColor = UIColor.blackColor;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu-icon"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"imgSetting_inactive"] style:UIBarButtonItemStylePlain target:self action:nil];
    //添加搜索框
    UIView *newTitleView = [[newView alloc] initWithFrame:CGRectMake(127, 0, 150, 20)];
    UITextField *search = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 150, 20)];
    search.layer.borderWidth = 1;
    search.layer.borderColor = [[UIColor blackColor]CGColor];
    search.placeholder = @" Search ShoeDog";
    
    [newTitleView addSubview:search];
    self.navigationItem.titleView = newTitleView;
    
    
    
    [self.tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"cellId"];
    //设置Cell属性
    self.tableView.rowHeight = 104;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    
    [self configDatas];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configDatas {
    
    //讲json文件解析到字典中
    NSString *path = [[NSBundle mainBundle]pathForResource:@"AJ" ofType:@"json"];
    NSData *jsonData = [[NSData alloc]initWithContentsOfFile:path];
    NSError *error;
    NSDictionary *jsonDataDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    //讲字典中的数据存到数组中
    if ([jsonDataDic[@"code"] integerValue] == 1) {
        NSArray *jsonDataArr = jsonDataDic[@"data"];
        self.listData = [NSMutableArray array];
    //建立模型数组
        for (int i =0; i < jsonDataArr.count; i++) {
            NSDictionary *aDic = jsonDataArr[i];
            sneakerDataModel *aModel = [sneakerDataModel configsneakerDataModelWith:aDic];
            [self.listData addObject:aModel];
            
        }
    }

}



#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _listData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.model = _listData[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    detailViewController *detailView = [[detailViewController alloc] init];
    detailView.bmodel = _listData[indexPath.row];
    [self.navigationController pushViewController:detailView animated:YES];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
