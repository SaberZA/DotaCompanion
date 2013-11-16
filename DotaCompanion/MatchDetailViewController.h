//
//  MatchDetailViewController.h
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/18.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpcomingMatch.h"

@interface MatchDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *team1Label;
@property (strong, nonatomic) IBOutlet UILabel *team2Label;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *tournamentUrlLabel;
@property (strong, nonatomic) IBOutlet UISwitch *notificationSwitch;
- (IBAction)notificationChanged:(UISwitch *)sender;
- (IBAction)tournamentButtonTapped:(UIButton *)sender;
@property (strong,nonatomic) NSString *team1;
@property (strong,nonatomic) NSString *team2;
@property (strong,nonatomic) NSString *time;
@property (strong,nonatomic) NSString *tournamentUrl;
@property (assign,nonatomic) BOOL notificationOn;
@property (strong,nonatomic) UpcomingMatch *match;
@end
