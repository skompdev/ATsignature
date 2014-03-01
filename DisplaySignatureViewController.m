//
//  DisplaySignatureViewController.m
//  awstest
//
//  Created by skompdev on 2/27/14.
//  Copyright (c) 2014 Organization Name. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "JSON.h"
#import "BT_application.h"
#import "BT_strings.h"
#import "BT_viewUtilities.h"
#import "awstest_appDelegate.h"
#import "BT_item.h"
#import "BT_debugger.h"
#import "BT_viewControllerManager.h"
#import "AT_BlankScreenG.h"


#import "DisplaySignatureViewController.h"

@interface DisplaySignatureViewController ()

@end

@implementation DisplaySignatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set the title of the navigation view
    [self.navigationItem setTitle:@"Display Signature"];
    
    //create a label to display the name of the person who signed the document
    CGRect myFrame = CGRectMake(10.0f, 0.0f, 300.0f, 30.0f);
    _signedBy = [[UILabel alloc] initWithFrame:myFrame];
    _signedBy.font = [UIFont boldSystemFontOfSize:16.0f];
    _signedBy.textAlignment =  NSTextAlignmentLeft;
    [self.view addSubview:_signedBy];
    
    //get reference to the navigation frame to calculate bar height
    CGRect navigationframe = [[self.navigationController navigationBar] frame];
    int navbarHeight = navigationframe.size.height;
    
    //frame for our signature image
    CGRect imageFrame = CGRectMake(self.view.frame.origin.x+10, 30,
                                   self.view.frame.size.width-20,
                                   self.view.frame.size.height-navbarHeight-30);
    
    //create an image view to display our signature image
    self.mySignatureView = [[UIImageView alloc] init];
    [self.mySignatureView setFrame:imageFrame];
    [self.mySignatureView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:self.mySignatureView];
    



}


//view will appear
-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	[BT_debugger showIt:self theMessage:@"viewWillAppear"];
	
	//flag this as the current screen
	awstest_appDelegate *appDelegate = (awstest_appDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.rootApp.currentScreenData = self.screenData;
	
	//setup navigation bar and background
	[BT_viewUtilities configureBackgroundAndNavBar:self theScreenData:[self screenData]];
    
	//who signed the document
    _signedBy.text = [NSString stringWithFormat:@"Signed by: %@", _personName];
    
    //create the path to our image file
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"MyFolder"];
    NSString *fileName = [filePath stringByAppendingPathComponent:
                          [NSString stringWithFormat:@"%@.png", _personName]];
    
    //get the contents of the image file into the image
    UIImage *signature = [UIImage imageWithContentsOfFile:fileName];
    //display our signature image
    _mySignatureView.image = signature;
	
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
