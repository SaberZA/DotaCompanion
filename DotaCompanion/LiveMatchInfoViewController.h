//
//  LiveMatchInfoViewController.h
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/20.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiveMatch.h"

@interface LiveMatchInfoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *leagueLabel;
@property (strong, nonatomic) IBOutlet UILabel *spectatorsLabel;
@property (strong, nonatomic) IBOutlet UILabel *towerStateLabel;
@property (strong, nonatomic) IBOutlet UILabel *lobbyLabel;
@property (strong,nonatomic) LiveMatch *liveMatch;
@end
