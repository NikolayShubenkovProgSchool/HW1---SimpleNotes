//
//  PSRDetailViewController.h
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSRNote.h"
#import "PSRColorSelectViewController.h"
#import "PSRFontSelectViewController.h"

@interface PSRDetailViewController : UIViewController <PSRColorSelectDelegate, PSRFontSelectDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) PSRNote *note;

- (IBAction)showColorSelect:(UIBarButtonItem *)sender;
- (IBAction)showFontSelect:(UIBarButtonItem *)sender;

@end
