//
//  NewsCard.m
//  知己
//
//  Created by 周天荣 on 2019/5/27.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "NewsCard.h"

@implementation NewsCard

- (CGFloat)cellH{
    if(_cellH == 0){
        CGFloat space = 10;
        
        CGFloat iconX = space;
        CGFloat iconY = space;
        CGFloat iconWH = 40;
        CGRect iconFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
        
        CGFloat textX = iconX;
        CGFloat textY = CGRectGetMaxY(iconFrame) + space;
        CGFloat textW = [UIScreen mainScreen].bounds.size.width - 2 * space;
        CGSize maxSize = CGSizeMake(textW, 100000);
        //    CGSize textSize = [self.card.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:maxSize];
        NSDictionary *textAttr = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
        CGFloat textH = [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttr context:nil].size.height;
        CGRect textframe = CGRectMake(textX, textY, textW, textH);
        if(self.picture){
            CGFloat pictureX = iconX;
            CGFloat pictureY = CGRectGetMaxY(textframe) + space;
            CGFloat pictureWH = 100;
            CGRect pictureFrame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
            _cellH = CGRectGetMaxY(pictureFrame)+space;
        }else {
            _cellH =  CGRectGetMaxY(textframe)+space;
        }
    }
    return _cellH;
}

@end
