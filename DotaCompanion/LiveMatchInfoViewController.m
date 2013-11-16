//
//  LiveMatchInfoViewController.m
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/20.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import "LiveMatchInfoViewController.h"

@interface LiveMatchInfoViewController ()

@end

@implementation LiveMatchInfoViewController
@synthesize liveMatch = _liveMatch;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Match info did load");
	// Do any additional setup after loading the view.
    [self loadInfoLabels];
}

-(void)loadInfoLabels
{
    self.leagueLabel.text = [NSString stringWithFormat:@"%@",self.liveMatch.leagueId];
    self.spectatorsLabel.text = [NSString  stringWithFormat:@"%i", self.liveMatch.spectators];
    self.towerStateLabel.text = [NSString stringWithFormat:@"%@",self.liveMatch.towerState];
    self.lobbyLabel.text = [NSString stringWithFormat:@"%@",self.liveMatch.lobbyId];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
