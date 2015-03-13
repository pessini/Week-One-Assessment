//
//  InternetViewController.m
//  WeekOneAssessment
//
//  Created by Leandro Pessini on 3/13/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "InternetViewController.h"

@interface InternetViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation InternetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://www.mobilemakers.co"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

#pragma mark -UIWebView

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.spinner startAnimating];

}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating];
}



@end
