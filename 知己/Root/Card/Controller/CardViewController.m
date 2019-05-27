//
//  CardViewController.m
//  知己
//
//  Created by 周天荣 on 2019/5/26.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "CardViewController.h"
#import "ZTRTableViewCell.h"
#import "NewsCard.h"
#import "MJExtension.h"
@interface CardViewController ()

@property(nonatomic,strong)NSArray *array;

@end

@implementation CardViewController

NSString *ID = @"newID";

- (instancetype)init{
    if(self = [super init])
    {
        self.tabBarItem.title = @"知识";
        // 设置图片,只有设置图片的渲染模式，才能看到图片
        self.tabBarItem.image = [[UIImage imageNamed:@"知识"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
        [self.tableView registerClass:[ZTRTableViewCell class] forCellReuseIdentifier:ID];
        
        self.tableView.rowHeight = 150;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

#pragma mark - lazyloading
- (NSArray *)array{
    if(!_array){
        _array = [NewsCard mj_objectArrayWithFilename:@"news.plist"];
    }
    return _array;
}

#pragma mark - delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZTRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.card = self.array[indexPath.row];
    return cell;
}
@end
