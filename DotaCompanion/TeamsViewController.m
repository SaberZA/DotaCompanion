//
//  TeamsViewController.m
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/16.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import "TeamsViewController.h"
#import "WikiViewController.h"
#import "ZHCustomSegue.h"
@interface TeamsViewController ()

@end

@implementation TeamsViewController
@synthesize currentUrlString = _currentUrlString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showWiki"]) {
        WikiViewController *wiki = (WikiViewController *)[[segue destinationViewController] topViewController];
        [wiki setUrl: self.currentUrlString];
        NSLog(@"Preparing for showWiki Segue");
    }
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
    
    
}

-(void)load3Point5InchScreen
{
    
    UIImageView *iGImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iG.png"]];    
    UIImageView *tongFuImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TongFu.png"]];
    UIImageView *orangeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Orange.png"]];
    UIImageView *allianceImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Alliance.png"]];
    UIImageView *fnaticImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Fnatic.png"]];
    UIImageView *liquidImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Liquid.png"]];
    UIImageView *naviImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NaVi.png"]];
    UIImageView *zenithImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Zenith.png"]];
    UIImageView *dignitasImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Dignitas.png"]];
    UIImageView *vpImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"VP.png"]];
    UIImageView *dkImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DK.png"]];
    UIImageView *lgdImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LGD.int.png"]];
    UIImageView *mufcImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MUFC.png"]];
    
    int buttonWidth = 54;
    int buttonHeight = 39;
    
    int yDiff = 178 - 129;
    int xDiff = 100 - 37;
        
