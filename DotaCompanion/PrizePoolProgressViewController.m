//
//  PrizePoolProgressViewController.m
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/16.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import "PrizePoolProgressViewController.h"
#import "PrizePoolGoalsViewController.h"
@interface PrizePoolProgressViewController ()

@end

@implementation PrizePoolProgressViewController
@synthesize prizePool = _prizePool;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showPrizePoolGoals"]) {
        PrizePoolGoalsViewController *goalController = [segue destinationViewController];
        goalController.prizePool = self.prizePool;
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
    int height = [[UIScreen mainScreen] bounds].size.height;
    
    if (height <= 480) {
        [self load3Point5InchScreen];
    }
    else
    {
        //[self load4InchScreen];
    }
    
    [self loadPrizePool];
    [self adjustProgressBar];
    //[self setProgressLabels];
}


-(void)adjustProgressBar
{
    double maxPrizePool = 3200000.0;
    double minPrizePool = 1600000.0;
    
    double maxBarWidth = 240.0;
    
    
    double prizePoolAmount = (double)self.prizePool;
    
    double ratio = maxBarWidth / (maxPrizePool - minPrizePool);
    
    
    double barWidth = (prizePoolAmount - minPrizePool) * ratio;
    
    
    CGRect frame = [self.imageBar frame];
    
    frame.size.width = (barWidth);
    [self.imageBar setFrame:frame];
    
    
    
    
    
}

-(void)load3Point5InchScreen
{
    UILabel *labelPrizePoolSmall = [self create3Point5InchLabel];
    [self.view addSubview:labelPrizePoolSmall];
    
    UIImageView *imageBar = [self create3Point5InchProgressBar];
    [self.view addSubview:imageBar];
    
    self.labelPrizePool.text = nil;
    self.labelPrizePool = labelPrizePoolSmall;
    
    self.imageBar.image = nil;
    self.imageBar = imageBar;
}

-(UIImageView *)create3Point5InchProgressBar
{
    UIImage *bar = [UIImage imageNamed:@"GlossyBar.png"];
    UIImageView *imageBar = [[UIImageView alloc] initWithImage:bar];
    imageBar.frame = CGRectMake(41, 248, 240, 17);
    return imageBar;
}

-(UILabel *)create3Point5InchLabel
{
    UILabel *labelPrizePoolSmall = [[UILabel alloc] initWithFrame:CGRectMake(90, 178, 142, 37)];
    //self.labelPrizePool.frame = CGRectMake(89, 71, 142, 37);
    labelPrizePoolSmall.backgroundColor = [UIColor clearColor];
    labelPrizePoolSmall.font = [UIFont fontWithName:@"Times New Roman" size:31];
    labelPrizePoolSmall.textColor = [UIColor colorWithRed:53.0/255.0 green:106.0/255.0 blue:89.0/255.0 alpha:1.0];
    
    return labelPrizePoolSmall;
}


-(void)load4InchScreen
{
    //self.labelPrizePool.frame = CGRectMake(89, 88, 142, 37);
}

-(void)loadPrizePool
{
    NSURL *blogURl = [NSURL URLWithString:@"http://www.dota2.com/jsfeed/intlprizepool"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURl];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    //NSLog(@"%@",dataDictionary);
        
    self.prizePool = [[dataDictionary objectForKey:@"dollars"] intValue];
    NSLog(@"%i",self.prizePool);
    int millions = (int)self.prizePool/1000000;
    int hundredThousands = (int)(self.prizePool - millions*1000000)/1000;
    int thousands = (int)(self.prizePool - (millions*1000000 + hundredThousands*1000));
    NSLog(@"%i",millions);
    NSLog(@"%i",hundredThousands);
    NSLog(@"%i",thousands);
    NSString *prizePoolString = [NSString stringWithFormat:@"$%i,%03i,%03i",millions,hundredThousands,thousands];
    //self.labelPrizePool.textColor = [UIColor colorWithRed:0 green:102 blue:102 alpha:1.0];
    self.labelPrizePool.text = prizePoolString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
