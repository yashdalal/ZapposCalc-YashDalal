//
//  ViewController.h
//  ZapposCalculator
//
//  Created by Yash Dalal on 2/4/16.
//  Copyright © 2016 Yash Dalal. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {ADD, SUBTRACT, MULTIPLY, DIVIDE} Operation;

@interface ViewController : UIViewController{
    IBOutlet UITextField *num1;
    IBOutlet UITextField *num2;
    IBOutlet UITextField *val1;
    IBOutlet UITextField *val2;
    IBOutlet UITextField *sign;
    IBOutlet UITextField *ans;
    UIButton *current;
    NSMutableString *storage;
    Operation currentOperation;
}





@end

