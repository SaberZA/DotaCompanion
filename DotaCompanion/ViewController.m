//
//  ViewController.m
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/16.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Segue Executed");
    if ([segue.identifier isEqualToString:@"showIntro"]) {
        NSLog(@"showIntro Segue");
    }
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipeIntro:(UISwipeGestureRecognizer *)sender {
    NSLog(@"Gesture recognised: Swipe for Intro");
}
@end
