//
//  PSRColorSelectProtocol.h
//  SimpleNotes
//
//  Created by n.shubenkov on 04/10/14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PSRColorSelectDelegate <NSObject>

- (void)colorDidChanged:(UIColor *)color;

@end

@protocol  PSRColorSelectorProtocol <NSObject>

@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, weak) id <PSRColorSelectDelegate> delegate;

@end
