//
//  RootViewController.m
//  WeekOneAssessment
//
//  Created by Leandro Pessini on 3/13/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "RootViewController.h"
#import "InternetViewController.h"

@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UITextField *valueOneTextField;
@property (weak, nonatomic) IBOutlet UITextField *valueTwoTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *webViewBarButtonItem;


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.webViewBarButtonItem.enabled = NO;
}

#pragma mark -IBAction

- (IBAction)onCalculateButtonPressed:(UIButton *)sender
{
    if ([self.valueOneTextField.text isEqualToString:@""] || [self.valueTwoTextField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing something"
                                                        message:@"All fields are required!"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"Ok", nil];
        [alert show];
    }
    else
    {

        NSLog(@"Oi");
        int numberOne = [self.valueOneTextField.text intValue];
        int numberTwo = [self.valueTwoTextField.text intValue];
        int result;

        result = numberOne * numberTwo;

        BOOL isMultipleOfFive = !(result % 5);

        if (isMultipleOfFive)
        {
            self.webViewBarButtonItem.enabled = YES;
        }
        else
        {
            self.webViewBarButtonItem.enabled = NO;
        }

        self.title = [NSString stringWithFormat:@"%i", result];

    }
}

#pragma mark -Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIBarButtonItem *)sender
{

    InternetViewController *vc = segue.destinationViewController;
    vc.title = self.title;

}

@end
