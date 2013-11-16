//
//  LiveMatch.m
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/18.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import "LiveMatch.h"

@implementation LiveMatch
@synthesize players = _players;
@synthesize radiantTeam = _radiantTeam;
@synthesize direTeam = _direTeam;
@synthesize lobbyId = _lobbyId;
@synthesize spectators = _spectators;
@synthesize towerState = _towerState;
@synthesize leagueId = _leagueId;

-(NSMutableArray *)getRadiantPlayers
{
    NSMutableArray *radiants = [[NSMutableArray alloc] initWithCapacity:0];
    for (LivePlayer *player in self.players) {
        if (player.team == 0) {
            [radiants addObject:player];
        }
    }
    return radiants;
}

-(NSMutableArray *)getDirePlayers
{
    NSMutableArray *dires = [[NSMutableArray alloc] initWithCapacity:0];
    for (LivePlayer *player in self.players) {
        if (player.team == 1) {
            [dires addObject:player];
        }
    }
    return dires;
}

-(NSMutableArray *)getCasters
{
    NSMutableArray *casters = [[NSMutableArray alloc] initWithCapacity:0];
    for (LivePlayer *player in self.players) {
        if (player.team > 1) {
            [casters addObject:player];
        }
    }
    return casters;
}

@end
