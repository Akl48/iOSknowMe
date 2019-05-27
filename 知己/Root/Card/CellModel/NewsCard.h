//
//  NewsCard.h
//  知己
//
//  Created by 周天荣 on 2019/5/27.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NewsCard : NSObject

@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString *text;

@property(nonatomic,copy)NSString *icon;

@property(nonatomic,assign,getter=isVip)BOOL VIP;

@property(nonatomic,copy)NSString *picture;

@end

NS_ASSUME_NONNULL_END
