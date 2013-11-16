//
//  PrizePoolProgressViewController.h
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/16.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrizePoolProgressViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageBar;
@property (strong, nonatomic) IBOutlet UILabel *labelPrizePool;
@property (assign,nonatomic) int prizePool;
@end
