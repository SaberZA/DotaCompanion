//
//  LiveMatchesViewController.m
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/18.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import "LiveMatchesViewController.h"
#import "Constants.h"
#import "LiveMatch.h"
#import "LiveMatchTeamsViewController.h"
#import "LiveMatchCastersViewController.h"
#import "LiveMatchInfoViewController.h"

@interface LiveMatchesViewController ()

@end

@implementation LiveMatchesViewController
@synthesize objects = _objects;


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showTeamDetails"]) {
//        LiveMatchesDetailViewController *liveMatchDetailController = [segue destinationViewController];
        UITabBarController *tabController = (UITabBarController *)[segue destinationViewController];
        LiveMatchTeamsViewController *teamsController = (LiveMatchTeamsViewController *)[tabController.childViewControllers objectAtIndex:0];
        LiveMatchCastersViewController *castersController = (LiveMatchCastersViewController *)[tabController.childViewControllers objectAtIndex:1];
        LiveMatchInfoViewController *infoController = (LiveMatchInfoViewController *)[tabController.childViewControllers objectAtIndex:2];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        teamsController.liveMatch = [_objects objectAtIndex:indexPath.row];
        castersController.liveMatch = [_objects objectAtIndex:indexPath.row];
        infoController.liveMatch = [_objects objectAtIndex:indexPath.row];
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    [self loadLiveMatches];
}

-(void)loadLiveMatches
{
    //NSString *appKey = APP_KEY;
//    NSString *urlString = @"http://192.168.0.10/liveMatch.json";
    NSString *urlString = [NSString stringWithFormat:@"https://api.steampowered.com/IDOTA2Match_570/GetLiveLeagueGames/v0001/?key=%@",APP_KEY];
    NSURL *blogURl = [NSURL URLWithString:urlString];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURl];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    //NSLog(@"%@",dataDictionary);
    
    
    NSDictionary *resultDictionary = [dataDictionary objectForKey:@"result"];

    if (resultDictionary.count < 1) {
        NSLog(@"No result data");
        return;
    }
    //NSLog(@"%@",resultDictionary);
    
    
    NSArray *gamesArray = [resultDictionary objectForKey:@"games"];
    
    NSMutableArray *liveGames = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSDictionary *game in gamesArray) {
//        NSLog(@"%@",[obj objectForKey:@"dire_team"]);
//        NSLog(@"%@",[obj objectForKey:@"spectators"]);
        LiveMatch *liveMatch = [[LiveMatch alloc] init];
        NSDictionary *direTeamDictionary = [game objectForKey:@"dire_team"];
        NSDictionary *radiantTeamDictionary = [game objectForKey:@"radiant_team"];
        NSArray *playerDicts = [game objectForKey:@"players"];
        liveMatch.spectators = [[game objectForKey:@"spectators"] intValue];
        liveMatch.lobbyId = [game objectForKey:@"lobby_id"];
        liveMatch.towerState = [game objectForKey:@"tower_state"];
        liveMatch.leagueId = [game objectForKey:@"league_id"];
        
        LiveTeam *radiantTeam = [[LiveTeam alloc] init];
        radiantTeam.teamName = [radiantTeamDictionary objectForKey:@"team_name"];
        radiantTeam.teamId = [radiantTeamDictionary objectForKey:@"team_id"];
        radiantTeam.teamLogo = [radiantTeamDictionary objectForKey:@"team_logo"];
        radiantTeam.complete = [radiantTeamDictionary objectForKey:@"complete"];
        
        LiveTeam *direTeam = [[LiveTeam alloc] init];
        direTeam.teamName = [direTeamDictionary objectForKey:@"team_name"];
        direTeam.teamId = [direTeamDictionary objectForKey:@"team_id"];
        direTeam.teamLogo = [direTeamDictionary objectForKey:@"team_logo"];
        direTeam.complete = [direTeamDictionary objectForKey:@"complete"];
        
        liveMatch.radiantTeam = radiantTeam;
        liveMatch.direTeam = direTeam;
        
        NSMutableArray *players = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *playerDict in playerDicts) {
            LivePlayer *player = [[LivePlayer alloc] init];
            player.accountId = [playerDict objectForKey:@"account_id"];
            player.name = [playerDict objectForKey:@"name"];
            player.heroId = [playerDict objectForKey:@"hero_id"];
            player.team = [[playerDict objectForKey:@"team"] intValue];
            [players addObject:player];
        }
        liveMatch.players = players;
        [liveGames addObject:liveMatch];
    }
    
    _objects = liveGames;
    
//    for (NSDictionary *temp in resultDictionary) {
//        NSLog(@"%@",temp);
//        
//    }
//
//    for (NSString *key in []) {
//        <#statements#>
//    }
    
    //NSDictionary *gamesDictionary = [resultArray objectAtIndex:0];
    //NSDictionary *gamesArray = [dataDictionary objectForKey:@"games"];
//    for (NSString *temp in gamesArray) {
//        NSLog(@"%@",temp);
//    }
    //NSLog(@"%@",gamesDictionary);
    
//    NSArray *gamesArray = [resultArray objectAtIndex:0];
//    
//    for (NSDictionary *gameDictionary in gamesArray) {
////        BlogPost *blogPost = [BlogPost blogPostWithTitle: [bpDictionary objectForKey:@"title"]];
////        blogPost.author = [bpDictionary objectForKey:@"author"];
////        [self.blogPosts addObject:blogPost];
//        NSLog(@"%@",[gameDictionary objectForKey:@"lobby_id"]);
//    }

    
    //self.prizePool = [[dataDictionary objectForKey:@"dollars"] intValue];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    LiveMatch *liveMatch = [_objects objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ vs %@",liveMatch.radiantTeam.teamName,liveMatch.direTeam.teamName];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
