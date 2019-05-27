//
//  ZTRTableViewCell.m
//  知己
//
//  Created by 周天荣 on 2019/5/27.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "ZTRTableViewCell.h"
#import "NewsCard.h"

@interface ZTRTableViewCell ()
@property(nonatomic,weak)UIImageView *icon_imageView;
@property(nonatomic,weak)UILabel *name_label;
@property(nonatomic,weak)UILabel *text_label;
@property(nonatomic,weak)UIImageView *vip_imageView;
@property(nonatomic,weak)UIImageView *picture_imageView;

@end

@implementation ZTRTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
//        初始化
        UIImageView *icon_imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:icon_imageView];
        self.icon_imageView = icon_imageView;
        
        UILabel *name_label = [[UILabel alloc]init];
        [self.contentView addSubview:name_label];
        self.name_label = name_label;
        
        UILabel *text_label = [[UILabel alloc]init];
        [self.contentView addSubview:text_label];
        self.text_label = text_label;
        
        UIImageView *vip_imageView = [[UIImageView alloc]init];
        vip_imageView.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vip_imageView];
        self.vip_imageView = vip_imageView;
        
        UIImageView *picture_imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:picture_imageView];
        self.picture_imageView = picture_imageView;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat space = 10;
    
    CGFloat iconX = space;
    CGFloat iconY = space;
    CGFloat iconWH = 40;
    
    self.icon_imageView.frame = CGRectMake(iconX, iconY, iconWH, iconWH);
}

- (void)setCard:(NewsCard *)card{
    _card = card;
    self.icon_imageView.image = [UIImage imageNamed:card.icon];
    
    self.name_label.text = card.text;
    
    if(card.isVip){
        self.vip_imageView.hidden = NO;
        self.name_label.textColor = [UIColor orangeColor];
    } else {
        self.vip_imageView.hidden = YES;
        self.name_label.textColor = [UIColor blackColor];
    }
    
    self.text_label.text = card.text;
    
    if(card.picture){
        self.picture_imageView.hidden = NO;
        self.picture_imageView.image = [UIImage imageNamed:card.picture];
    }else{
        self.picture_imageView.hidden = YES;
    }
}
@end
