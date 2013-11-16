//
//  TableOfContentsViewController.m
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/18.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import "TableOfContentsViewController.h"
#import "TOCElement.h"
#import "TOCCell.h"
#import "LiveMatch.h"
#import "Constants.h"
#import "LiveMatchesViewController.h"

@interface TableOfContentsViewController ()

@end

@implementation TableOfContentsViewController
@synthesize objects = _objects;
@synthesize liveMatches = _liveMatches;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showLiveLeagueMatches"]) {
        LiveMatchesViewController *liveMatchController = (LiveMatchesViewController *)[segue destinationViewController];
        liveMatchController.objects = self.liveMatches;
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



-(void)loadTOC
{
    NSMutableArray *elements = [[NSMutableArray alloc] initWithCapacity:0];
    
    TOCElement *prizePoolElement = [[TOCElement alloc] init];
    prizePoolElement.title = @"T.I. 3 Prize Pool";
    prizePoolElement.identifier = @"prizePool";
    
    TOCElement *upcomingMatches = [[TOCElement alloc] init];
    upcomingMatches.title = @"Upcoming Dota 2 Matches";
    upcomingMatches.identifier = @"upcomingMatches";
    
//    TOCElement *dotaLeagues = [[TOCElement alloc] init];
//    dotaLeagues.title = @"Dota 2 Leagues";
//    dotaLeagues.identifier = @"dotaLeagues";
    
    TOCElement *liveLeagueMatches = [[TOCElement alloc] init];
    liveLeagueMatches.title = @"Live League Matches";
    liveLeagueMatches.identifier = @"liveMatches";
        
    [elements addObject:prizePoolElement];
    [elements addObject:upcomingMatches];
//    [elements addObject:dotaLeagues];
    [elements addObject:liveLeagueMatches];
    
    _objects = elements;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear fired");
    //[self loadLiveMatches];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewLoadMethod fired");
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self loadTOC];
    

}


-(void)loadLiveMatches
{
    //NSString *appKey = APP_KEY;
//    NSString *urlString = @"http://192.168.0.10/liveMatch.json";
    NSString *urlString = [NSString stringWithFormat:@"https://api.steampowered.com/IDOTA2Match_570/GetLiveLeagueGames/v0001/?key=%@",APP_KEY];
    NSURL *blogURl = [NSURL URLWithString:urlString];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURl];
    
    NSError *error = nil;
    
    if(jsonData == nil)
    {
        NSLog(@"No result data");
        return;
    }
    
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
    
    self.liveMatches = liveGames;
    
}

-(void)loadLiveImage
{
    for (TOCElement *element in _objects) {
        if ([element.identifier isEqualToString:@"liveMatches"]) {
            
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TOCCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    TOCElement *element = [_objects objectAtIndex:indexPath.row];
    cell.textLabel.text = element.title;
    
    if ([element.identifier isEqualToString:@"liveMatches"]) {
        if (self.liveMatches.count > 0) {
            cell.imageView.image = [UIImage imageNamed:@"Live.png"];
        }
        else
        {
            cell.imageView.image = nil;
        }
        
    }
    
    //cell.identifier = element.identifier;
    
    //
    
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
    
    TOCElement *element = [_objects objectAtIndex:indexPath.row];
    if ([element.identifier isEqualToString:@"prizePool"]) {
        [self performSegueWithIdentifier:@"showPrizePoolProgress" sender:self];
    }
    else if ([element.identifier isEqualToString:@"upcomingMatches"]) {
        [self performSegueWithIdentifier:@"showUpcomingMatches" sender:self];
    }
    else if ([element.identifier isEqualToString:@"liveMatches"]) {
        [self loadLiveMatches];
        [self performSegueWithIdentifier:@"showLiveLeagueMatches" sender:self];
    }
    
}

@end
