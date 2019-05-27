//
//  ZTRTableViewCell.h
//  知己
//
//  Created by 周天荣 on 2019/5/27.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class NewsCard;
@interface ZTRTableViewCell : UITableViewCell

@property(nonatomic,strong)NewsCard *card;

@end

NS_ASSUME_NONNULL_END
