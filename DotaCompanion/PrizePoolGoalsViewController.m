//
//  PrizePoolGoalsViewController.m
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/16.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import "PrizePoolGoalsViewController.h"


@interface PrizePoolGoalsViewController ()

@end

@implementation PrizePoolGoalsViewController
@synthesize prizePool = _prizePool;

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
        if (!self.imageGoal3.image) {
            [self load4InchScreen];
        }    
    }
}

-(void)load4InchScreen
{
    UIImage *completedImage = [UIImage imageNamed:@"Completed.png"];
    
    self.imageGoal3.image = completedImage;
    self.imageGoal4.image = completedImage;
    self.imageGoal5.image = completedImage;
    self.imageGoal6.image = completedImage;
    self.imageGoal7.image = completedImage;
}

-(void)load3Point5InchScreen
{
    UIImage *completedImage = [UIImage imageNamed:@"Completed.png"];
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:completedImage];
    UIImageView *imageView4 = [[UIImageView alloc] initWithImage:completedImage];
    UIImageView *imageView5 = [[UIImageView alloc] initWithImage:completedImage];
    UIImageView *imageView6 = [[UIImageView alloc] initWithImage:completedImage];
    UIImageView *imageView7 = [[UIImageView alloc] initWithImage:completedImage];
        
    if (self.prizePool >= 2000000) {
        [self.view addSubview:imageView3];
    }
    if (self.prizePool >= 2200000) {
        [self.view addSubview:imageView4];
    }
    if (self.prizePool >= 2400000) {
        [self.view addSubview:imageView5];
    }
    if (self.prizePool >= 2600000) {
        [self.view addSubview:imageView6];
    }
    if (self.prizePool >= 3200000) {
        [self.view addSubview:imageView7];
    }       
    
    //imageGoal3
    imageView3.frame = CGRectMake(252, 138, 51, 37);
    
    //imageGoal4
    imageView4.frame = CGRectMake(252, 189, 51, 37);
    
    //imageGoal5
    imageView5.frame = CGRectMake(252, 240, 51, 37);
    
    //imageGoal6
    imageView6.frame = CGRectMake(252, 293, 51, 37);
    
    //imageGoal7
    imageView7.frame = CGRectMake(252, 435, 51, 37);
    
    self.imageGoal3.image = nil;
    self.imageGoal4.image = nil;
    self.imageGoal5.image = nil;
    self.imageGoal6.image = nil;
    self.imageGoal7.image = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
