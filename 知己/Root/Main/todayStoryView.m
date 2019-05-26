//
//  todayStoryView.m
//  知己
//
//  Created by Anthony Zhang on 2019/5/26.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "todayStoryView.h"
#import "restrain.h"

@implementation todayStoryView


- (instancetype)initWithValue:(NSString *)title :(NSString *)intro :(UIImage *)image {
    self = [super init];
    self.backgroundColor = RandomColor;
    self.title = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH*4/5-10, 30)];
    self.title.font = [UIFont systemFontOfSize:25];
    self.title.text = title;
    self.title.textColor = [UIColor whiteColor];
    self.title.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.title];
    
    self.intro = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*4/10, 40, SCREEN_WIDTH*4/10-10, 60)];
    self.intro.font = [UIFont systemFontOfSize:15];
    self.intro.numberOfLines = 0;
    self.intro.text = [NSString stringWithFormat:@"「 %@ 」",intro];
    self.intro.textColor = [UIColor whiteColor];
    self.intro.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.intro];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 90, 150, 150)];
    [self.imageView setImage:image];
    [self addSubview:self.imageView];
    
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    return self;
}



@end