//    UIButton *iGButton = [[UIButton alloc] initWithFrame:CGRectMake(37, 129, 54, 39)];
    UIButton *iGButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *tongFuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *orangeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *allianceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIButton *fnaticButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *liquidButton = [UIButton buttonWithType:UIButtonTypeCustom];;
    UIButton *naviButton = [UIButton buttonWithType:UIButtonTypeCustom];;
    UIButton *zenithButton = [UIButton buttonWithType:UIButtonTypeCustom];;
    
    UIButton *dignitasButton = [UIButton buttonWithType:UIButtonTypeCustom];;
    UIButton *virtusProButton = [UIButton buttonWithType:UIButtonTypeCustom];;
    UIButton *DKButton = [UIButton buttonWithType:UIButtonTypeCustom];;
    UIButton *LGDButton = [UIButton buttonWithType:UIButtonTypeCustom];;
    
    UIButton *mufcButton = [UIButton buttonWithType:UIButtonTypeCustom];;
    
    [iGButton setFrame:CGRectMake(37, 129, 54, 39)];
    [tongFuButton setFrame:CGRectMake(37 + xDiff, 129, buttonWidth, buttonHeight)];
    [orangeButton setFrame:CGRectMake(37 + xDiff*2, 129, buttonWidth, buttonHeight)];
    [allianceButton setFrame:CGRectMake(37 + xDiff*3, 129, buttonWidth, buttonHeight)];
    
    [fnaticButton setFrame:CGRectMake(37, 129 + yDiff, buttonWidth, buttonHeight)];
    [liquidButton setFrame:CGRectMake(37 + xDiff, 129 + yDiff, buttonWidth, buttonHeight)];
    [naviButton setFrame:CGRectMake(37 + xDiff*2, 129 + yDiff, buttonWidth, buttonHeight)];
    [zenithButton setFrame:CGRectMake(37 + xDiff*3, 129 + yDiff, buttonWidth, buttonHeight)];
    
    [dignitasButton setFrame:CGRectMake(37, 129 + yDiff*2, buttonWidth, buttonHeight)];
    [virtusProButton setFrame:CGRectMake(37 + xDiff, 129 + yDiff*2, buttonWidth, buttonHeight)];
    [DKButton setFrame:CGRectMake(37 + xDiff*2, 129 + yDiff*2, buttonWidth, buttonHeight)];
    [LGDButton setFrame:CGRectMake(37 + xDiff*3, 129 + yDiff*2, buttonWidth, buttonHeight)];
    
    [mufcButton setFrame:CGRectMake(37, 129 + yDiff*3, buttonWidth, buttonHeight)];
    
    [iGButton addTarget:self action:@selector(ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [tongFuButton addTarget:self action:@selector(ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [orangeButton addTarget:self action:@selector(ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [allianceButton addTarget:self action:@selector(ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [fnaticButton addTarget:self action:@selector(ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [liquidButton addTarget:self action:@selector(ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [naviButton addTarget:self action:@selector(ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [zenithButton addTarget:self action:@selector(ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [dignitasButton addTarget:self action:@selector(ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [virtusProButton addTarget:self action:@selector(ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [DKButton addTarget:self action:@selector(ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [LGDButton addTarget:self action:@selector(ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [mufcButton addTarget:self action:@selector(ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [iGButton setBackgroundImage:iGImageView.image forState:UIControlStateNormal];
    [tongFuButton setBackgroundImage:tongFuImageView.image forState:UIControlStateNormal];
    [orangeButton setBackgroundImage:orangeImageView.image forState:UIControlStateNormal];
    [allianceButton setBackgroundImage:allianceImageView.image forState:UIControlStateNormal];
    [fnaticButton setBackgroundImage:fnaticImageView.image forState:UIControlStateNormal];
    [liquidButton setBackgroundImage:liquidImageView.image forState:UIControlStateNormal];
    [naviButton setBackgroundImage:naviImageView.image forState:UIControlStateNormal];
    [zenithButton setBackgroundImage:zenithImageView.image forState:UIControlStateNormal];
    [dignitasButton setBackgroundImage:dignitasImageView.image forState:UIControlStateNormal];
    [virtusProButton setBackgroundImage:vpImageView.image forState:UIControlStateNormal];
    [DKButton setBackgroundImage:dkImageView.image forState:UIControlStateNormal];
    [LGDButton setBackgroundImage:lgdImageView.image forState:UIControlStateNormal];
    [mufcButton setBackgroundImage:mufcImageView.image forState:UIControlStateNormal];
    
    iGButton.tag = 1;
    tongFuButton.tag = 2;
    orangeButton.tag = 3;
    allianceButton.tag = 4;
    fnaticButton.tag = 5;
    liquidButton.tag = 6;
    naviButton.tag = 7;
    zenithButton.tag = 8;
    dignitasButton.tag = 9;
    virtusProButton.tag = 10;
    DKButton.tag = 11;
    LGDButton.tag = 12;
    mufcButton.tag = 13;
    
    UILabel *labelInfo = [[UILabel alloc] init];
    labelInfo.text = @"Tap any team logo to view their wiki";
    labelInfo.numberOfLines = 3;
    labelInfo.textAlignment = NSTextAlignmentCenter;
    labelInfo.frame = CGRectMake(82, 331, 157, 104);
    labelInfo.backgroundColor = [UIColor clearColor];
    
    NSArray *fonts  = [UIFont fontNamesForFamilyName:@"System"];
    NSLog(@"%@",fonts);
    labelInfo.font = [UIFont fontWithName:@"System" size:23.0];
    self.labelInfo.text = @"";
    
    [self.view addSubview:iGButton];
    [self.view addSubview:tongFuButton];
    [self.view addSubview:orangeButton];
    [self.view addSubview:allianceButton];
    [self.view addSubview:fnaticButton];
    [self.view addSubview:liquidButton];
    [self.view addSubview:naviButton];
    [self.view addSubview:zenithButton];
    [self.view addSubview:dignitasButton];
    [self.view addSubview:virtusProButton];
    [self.view addSubview:DKButton];
    [self.view addSubview:LGDButton];
    [self.view addSubview:mufcButton];
    
    [self.view addSubview:labelInfo];
    
    self.buttonIG.hidden = YES;
    self.buttonTongFu.hidden = YES;
    self.buttonOrange.hidden = YES;
    self.buttonAlliance.hidden = YES;
    self.buttonFnatic.hidden = YES;
    self.buttonLiquid.hidden = YES;
    self.buttonNavi.hidden = YES;
    self.buttonZenith.hidden = YES;
    self.buttonDignitas.hidden = YES;
    self.buttonVirtusPro.hidden = YES;
    self.buttonDK.hidden = YES;
    self.buttonLGD.hidden = YES;
    self.buttonMUFC.hidden = YES;
    
        
    
}

-(int)getSmallYCoOrd:(CGFloat)y
{
    //480
    //568
    double ratio = 480.0 / 568.0;
    return (int)(y * ratio);    
}

-(IBAction)ButtonTapped:(id)sender
{
    
        
    switch ([(UIImageView *)sender tag]) {
        case 1:
            //iG
            self.currentUrlString = @"http://www.dota2wiki.com/wiki/Invictus_Gaming";
            break;
        case 2:
            //TongFu
            
            self.currentUrlString = @"http://www.dota2wiki.com/wiki/TongFu";
            break;
        case 3:
            //Orange

            self.currentUrlString = @"http://www.dota2wiki.com/wiki/Neolution_Orange‎";
            break;
        case 4:
            //Alliance

            self.currentUrlString = @"http://www.dota2wiki.com/wiki/The_Alliance";
            break;
        case 5:
            //Fnatic

            self.currentUrlString = @"http://www.dota2wiki.com/wiki/Fnatic‎";
            break;
        case 6:
            //Liquid

            self.currentUrlString = @"http://www.dota2wiki.com/wiki/Team_Liquid";
            break;
        case 7:
            //NaVi

            self.currentUrlString = @"http://www.dota2wiki.com/wiki/Natus_Vincere";
            break;
        case 8:
            //Zenith

            self.currentUrlString = @"http://www.dota2wiki.com/wiki/Team_Zenith‎";
            break;
        case 9:
            //Dignitas

            self.currentUrlString = @"http://www.dota2wiki.com/wiki/Team_Dignitas‎";
            break;
        case 10:
            //VP

            self.currentUrlString = @"http://www.dota2wiki.com/wiki/Virtus_Pro";
            break;
        case 11:
            //DK

            self.currentUrlString = @"http://www.dota2wiki.com/wiki/DK";
            break;
        case 12:
            //LGD.int

            self.currentUrlString = @"http://www.dota2wiki.com/wiki/LGD_Gaming";
            break;
        case 13:
            //MUFC

            self.currentUrlString = @"http://www.dota2wiki.com/wiki/MUFC_eSports";
            break;
        default:
            self.currentUrlString = @"http://www.dota2wiki.com";
            break;
    }
    
    //ZHCustomSegue *wikiSegue = [[ZHCustomSegue alloc] initWithIdentifier:@"showWiki" source:self destination:wiki];
//    UIStoryboardSegue *wikiSegue = [[UIStoryboardSegue alloc] initWithIdentifier:@"showWiki" source:self destination:wiki];
    //[self prepareForSegue:wikiSegue sender:self];
    //[wikiSegue perform];
    [self performSegueWithIdentifier:@"showWiki" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)IGTapped:(id)sender {
}

- (IBAction)TongFuTapped:(id)sender {
}

- (IBAction)OrangeTapped:(id)sender {
}

- (IBAction)AllianceTapped:(id)sender {
}

- (IBAction)FnaticTapped:(id)sender {
}
@end
