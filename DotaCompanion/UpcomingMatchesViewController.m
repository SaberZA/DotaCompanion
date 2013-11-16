//
//  UpcomingMatchesViewController.m
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/18.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import "UpcomingMatchesViewController.h"
#import "TFHpple.h"
#import "UpcomingMatch.h"
#import "MatchDetailViewController.h"
@interface UpcomingMatchesViewController ()

@end

@implementation UpcomingMatchesViewController
@synthesize objects = _objects;
@synthesize selectedMatch = _selectedMatch;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showMatchDetails"]) {
        MatchDetailViewController *mdc = (MatchDetailViewController *) [segue destinationViewController];
//        mdc.team1 = _selectedMatch.team1;
//        mdc.team2 = _selectedMatch.team2;
//        mdc.time = _selectedMatch.time;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [mdc setMatch: [_objects objectAtIndex:indexPath.row]];
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
    
    [self loadUpcomingMatches];
}

-(void)loadUpcomingMatches
{
    NSURL *dotaUrl = [NSURL URLWithString:@"http://www.gosugamers.net/dota2"];
    NSData *dotaHtmlData = [NSData dataWithContentsOfURL:dotaUrl];
    
    TFHpple *dotaParser = [TFHpple hppleWithHTMLData:dotaHtmlData];
    
    NSString *dotaXPathQueryString = @"//table[@id='gb-matches']/tbody/tr/td/a/span[@class='opp']/span";
    NSString *dotaTimeXPathQueryString = @"//table[@id='gb-matches']/tbody/tr/td[@class='status']/span[@class='live-in']";
    NSString *dotaLinksXPathQueryString = @"//table[@id='gb-matches']/tbody/tr/td/a[@class='match']";
    
    NSArray *dotaNodes = [dotaParser searchWithXPathQuery:dotaXPathQueryString];
    NSArray *dotaTimeNodes = [dotaParser searchWithXPathQuery:dotaTimeXPathQueryString];
    NSArray *dotaLinksNodes = [dotaParser searchWithXPathQuery:dotaLinksXPathQueryString];
    
    if (dotaNodes.count < 1 || dotaTimeNodes.count < 1) {
        return;
    }
    
    //NSLog(@"%@",dotaNodes);
    NSMutableArray *newMatches = [[NSMutableArray alloc] initWithCapacity:0];
    //NSMutableArray *newMatchTimes = [[NSMutableArray alloc] initWithCapacity:0];
//    int count = 0;
//    for (TFHppleElement *element in dotaNodes) {
//        UpcomingMatch *match = [[UpcomingMatch alloc] init];
//        NSLog(@"%@",[[element firstChild] content]);
//    }
    

    int count = 1;
    for (int i =0; i<dotaNodes.count-1; i+=2) {
        UpcomingMatch *match = [[UpcomingMatch alloc] init];
        NSString *team1 = [[(TFHppleElement *)[dotaNodes objectAtIndex:i] firstChild] content];
        NSString *team2 = [[(TFHppleElement *)[dotaNodes objectAtIndex:i+1] firstChild] content];
        
        match.title = [NSString stringWithFormat:@"%@ vs %@",team1,team2];
        match.team1 = team1;
        match.team2 = team2;

        [newMatches addObject:match];
//        NSLog(@"Game %i:",count);
//        NSLog(@"Team 1: %@",team1);
//        NSLog(@"Team 2: %@",team2);
        count++;
    }
    
    int nonLiveMatchesCount = (newMatches.count-dotaTimeNodes.count);
    
    //NSLog(@"%@",dotaLinksNodes);
    for (int i=nonLiveMatchesCount; i<newMatches.count; i++) {
        TFHppleElement *element = (TFHppleElement *)[dotaTimeNodes objectAtIndex:i-nonLiveMatchesCount];
        UpcomingMatch *match = [newMatches objectAtIndex:i];
        match.time = [[element firstChild] content];  
        
        match.tournamentUrl = [[(TFHppleElement *)[dotaLinksNodes objectAtIndex:i] attributes] objectForKey:@"href"];
//        NSLog(@"%@",match.tournamentUrl);
    }
    
    for (int i=0; i<nonLiveMatchesCount; i++) {
        UpcomingMatch *match = [newMatches objectAtIndex:i];
        match.time = @"LIVE";
        match.tournamentUrl = [[(TFHppleElement *)[dotaLinksNodes objectAtIndex:i] attributes] objectForKey:@"href"];
//        NSLog(@"%@",match.tournamentUrl);
    }
    
    //int countElements = 0;
//    for (TFHppleElement *element in dotaLinksNodes) {
//        UpcomingMatch *match = [newMatches objectAtIndex:countElements];
//        NSLog(@"%@",[[element attributes] allKeys]);
//        match.tournamentUrl = (NSString *)[[element attributes]  objectForKey:@"href"];
//        
//        
//        countElements++;
//    }
    
//    for (UpcomingMatch *match in newMatches) {
//        NSLog(@"Title: %@ -- Time:%@",match.title,match.time);
//    }
    
    _objects = newMatches;
    [self.tableView reloadData];

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    UpcomingMatch *match = [_objects objectAtIndex:indexPath.row];
    cell.textLabel.text = match.title;
    cell.detailTextLabel.text = match.time;
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
    _selectedMatch = [_objects objectAtIndex:indexPath.row];
}

@end
