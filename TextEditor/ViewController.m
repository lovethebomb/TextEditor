//
//  ViewController.m
//  TextEditor
//
//  Created by HEYMES Lucas on 23/10/12.
//  Copyright (c) 2012 Heymès Lucas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize searchField;
@synthesize doneButton;
@synthesize textView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    // Image
    UIImage *searchImage = [UIImage imageNamed:@"Search.tiff"];
    UIImageView *searchImageView = [[UIImageView alloc] initWithImage:searchImage];
    searchField.leftView = searchImageView;
    searchField.leftViewMode = UITextFieldViewModeWhileEditing;
    [searchImageView release];
}

- (void)keyboardWillShow: (NSNotification *)notification
{
    NSLog(@"%@", [notification userInfo]);
}
- (void)viewDidUnload
{
    [self setSearchField:nil];
    [self setTextView:nil];
    [self setDoneButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [searchField release];
    [textView release];
    [doneButton release];
    [super dealloc];
}
- (IBAction)doneButtonPressed:(id)sender {
    // removes the keyboard when clicking editable textview
    [textView resignFirstResponder];
}
@end
