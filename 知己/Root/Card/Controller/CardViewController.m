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
#import "JUMPViewController.h"
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
        
//        self.tableView.rowHeight = 150;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.separatorStyle = NO;
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsCard *card = self.array[indexPath.row];
    CGFloat space = 10;
    
    CGFloat iconX = space;
    CGFloat iconY = space;
    CGFloat iconWH = 40;
    CGRect iconFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
        
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(iconFrame) + space;
    CGFloat textW = self.view.bounds.size.width - 2 * space;
    CGSize maxSize = CGSizeMake(textW, 100000);
    //    CGSize textSize = [self.card.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:maxSize];
    NSDictionary *textAttr = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    CGFloat textH = [card.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttr context:nil].size.height;
    CGRect textframe = CGRectMake(textX, textY, textW, textH);
    if(card.picture){
        CGFloat pictureX = iconX;
        CGFloat pictureY = CGRectGetMaxY(textframe) + space;
        CGFloat pictureWH = 100;
        CGRect pictureFrame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
        return CGRectGetMaxY(pictureFrame)+space;
    }else {
        return CGRectGetMaxY(textframe)+space;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JUMPViewController *jump = [[JUMPViewController alloc]init];
    [jump setCard:self.array[indexPath.row]];
    [self presentViewController:jump animated:YES completion:nil];
}
@end
