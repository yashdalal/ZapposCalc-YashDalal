//
//  ViewController.m
//  ZapposCalculator
//
//  Created by Yash Dalal on 2/4/16.
//  Copyright © 2016 Yash Dalal. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController (){
    AVAudioPlayer *_audioPlayer;
}

@end

@implementation ViewController
NSMutableString *firstNum;
NSMutableString *secondNum;

bool operatorPressed = NO;
bool firstClick = YES;
bool evaluated = NO;

- (void)viewDidLoad {
    [super viewDidLoad];
    firstNum = [[NSMutableString alloc]init];
    secondNum = [[NSMutableString alloc]init];
    UIGraphicsBeginImageContext(bgview.frame.size);
    [[UIImage imageNamed:@"adele1.jpg"] drawInRect:bgview.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    bgview.backgroundColor = [UIColor colorWithPatternImage:image];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"hello" ofType:@"mp3"];
    NSURL *soundFile = [NSURL fileURLWithPath:path];
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFile error:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)clearTextFields:(id)sender{
    val1.text=@"";
    ans.text=@"";
    [self resetValues];
}

- (void) resetValues{
    firstNum = [[NSMutableString alloc]init];
    secondNum = [[NSMutableString alloc]init];
    currentOperation = NONE;
    operatorPressed = NO;
    firstClick = YES;
}


-(IBAction)numberEntered:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    
    [self firstClickReset];
    
    if(!operatorPressed){
        [firstNum appendString: button.currentTitle] ;
        val1.text = firstNum;
    }else{
        [secondNum appendString: button.currentTitle] ;
        val1.text = secondNum;
    }
    
}

-(void) firstClickReset{
    if(firstClick){
        [self resetValues];
        val1.text=@"";
        ans.text=@"";
        firstClick = NO;
    }
}

-(IBAction)delete:(id)sender{
    if(!operatorPressed){
        firstNum = [self deleteLastChar:firstNum];
        val1.text = firstNum;
    }else{
        secondNum = [self deleteLastChar:secondNum];
        val1.text = secondNum;
    }
}

-(NSMutableString*)deleteLastChar: (NSMutableString*)currentNum{
    if ([currentNum length] > 0) {
        NSRange range = NSMakeRange([currentNum length]-1,1);
        [currentNum replaceCharactersInRange:range withString:@""];
    }
    return currentNum;
}

-(IBAction)addSelected:(id)sender{
    if(operatorPressed){
        [self evaluate];
    }
    currentOperation=ADD;
    ans.text = [NSString stringWithFormat:@"%@ + ", firstNum];
    val1.text = @"";
    operatorPressed = YES;
}

-(IBAction)subtractSelected:(id)sender{
    if(operatorPressed){
        [self evaluate];
    }
    
    if([val1.text isEqualToString: @""]){
        [self firstClickReset];
        if(!operatorPressed){
            [firstNum appendString: @"-"] ;
            val1.text = firstNum;
        }else{
            [secondNum appendString: @"-"] ;
            val1.text = secondNum;
        }
    }else{
        currentOperation=SUBTRACT;
        ans.text = [NSString stringWithFormat:@"%@ - ", val1.text];
        val1.text = @"";
        operatorPressed = YES;
    }
}

-(IBAction)multiplySelected:(id)sender{
    if(operatorPressed){
        [self evaluate];
    }
    currentOperation=MULTIPLY;
    ans.text = [NSString stringWithFormat:@"%@ × ", val1.text];
    val1.text = @"";
    operatorPressed = YES;
}

-(IBAction)divideSelected:(id)sender{
    if(operatorPressed){
        [self evaluate];
    }
    currentOperation=DIVIDE;
    ans.text = [NSString stringWithFormat:@"%@ / ", val1.text];
    val1.text = @"";
    operatorPressed = YES;
}

-(IBAction)calculate:(id)sender{
    [self evaluate];
    
    evaluated = YES;
    
    firstClick = YES;
}

-(void) evaluate{
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
            firstNum = [NSMutableString stringWithFormat:@"%g",answer];
            secondNum = [NSMutableString stringWithString:@""];
            break;
        case SUBTRACT:
            answer = int1 - int2;
            firstNum = [NSMutableString stringWithFormat:@"%g",answer];
            secondNum = [NSMutableString stringWithString:@""];
            break;
        case MULTIPLY:
            answer = int1 * int2;
            firstNum = [NSMutableString stringWithFormat:@"%g",answer];
            secondNum = [NSMutableString stringWithString:@""];
            break;
        case DIVIDE:
            if(int2==0){
                val1.text = [NSString stringWithFormat: @"Not Defined"];
            }else{
                answer = int1 / int2;
                firstNum = [NSMutableString stringWithFormat:@"%g",answer];
                secondNum = [NSMutableString stringWithString:@""];
            }
            break;
    }
    
    ans.text = [NSString stringWithFormat:@"%@%@", ans.text, val1.text];
    
    val1.text = [NSString stringWithFormat: @"%g",answer];
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:NO];
    [self becomeFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:NO];
}

-(void)viewDidDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewDidDisappear:NO];
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake )
    {
    }
}


-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake )
    {
        [_audioPlayer play];
        [UIView animateWithDuration:6 delay:0 options:UIViewAnimationOptionCurveEaseIn
                         animations:^{ adele.alpha = 1;}
                         completion:^(BOOL finished){
                             if (finished) {
                                 [UIView animateWithDuration:6 delay:0 options:UIViewAnimationOptionCurveEaseIn
                                                  animations:^{ adele.alpha = 0;}
                                                  completion:nil];
                             }
                         }];
    }
}

-(void)playSound:(NSString*) fileName ext: (NSString*) ext{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    NSLog(@"Button pressed: %@", [sender currentTitle]);
}


@end
