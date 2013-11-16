//
//  LiveMatchesDetailViewController.m
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/19.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import "LiveMatchesDetailViewController.h"

@interface LiveMatchesDetailViewController ()

@end

@implementation LiveMatchesDetailViewController
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
	// Do any additional setup after loading the view.
    
    [self loadTeamTableViews];
}

-(void)loadTeamTableViews
{
    
    
    
}

#pragma mark -
#pragma mark Radiant Team Table View Delegate Methods
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{    
//    // Return the number of sections.
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    if (tableView == self.radiantTableView)
//    {
//        return [self.liveMatch getRadiantPlayers].count;
//    }
//    else
//    {
//        return [self.liveMatch getDirePlayers].count;
//    }
//    
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...    
//    if (tableView == self.radiantTableView)
//    {
//        cell.textLabel.text = [[self.liveMatch getRadiantPlayers] objectAtIndex:indexPath.row];        
//    }
//    else
//    {
//        cell.textLabel.text = [[self.liveMatch getDirePlayers] objectAtIndex:indexPath.row];
//    }
//    return cell;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Navigation logic may go here. Create and push another view controller.
//    /*
//     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
//     // ...
//     // Pass the selected object to the new view controller.
//     [self.navigationController pushViewController:detailViewController animated:YES];
//     */   
//    
//}


#pragma mark -
#pragma mark Dire Team Table View Delegate Methods



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
