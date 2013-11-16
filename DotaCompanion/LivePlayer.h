//
//  LivePlayer.h
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/18.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LivePlayer : NSObject
@property (strong,nonatomic) NSString *accountId;
@property (strong,nonatomic) NSString *heroId;
@property (strong,nonatomic) NSString *name;
@property (assign,nonatomic) int team;
@end
