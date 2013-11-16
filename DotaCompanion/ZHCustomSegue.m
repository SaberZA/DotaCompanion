//
//  ZHCustomSegue.m
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/16.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import "ZHCustomSegue.h"
#import "QuartzCore/QuartzCore.h"

@implementation ZHCustomSegue


-(void)perform {
    
    UIViewController *sourceViewController = (UIViewController*)[self sourceViewController];
    UIViewController *destinationController = (UIViewController*)[self destinationViewController];
    
    CATransition* transition = [CATransition animation];
    transition.duration = .25;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    transition.subtype = kCATransitionFromLeft; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    
    if ([self.identifier isEqualToString:@"showCover"]) {
        NSLog(@"showCover with Custom Segue");
        transition.subtype = kCATransitionFromLeft;
    }
    if ([self.identifier isEqualToString:@"showWiki"]) {
        NSLog(@"showWiki with Custom Segue");
        transition.subtype = kCATransitionFromBottom;
        
    }
    
    
    
    [sourceViewController.navigationController.view.layer addAnimation:transition
                                                                forKey:kCATransition];
    
    [sourceViewController.navigationController pushViewController:destinationController animated:NO];
    
}
@end
