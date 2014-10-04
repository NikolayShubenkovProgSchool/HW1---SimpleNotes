//
//  PSRColorSelectViewController.h
//  SimpleNotes
//
//  Created by Dmitry Arbuzov on 03.10.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PSRColorSelectProtocol.h"

@interface PSRColorSelectViewController : UIViewController <PSRColorSelectorProtocol>

@property (strong, nonatomic) UIColor *selectedColor;

@property (weak, nonatomic) IBOutlet UIView *colorView;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@property (weak, nonatomic) id<PSRColorSelectDelegate> delegate;

- (IBAction)sliderValueChanged:(UISlider *)sender;
- (IBAction)colorSelectDone:(UIButton *)sender;

@end

