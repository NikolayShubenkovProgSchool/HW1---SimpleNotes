//
//  PSRNote.m
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRNote.h"

@implementation PSRNote

- (id)init {
    self = [super init];
    
    if (self) {
        _text = @"New note";
        _date = [NSDate date];
        _textColor = [UIColor blackColor];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.text forKey:@"text"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.textColor forKey:@"textColor"];
    [coder encodeObject:self.font forKey:@"font"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.text = [aDecoder decodeObjectForKey:@"text"];
        self.date = [aDecoder decodeObjectForKey:@"date"];
        self.textColor = [aDecoder decodeObjectForKey:@"textColor"];
        self.font = [aDecoder decodeObjectForKey:@"font"];
    }
    
    return self; 
}
@end
