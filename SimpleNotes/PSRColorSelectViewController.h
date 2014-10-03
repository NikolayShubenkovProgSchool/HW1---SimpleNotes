//
//  PSRColorSelectViewController.h
//  SimpleNotes
//
//  Created by Dmitry Arbuzov on 03.10.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSRColorSelectViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *colorView;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

- (IBAction)sliderValueChanged:(UISlider *)sender;

- (IBAction)colorSelectDone:(UIButton *)sender;

@end
