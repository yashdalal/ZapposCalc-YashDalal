//
//  HomeViewController.m
//  ZapposCalculator
//
//  Created by Yash Dalal on 2/8/16.
//  Copyright © 2016 Yash Dalal. All rights reserved.
//

#import "HomeViewController.h"
#import "ViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

BOOL blinkStatus = NO;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ label1.alpha = 1;}
                     completion:nil];
    
    [UIView animateWithDuration:1 delay:3 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ label2.alpha = 1;}
                     completion:nil];
    
    [UIView animateWithDuration:1 delay:5 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ label3.alpha = 1;}
                     completion:nil];
    
    [UIView animateWithDuration:1 delay:7 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ label4.alpha = 1;}
                     completion:nil];
    
    [UIView animateWithDuration:1 delay:9 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ label5.alpha = 1;}
                     completion:nil];
    
    [UIView animateWithDuration:1 delay:11 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ label6.alpha = 1;}
                     completion:nil];
    [UIView animateWithDuration:1 delay:13 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ label7.alpha = 1;}
                     completion:nil];
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 13 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)(1.0) target:self selector:@selector(blink) userInfo:nil repeats:TRUE];
        });
}



-(void)blink{
    if(blinkStatus == NO){
    
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn
                         animations:^{ label7.alpha = 1;}
                         completion:nil];
        blinkStatus = YES;
    }else {
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn
                         animations:^{ label7.alpha = 0.2;}
                         completion:nil];
        blinkStatus = NO;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
