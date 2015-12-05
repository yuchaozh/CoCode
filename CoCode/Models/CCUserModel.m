//
//  CCUserModel.m
//  CoCode
//
//  Created by wuxueqian on 15/11/7.
//  Copyright (c) 2015年 wuxueqian. All rights reserved.
//

#import "CCUserModel.h"
#import "CCMemberModel.h"
#import "CCTopicModel.h"

@implementation CCUserModel

- (instancetype)initWithLoginRespondeObject:(NSDictionary *)respondObject{
    self = [super init];
    
    if (self) {
        self.member = [[CCMemberModel alloc] initWithUserDictionary:respondObject];
        self.login = YES;
    }
    
    return self;
}

+ (CCUserModel *)getUserWithLoginRespondObject:(NSDictionary *)respondeObject{
    CCUserModel *user = [[CCUserModel alloc] initWithLoginRespondeObject:respondeObject];
    //CCMemberModel *member = user.member;
    return user;
}

@end

@implementation CCUserBookmarksModel

- (instancetype)initWithResponseObject:(NSDictionary *)responseObject{
    
    if (self = [super init]) {
        if (responseObject && [responseObject objectForKey:@"user_actions"]) {
            NSArray *topicsDict = [responseObject objectForKey:@"user_actions"];
            NSMutableArray *tempTopicsArray = [NSMutableArray array];
            for (NSDictionary *topicDict in topicsDict) {
                CCTopicModel *topic = [[CCTopicModel alloc] initWithUserActionsDictionary:topicDict];
                [tempTopicsArray addObject:topic];
            }
            NSArray *list = [NSArray arrayWithArray:tempTopicsArray];
            self.list = list;
            return self;
        }
    }
    return nil;
}

@end
