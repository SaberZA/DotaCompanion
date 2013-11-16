//
//  UpcomingMatchesViewController.h
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/18.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpcomingMatch.h"

@interface UpcomingMatchesViewController : UITableViewController
@property (strong,nonatomic) NSMutableArray *objects;
@property (strong,nonatomic) UpcomingMatch *selectedMatch;
@end
