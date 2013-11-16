//
//  TeamsViewController.h
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/16.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamsViewController : UIViewController
@property (strong,nonatomic) NSString *currentUrlString;
@property (strong, nonatomic) IBOutlet UIButton *buttonIG;
@property (strong, nonatomic) IBOutlet UIButton *buttonTongFu;
@property (strong, nonatomic) IBOutlet UIButton *buttonOrange;
@property (strong, nonatomic) IBOutlet UIButton *buttonAlliance;
@property (strong, nonatomic) IBOutlet UIButton *buttonFnatic;
@property (strong, nonatomic) IBOutlet UIButton *buttonLiquid;
@property (strong, nonatomic) IBOutlet UIButton *buttonNavi;
@property (strong, nonatomic) IBOutlet UIButton *buttonZenith;
@property (strong, nonatomic) IBOutlet UIButton *buttonDignitas;
@property (strong, nonatomic) IBOutlet UIButton *buttonVirtusPro;
@property (strong, nonatomic) IBOutlet UIButton *buttonDK;
@property (strong, nonatomic) IBOutlet UIButton *buttonLGD;
@property (strong, nonatomic) IBOutlet UIButton *buttonMUFC;
@property (strong, nonatomic) IBOutlet UILabel *labelInfo;

-(IBAction)ButtonTapped:(id)sender;
-(int)getSmallYCoOrd:(CGFloat)y;

@end
