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
@property (strong, nonatomic) IBOutlet UITextField *receiver;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sendYOAction:(id)sender
{
    if (self.receiver.text) {
        // Yo Individual Usernames
        [YO sendYOToIndividualUser:self.receiver.text];
    }
    
    /*****************************/
    // Send A Yo To All Subscribers (We don't send Yo to all here.)
    // [YO sendYO];
    
    // Count Total Subscribers
    [YO countTotalSubscribers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
