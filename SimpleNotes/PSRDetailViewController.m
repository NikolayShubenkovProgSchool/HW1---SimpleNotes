//
//  PSRDetailViewController.m
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRDetailViewController.h"
#import "PSRColorSelectProtocol.h"

@interface PSRDetailViewController ()

@end

@implementation PSRDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.note) {
        self.textView.text = self.note.text;
        self.textView.textColor = self.note.textColor;
        self.textView.font = self.note.font;
    }
    
    self.navigationItem.title = self.note.text;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.note.text = self.textView.text;
    self.note.textColor = self.textView.textColor;
    self.note.font = self.textView.font;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    /*
    
    //подсветка идет т.к.  компилятор не знает что за объект этот destinationViewController
    if ([[segue identifier] isEqualToString:@"PSRColorSelectViewController"]) {
        //переведите курсор в конец метода setDelegate и нажмите escape - вы увидите,
        //что компилятор посчитал что destinationViewController относится к классу NSFileManager
        //а вы протокол NSFileManagerDelegate не поддерживаете, поэтому и наблюдаете эту ругать
        //чтобы от этого избавиться нужно явно задать что за объект этот destinationView controller или
        //как-то еще сообщить какой именно делегат должен поддерживать протокол.
        //вариантов два:
        //импортируйте h файл psrSelectColorViewController'a проверьте что идет переход к обхекту этого класс методом
        //if([segue.destinationViewController isKindOfClass[PSRSelectViewController]]) - но это не очень круто. {
            PSRColorSelectViewController *colorSelectViewController = segue.destinationViewContoller;
            colorSelectViewController.delegate = self;
            colorSelectViewController.selectedColor = self.textView.textColor;
        }
    }
     */
    //второй метод перехода к другому контроллеру - выяснить поддерживает ли новый контроллер определенный протокол
    if ([segue.destinationViewController conformsToProtocol:@protocol(PSRColorSelectorProtocol)]){
        id <PSRColorSelectorProtocol> destinationContorller = segue.destinationViewController;
        destinationContorller.selectedColor = self.textView.textColor;
        destinationContorller.delegate      = self;
    }
}

#pragma mark - Actions
//
//- (IBAction)showColorSelect:(UIBarButtonItem *)sender {
//    PSRColorSelectViewController *csvc = [self.storyboard instantiateViewControllerWithIdentifier:@"PSRColorSelectViewController"];
//    csvc.delegate = self;
//    csvc.selectedColor = self.textView.textColor;
//    [self.navigationController pushViewController:csvc animated:YES];
//}
//я бы использовал сегвей как и вы
- (IBAction)showFontSelect:(UIBarButtonItem *)sender {
    PSRFontSelectViewController *fsvc = [self.storyboard instantiateViewControllerWithIdentifier:@"PSRFontSelectViewController"];
    fsvc.delegate = self;
    [self.navigationController pushViewController:fsvc animated:YES];
}

#pragma mark - PSRColorSelectDelegate

- (void)colorDidChanged:(UIColor *)color {
    self.textView.textColor = color;
}

#pragma mark - PSRFontSelectDelegate 

- (void)fontDidSelected:(UIFont *)font {
    self.textView.font = font;
}

@end