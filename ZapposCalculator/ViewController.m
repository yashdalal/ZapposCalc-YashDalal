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
NSMutableString *firstNum;
NSMutableString *secondNum;

bool operatorPressed = NO;

- (void)viewDidLoad {
    [super viewDidLoad];
    firstNum = [[NSMutableString alloc]init];
    secondNum = [[NSMutableString alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)clearTextFields:(id)sender{
    
    val1.text=@"";
    val2.text=@"";
    sign.text=@"";
    ans.text=@"";
    [self resetValues];
}

- (void) resetValues{
    firstNum = [[NSMutableString alloc]init];
    secondNum = [[NSMutableString alloc]init];
    currentOperation = NONE;
    operatorPressed = NO;
}


-(IBAction)numberEntered:(id)sender{

    UIButton *button = (UIButton *)sender;
    if(!operatorPressed){
        [firstNum appendString: button.currentTitle] ;
        val1.text = firstNum;
    }else{
        [secondNum appendString: button.currentTitle] ;
        val2.text = secondNum;
    }
    
}

-(IBAction)addSelected:(id)sender{
    currentOperation=ADD;
    sign.text = @"+";
    operatorPressed = YES;
}

-(IBAction)subtractSelected:(id)sender{
    currentOperation=SUBTRACT;
    sign.text = @"-";
    operatorPressed = YES;
}

-(IBAction)multiplySelected:(id)sender{
    currentOperation=MULTIPLY;
    sign.text = @"x";
    operatorPressed = YES;
}

-(IBAction)divideSelected:(id)sender{
    currentOperation=DIVIDE;
    sign.text = @"/";
    operatorPressed = YES;
}

-(IBAction)calculate:(id)sender{
    double int1 = [firstNum doubleValue];
    double int2 = [secondNum doubleValue];
    double answer = 0.0;
    
    switch (currentOperation){
        case NONE:
            answer = [firstNum intValue];
            //add message here
            break;
        case ADD:
            answer = int1 + int2;
            break;
        case SUBTRACT:
            answer = int1 - int2;
            break;
        case MULTIPLY:
            answer = int1 * int2;
            break;
        case DIVIDE:
            if(int2==0){
                ans.text = [NSString stringWithFormat: @"Not Defined"];
            }else{
                answer = int1 / int2;
            }
            break;
    }
    

    if([ans.text isEqualToString:@""])
        ans.text = [NSString stringWithFormat: @"%g",answer];
    [self resetValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    NSLog(@"Button pressed: %@", [sender currentTitle]);
}


@end
