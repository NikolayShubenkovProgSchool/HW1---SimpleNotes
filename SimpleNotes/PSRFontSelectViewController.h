//
//  PSRFontSelectViewController.h
//  SimpleNotes
//
//  Created by Dmitry Arbuzov on 04.10.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PSRFontSelectDelegate;

@interface PSRFontSelectViewController : UITableViewController

@property (weak, nonatomic) id<PSRFontSelectDelegate> delegate;

@end

@protocol PSRFontSelectDelegate <NSObject>

- (void)fontDidSelected:(UIFont *)font;

@end