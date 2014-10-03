//
//  PSRFontSelectViewController.m
//  SimpleNotes
//
//  Created by Dmitry Arbuzov on 04.10.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRFontSelectViewController.h"

@interface PSRFontSelectViewController ()

@property (strong, nonatomic) NSArray *familyNames;

@end

@implementation PSRFontSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.familyNames = [UIFont familyNames];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *familyName = self.familyNames[indexPath.section];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    NSString *fontName = fontNames[indexPath.row];
    UIFont *selectedFont = [UIFont fontWithName:fontName size:16.f];
    [self.delegate fontDidSelected:selectedFont];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.familyNames.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *familyName = self.familyNames[section];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    return fontNames.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *familyName = self.familyNames[section];
    return familyName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSString *familyName = self.familyNames[indexPath.section];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    NSString *fontName = fontNames[indexPath.row];
    
    cell.textLabel.text = fontName;    
    UIFont *font = [UIFont fontWithName:fontName size:16];
    cell.textLabel.font = font;
    
    return cell;
}

@end
