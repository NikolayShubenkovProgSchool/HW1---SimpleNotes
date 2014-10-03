//
//  PSRDetailViewController.m
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRDetailViewController.h"

@interface PSRDetailViewController ()

@end

@implementation PSRDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.note) {
        self.textView.text = self.note.text;
        self.textView.textColor = self.note.textColor;
    }
    
    self.navigationItem.title = self.note.text;
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = cancelButton;
}

- (void)cancel {
    
}

- (void)viewWillDisappear:(BOOL)animated {
    self.note.text = self.textView.text;
    self.note.textColor = self.textView.textColor;
}

#pragma mark - Actions

- (IBAction)showColorSelect:(UIBarButtonItem *)sender {
    PSRColorSelectViewController *csvc = [self.storyboard instantiateViewControllerWithIdentifier:@"PSRColorSelectViewController"];
    csvc.delegate = self;
    csvc.selectedColor = self.textView.textColor ? self.textView.textColor : [UIColor blackColor];
    [self.navigationController pushViewController:csvc animated:YES];
}

#pragma mark - PSRColorSelectDelegate

- (void)colorDidChanged:(UIColor *)color {
    self.textView.textColor = color;
}

@end