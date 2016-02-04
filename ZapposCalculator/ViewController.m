//
//  ViewController.m
//  ZapposCalculator
//
//  Created by Yash Dalal on 2/4/16.
//  Copyright © 2016 Yash Dalal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
NSMutableString *x;
bool operatorPressed = NO;

- (void)viewDidLoad {
    [super viewDidLoad];
    x = [[NSMutableString alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)numberEntered:(id)sender{

    UIButton *button = (UIButton *)sender;
    //    NSString *buttonTitle = button.currentTitle;
    //    val1.text = buttonTitle;
    [x appendString: button.currentTitle] ;
    val1.text = x;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    NSLog(@"Button pressed: %@", [sender currentTitle]);
}


@end
