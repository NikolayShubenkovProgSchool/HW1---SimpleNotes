//
//  PSRColorSelectViewController.m
//  SimpleNotes
//
//  Created by Dmitry Arbuzov on 03.10.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRColorSelectViewController.h"

#import "UIColor+PSRComponents.h"

@interface PSRColorSelectViewController ()

@end

@implementation PSRColorSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.redSlider.value   = [self.selectedColor psr_redComponent];
    self.greenSlider.value = [self.selectedColor psr_greenComponent];
    self.blueSlider.value  = [self.selectedColor psr_blueComponent];
    
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
