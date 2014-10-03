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
        self.textView.font = self.note.font;
    }
    
    self.navigationItem.title = self.note.text;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.note.text = self.textView.text;
    self.note.textColor = self.textView.textColor;
    self.note.font = self.textView.font;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"PSRColorSelectViewController"]) {
        [segue.destinationViewController setDelegate:self];
        [segue.destinationViewController setSelectedColor:self.textView.textColor];
    }
}

#pragma mark - Actions
//
//- (IBAction)showColorSelect:(UIBarButtonItem *)sender {
//    PSRColorSelectViewController *csvc = [self.storyboard instantiateViewControllerWithIdentifier:@"PSRColorSelectViewController"];
//    csvc.delegate = self;
//    csvc.selectedColor = self.textView.textColor;
//    [self.navigationController pushViewController:csvc animated:YES];
//}

- (IBAction)showFontSelect:(UIBarButtonItem *)sender {
    PSRFontSelectViewController *fsvc = [self.storyboard instantiateViewControllerWithIdentifier:@"PSRFontSelectViewController"];
    fsvc.delegate = self;
    [self.navigationController pushViewController:fsvc animated:YES];
}

#pragma mark - PSRColorSelectDelegate

- (void)colorDidChanged:(UIColor *)color {
    self.textView.textColor = color;
}

#pragma mark - PSRFontSelectDelegate 

- (void)fontDidSelected:(UIFont *)font {
    self.textView.font = font;
}

@end