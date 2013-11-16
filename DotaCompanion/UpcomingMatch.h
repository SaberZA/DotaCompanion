//
//  UpcomingMatch.h
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/18.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UpcomingMatch : NSObject
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *time;

@property (copy,nonatomic) NSString *team1;
@property (copy,nonatomic) NSString *team2;
@property (copy,nonatomic) NSString *tournamentUrl;
@property (assign,nonatomic) BOOL notificationOn;

@end
