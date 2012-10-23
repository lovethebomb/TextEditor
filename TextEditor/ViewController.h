//
//  ViewController.h
//  TextEditor
//
//  Created by HEYMES Lucas on 23/10/12.
//  Copyright (c) 2012 Heymès Lucas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (retain, nonatomic) IBOutlet UITextField *searchField;
@property (retain, nonatomic) IBOutlet UITextView *textView;
@property (retain, nonatomic) IBOutlet UIButton *doneButton;

- (IBAction)doneButtonPressed:(id)sender;

@end
