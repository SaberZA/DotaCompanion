//
//  MatchDetailViewController.m
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/18.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import "MatchDetailViewController.h"
#import "WikiViewController.h"

@interface MatchDetailViewController ()

@end

@implementation MatchDetailViewController
@synthesize team1 = _team1;
@synthesize team2 = _team2;
@synthesize time = _time;
@synthesize tournamentUrl = _tournamentUrl;
@synthesize notificationOn = _notificationOn;
@synthesize match = _match;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showMatchUrl"]) {
        WikiViewController *webView = (WikiViewController *)[ [segue destinationViewController] topViewController];
        NSString *matchPage = [NSString stringWithFormat:@"http://www.gosugamers.net%@",_match.tournamentUrl];
        
        [webView setUrl:matchPage];
    }
}

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
	// Do any additional setup after loading the view.
    [self loadLabels];
    [self loadNotificationSwitch];
    
}

-(void)loadNotificationSwitch
{
    if ([self.match.time isEqualToString:@"LIVE"]) {
        //self.notificationSwitch.enabled = NO;
        [self.notificationSwitch setOn:NO animated:YES];
        return;
    }
    
    NSArray *notificationArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
    for (UILocalNotification *notification in notificationArray) {
        if([notification.alertBody isEqualToString:self.match.title])
        {
            //self.notificationSwitch.enabled = YES;
            [self.notificationSwitch setOn:YES animated:YES];
        }
    }
}

-(void)loadLabels
{
    self.team1Label.text = self.match.team1;
    self.team2Label.text = self.match.team2;
    self.timeLabel.text = self.match.time;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scheduleNotification
{
    //[eventText resignFirstResponder];
    NSString *time = self.match.time;
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    // Get the current date
    //NSDate *pickerDate = [self.datePicker date];
    
    int days = 0;
    int hours = 0;
    int minutes = 0;
    
    if (![time isEqualToString:@"LIVE"])
    {
        if ([time rangeOfString:@"d"].location != NSNotFound)
        {
            NSRange daysRange = NSMakeRange([time rangeOfString:@"d"].location - 2, 2);
            days = [[[time substringWithRange:daysRange] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] intValue];
        }
        
        if ([time rangeOfString:@"h"].location != NSNotFound)
        {
            NSRange hoursRange = NSMakeRange([time rangeOfString:@"h"].location - 2, 2);
            hours = [[[time substringWithRange:hoursRange] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] intValue] ;
        }
        
        if ([time rangeOfString:@"m"].location != NSNotFound)
        {
            NSRange minutesRange = NSMakeRange([time rangeOfString:@"m"].location - 2, 2);
            minutes = [[[time substringWithRange:minutesRange] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] intValue] ;
        }               
    }
    else
    {
        return;
    }
    NSLog(@"days: %i",days);
    NSLog(@"hours: %i",hours);
    NSLog(@"minutes: %i",minutes);
    
//    days = 0;
//    hours = 0;
//    minutes = 1;
    
    NSDate *gameDate = [NSDate dateWithTimeIntervalSinceNow:(days*24.0*60.0*60.0 + hours*60.0*60.0 + minutes*60.0)];
    // Break the date up into components
    NSDateComponents *dateComponents = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit )
												   fromDate:gameDate];
    NSDateComponents *timeComponents = [calendar components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit )
												   fromDate:gameDate];
    // Set up the fire time
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setDay:[dateComponents day]];
    [dateComps setMonth:[dateComponents month]];
    [dateComps setYear:[dateComponents year]];
    [dateComps setHour:[timeComponents hour]];
	// Notification will fire in one minute
    [dateComps setMinute:[timeComponents minute]];
	[dateComps setSecond:[timeComponents second]];
    NSDate *itemDate = [calendar dateFromComponents:dateComps];
    //[dateComps release];
    
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    localNotif.fireDate = itemDate;
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
    
	// Notification details
    localNotif.alertBody = self.match.title;
	// Set the action button
    localNotif.alertAction = @"View";
    
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    localNotif.applicationIconBadgeNumber = 1;
    
	// Specify custom data for the notification
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:self.match.title forKey:@"title"];
    localNotif.userInfo = infoDict;
    
	// Schedule the notification
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    //[localNotif release];
    
	//[self.tableview reloadData];
}

-(void)removeNotification
{
    NSArray *notificationArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
    for (UILocalNotification *localNotif in notificationArray) {
        if ([localNotif.alertBody isEqualToString:self.match.title]) {
            [[UIApplication sharedApplication] cancelLocalNotification:localNotif];
        }
    }    
}

- (IBAction)notificationChanged:(UISwitch *)sender
{
    BOOL state = sender.on;
    
    if (state == YES) {
        NSLog(@"notification enabled");
        [self scheduleNotification];
    }
    else
    {
        NSLog(@"notification disabled");
        [self removeNotification];
    }
}

- (IBAction)tournamentButtonTapped:(UIButton *)sender {
}
@end
