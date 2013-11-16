//
//  LiveMatchesDetailViewController.h
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/19.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiveMatch.h"
#import "DireTableView.h"
#import "RadiantTableView.h"

@interface LiveMatchesDetailViewController : UIViewController <UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *player1Radiant;
@property (strong, nonatomic) IBOutlet UILabel *player2Radiant;
@property (strong, nonatomic) IBOutlet UILabel *player3Radiant;
@property (strong, nonatomic) IBOutlet UILabel *player4Radiant;
@property (strong, nonatomic) IBOutlet UILabel *player5Radiant;

@property (strong, nonatomic) IBOutlet UILabel *player1Dire;
@property (strong, nonatomic) IBOutlet UILabel *player2Dire;
@property (strong, nonatomic) IBOutlet UILabel *player3Dire;
@property (strong, nonatomic) IBOutlet UILabel *player4Dire;
@property (strong, nonatomic) IBOutlet UILabel *player5Dire;


@property (strong,nonatomic) LiveMatch *liveMatch;
@end
