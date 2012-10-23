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
    [searchField resignFirstResponder];
    doneButton.hidden = YES;
}

#pragma mark - TextField delegate method
- (BOOL)textFieldShouldBeginEditing:(UITextField *)theTextField
{
    doneButton.hidden = NO;
    return YES;
}

#pragma mark - TextField delegate method
- (BOOL) textFieldShouldReturn:(UITextField *)theTextField
{
    [searchField resignFirstResponder];
    doneButton.hidden = YES;
    NSLog(@"searchField text : %@", theTextField.text);
    // ignore if field is empty
    if (![searchField.text isEqualToString:@""]) {
        
        
        NSRange foundRange = [textView.text rangeOfString:theTextField.text];
        if (foundRange.location != NSNotFound) {
            [textView becomeFirstResponder];
            textView.selectedRange = foundRange;
        }
        else {
            [searchField becomeFirstResponder];
            searchField.text = @"";
        } 
        
    }
    return NO;
}

#pragma mark - TextView delegate method - accept only numbers
- (BOOL) textView:textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    // This is what I type
    NSLog(@"%@ = %d", text, [text intValue]);
    
    // We test if integer value of text is either not 0 (int), OR if it's 0 (NSString)oi
    if ( ([text intValue] != 0) || ([text isEqualToString:@"0"]) ) {
        // text is a number
        return YES;
    }
    return NO;
}

@end
