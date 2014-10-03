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

    [self sliderValueChanged:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)sliderValueChanged:(UISlider *)sender {
    self.colorView.backgroundColor = [UIColor colorWithRed:self.redSlider.value
                                                      green:self.greenSlider.value
                                                       blue:self.blueSlider.value
                                                      alpha:1.0];
}

- (IBAction)colorSelectDone:(UIButton *)sender {
    [self.delegate colorDidChanged:self.colorView.backgroundColor];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
