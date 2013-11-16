//
//  LiveMatch.h
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/18.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LiveTeam.h"
#import "LivePlayer.h"

@interface LiveMatch : NSObject
@property (strong,nonatomic) NSArray *players;
@property (strong,nonatomic) LiveTeam *radiantTeam;
@property (strong,nonatomic) LiveTeam *direTeam;

@property (assign,nonatomic) int spectators;
@property (strong,nonatomic) NSString *towerState;
@property (strong,nonatomic) NSString *leagueId;
@property (strong,nonatomic) NSString *lobbyId;

-(NSMutableArray *)getDirePlayers;
-(NSMutableArray *)getRadiantPlayers;
-(NSMutableArray *)getCasters;
@end
