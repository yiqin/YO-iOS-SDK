//
//  ViewController.m
//  YO iOS SDK
//
//  Created by yiqin on 7/26/14.
//  Copyright (c) 2014 yiqin. All rights reserved.
//

#import "ViewController.h"
#import "YO.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *enterUsername;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.enterUsername becomeFirstResponder];
}

- (IBAction)sendYOAction:(id)sender
{
    // Send A Yo To All Subscribers
    [YO sendYO];
    
    // Yo Individual Usernames
    if ([self.enterUsername.text length] > 0) {
        [YO sendYOToIndividualUser:self.enterUsername.text];
    }
    else {
        [YO sendYOToIndividualUser:@"YIQIN1"];
    }
    
    // Count Total Subscribers
    [YO countTotalSubscribers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
