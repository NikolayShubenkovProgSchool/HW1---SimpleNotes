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
    
    [self updateView];
}

#pragma mark - Setup

- (void)updateModel {
    self.selectedColor = [UIColor colorWithRed:self.redSlider.value
                                         green:self.greenSlider.value
                                          blue:self.blueSlider.value
                                         alpha:1.0];
}

- (void)updateView
{
    self.colorView.backgroundColor = self.selectedColor;
}

#pragma mark - Actions

- (IBAction)sliderValueChanged:(UISlider *)sender {
    [self updateModel];
    [self updateView];
}

- (IBAction)colorSelectDone:(UIButton *)sender {
    [self.delegate colorDidChanged:self.selectedColor];
    //в идеале убирать с экрана должен делегат а не сам colorSelectorViewContorller
    //т.к. только делегат в курсе как долго должен быть выбор цвета.
    //может делегат решить вывести сообщение, что этот цвет чем-то не подходит
    //и не захочет убирать этот контроллер с экрана
    [self.navigationController popViewControllerAnimated:YES];
}
@end
