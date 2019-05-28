//
//  ZTRTableViewCell.m
//  知己
//
//  Created by 周天荣 on 2019/5/27.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "ZTRTableViewCell.h"
#import "NewsCard.h"

#define NameFont [UIFont systemFontOfSize:16]
#define TextFont [UIFont systemFontOfSize:14]

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
        name_label.font = NameFont;
        [self.contentView addSubview:name_label];
        self.name_label = name_label;
        
        UILabel *text_label = [[UILabel alloc]init];
        text_label.numberOfLines = 0;
        text_label.font = TextFont;
        [self.contentView addSubview:text_label];
        self.text_label = text_label;
        
        UIImageView *vip_imageView = [[UIImageView alloc]init];
        vip_imageView.image = [UIImage imageNamed:@"vip"];
        vip_imageView.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:vip_imageView];
        self.vip_imageView = vip_imageView;
        
        UIImageView *picture_imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:picture_imageView];
        self.picture_imageView = picture_imageView;
    }
    return self;
}
// 设置cell样式
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat space = 10;
    
    CGFloat iconX = space;
    CGFloat iconY = space;
    CGFloat iconWH = 40;
    self.icon_imageView.frame = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    CGFloat nameX = CGRectGetMaxX(self.icon_imageView.frame) + space;
    CGFloat nameY = iconY;
//    计算文字大小
    NSDictionary *nameAttr = @{NSFontAttributeName : NameFont};
    CGSize nameSize = [self.card.name sizeWithAttributes:nameAttr];
    CGFloat nameW = nameSize.width;
    CGFloat nameH = nameSize.height;
    self.name_label.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    if(self.card.isVip){
        CGFloat vipX = CGRectGetMaxX(self.name_label.frame) + space;
        CGFloat vipW = 14;
        CGFloat vipH = nameH;
        CGFloat vipY = nameY;
        self.vip_imageView.frame = CGRectMake(vipX, vipY, vipW, vipH);
    }
    
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(self.icon_imageView.frame) + space;
    CGFloat textW = CGRectGetWidth(self.contentView.frame) - 2 * space;
    CGSize maxSize = CGSizeMake(textW, 100000);
//    CGSize textSize = [self.card.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:maxSize];
    NSDictionary *textAttr = @{NSFontAttributeName:TextFont};
    CGFloat textH = [self.card.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttr context:nil].size.height;
    self.text_label.frame = CGRectMake(textX, textY, textW, textH);
    if(self.card.picture){
        CGFloat pictureX = iconX;
        CGFloat pictureY = CGRectGetMaxY(self.text_label.frame) + space;
        CGFloat pictureWH = 100;
        self.picture_imageView.frame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
        
    }
}

- (void)setCard:(NewsCard *)card{
    _card = card;
    self.icon_imageView.image = [UIImage imageNamed:card.icon];
    
    self.name_label.text = card.name;
    
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
