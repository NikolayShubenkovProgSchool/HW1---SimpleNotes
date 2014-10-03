//
//  PSRColorSelectViewController.m
//  SimpleNotes
//
//  Created by Dmitry Arbuzov on 03.10.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRColorSelectViewController.h"

@interface PSRColorSelectViewController ()

@end

@implementation PSRColorSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat red = 0;
    CGFloat green = 0;
    CGFloat blue = 0;
    [self.selectedColor getRed:&red
                         green:&green
                          blue:&blue
                         alpha:nil];
    self.redSlider.value = red;
    self.greenSlider.value = green;
    self.blueSlider.value = blue;
    
    [self sliderValueChanged:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)sliderValueChanged:(UISlider *)sender {
    self.selectedColor = [UIColor colorWithRed:self.redSlider.value
                                         green:self.greenSlider.value
                                          blue:self.blueSlider.value
                                         alpha:1.0];
    self.colorView.backgroundColor = self.selectedColor;
}

- (IBAction)colorSelectDone:(UIButton *)sender {
    [self.delegate colorDidChanged:self.selectedColor];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
