//
//  ViewController.m
//  ObjectiveC2_Lesson1
//
//  Created by Admin on 25.04.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import "ViewController.h"
#import "Animations.h"

@interface ViewController () {
    BOOL isYES;
    BOOL isPlaceHolderHidden;
    BOOL isPlaceHolderSurnameHidden;
    BOOL isPlaceHolderLoginHidden;
}
@property (weak, nonatomic) IBOutlet UILabel *label_YES;
@property (weak, nonatomic) IBOutlet UILabel *label_NO;

@property (weak, nonatomic) IBOutlet UIView *view_BG_YES;
@property (weak, nonatomic) IBOutlet UIView *view_BG_NO;
@property (weak, nonatomic) IBOutlet UIView *view_CH_YES;
@property (weak, nonatomic) IBOutlet UIView *view_CH_NO;
@property (weak, nonatomic) IBOutlet UITextField *text_Field;
@property (weak, nonatomic) IBOutlet UITextField *text_Field_Surname;
@property (weak, nonatomic) IBOutlet UITextField *text_Field_Login;

- (IBAction)button_YES:(id)sender;
- (IBAction)button_NO:(id)sender;
- (IBAction)text_View_Change:(id)sender;
- (IBAction)text_View_Change_Surname:(id)sender;
- (IBAction)text_View_Change_Login:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *label_Placeholder;
@property (weak, nonatomic) IBOutlet UILabel *label_Placeholder_Surname;
@property (weak, nonatomic) IBOutlet UILabel *label_Placeholder_Login;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isPlaceHolderHidden = NO;
    isPlaceHolderSurnameHidden = NO;
    isPlaceHolderLoginHidden = NO;
    
    [self set_View];
    
 
}

- (void) set_View {
    
    //здесь мы прорисовываем внешний вид элементов (граница, цвет, радиус закругления и т.д.)
    
    self.view_BG_YES.layer.borderColor = [UIColor yellowColor].CGColor;
    self.view_BG_YES.layer.borderWidth = 1.0;
    self.view_BG_YES.layer.cornerRadius = 5.0;
    
    self.view_CH_YES.layer.borderColor = [UIColor blackColor].CGColor;
    self.view_CH_YES.layer.borderWidth = 1.0;
    self.view_CH_YES.layer.cornerRadius = 5.0;
    
    self.view_BG_NO.layer.borderColor = [UIColor yellowColor].CGColor;
    self.view_BG_NO.layer.borderWidth = 1.0;
    self.view_BG_NO.layer.cornerRadius = 5.0;
    
    self.view_CH_NO.layer.borderColor = [UIColor blackColor].CGColor;
    self.view_CH_NO.layer.borderWidth = 1.0;
    self.view_CH_NO.layer.cornerRadius = 5.0;
    
    self.text_Field.layer.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9].CGColor;
    self.text_Field.layer.borderColor = [UIColor yellowColor].CGColor;
    self.text_Field.layer.borderWidth = 1.0;
    self.text_Field.layer.cornerRadius = 5.0;
    
    self.text_Field_Surname.layer.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9].CGColor;
    self.text_Field_Surname.layer.borderColor = [UIColor yellowColor].CGColor;
    self.text_Field_Surname.layer.borderWidth = 1.0;
    self.text_Field_Surname.layer.cornerRadius = 5.0;
    
    self.text_Field_Login.layer.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9].CGColor;
    self.text_Field_Login.layer.borderColor = [UIColor yellowColor].CGColor;
    self.text_Field_Login.layer.borderWidth = 1.0;
    self.text_Field_Login.layer.cornerRadius = 5.0;

    
}



- (IBAction)button_YES:(id)sender {
    
    if (!isYES) {

        [Animations change_CH_View:self.view_CH_NO Color:[UIColor whiteColor]];
        [Animations change_CH_View:self.view_CH_YES Color:[UIColor yellowColor]];
        [Animations set_Glow_Effect:self.label_YES Alpha:1]; //подсвечивается надпись ДА
        [Animations set_Glow_Effect:self.label_NO Alpha:0]; //гаснет надпись НЕТ

        
                isYES = YES;
    }
}

- (IBAction)button_NO:(id)sender {
    
    if (isYES) {
        
        
        [Animations change_CH_View:self.view_CH_YES Color:[UIColor whiteColor]];
        [Animations change_CH_View:self.view_CH_NO Color:[UIColor yellowColor]];
        [Animations set_Glow_Effect:self.label_YES Alpha:0]; //подсвечивается надпись НЕТ
        [Animations set_Glow_Effect:self.label_NO Alpha:1]; //гаснет надпись ДА
        

                isYES = NO;
    }
}

- (IBAction)text_View_Change:(id)sender {
    
    //данный метод при введении в поле букв - отодвигает Лейбл вправо (метод анимации вызывается из класса Animations)
    
    if (self.text_Field.text.length == 0) {
        //условие на наличие хотябы одного символа в поле текстфилда
        
        if (isPlaceHolderHidden) {
            [Animations move_Placeholder:self.label_Placeholder Alpha:1];
            isPlaceHolderHidden = NO;
        }
        
    }
    
    else {
        
        if (!isPlaceHolderHidden) {
            [Animations move_Placeholder:self.label_Placeholder Alpha:0];
            isPlaceHolderHidden = YES;
        }
        
    }
}

- (IBAction)text_View_Change_Surname:(id)sender {
    
        //данный метод при введении в поле букв - отодвигает Лейбл вверх с толчком (метод анимации вызывается из класса Animations)
    
    if (self.text_Field_Surname.text.length == 0) {
        
        //условие на наличие хотябы одного символа в поле текстфилда

        if (isPlaceHolderSurnameHidden) {
            [Animations move_Placeholder_UP_DOWN:self.label_Placeholder_Surname Points:30 TextColor:[UIColor blackColor]];
            isPlaceHolderSurnameHidden = NO;
        }
        
    }
    
    else {
        
        if (!isPlaceHolderSurnameHidden) {
             [Animations move_Placeholder_UP_DOWN:self.label_Placeholder_Surname Points:-30 TextColor:[UIColor yellowColor]];
            isPlaceHolderSurnameHidden = YES;
        }
        
    }
}

- (IBAction)text_View_Change_Login:(id)sender {
    //данный метод при введении в поле букв - отодвигает Лейбл вверх мягко (метод анимации вызывается из класса Animations)
    
    if (self.text_Field_Login.text.length == 0) {
        
        //условие на наличие хотябы одного символа в поле текстфилда
        
        if (isPlaceHolderLoginHidden) {
            [Animations move_Placeholder_UP_DOWN_week:self.label_Placeholder_Login Points:30 TextColor:[UIColor blackColor]];
            isPlaceHolderLoginHidden = NO;
        }
        
    }
    
    else {
        
        if (!isPlaceHolderLoginHidden) {
            [Animations move_Placeholder_UP_DOWN_week:self.label_Placeholder_Login Points:-30 TextColor:[UIColor yellowColor]];
            isPlaceHolderLoginHidden = YES;
        }
        
    }

}



#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.text_Field resignFirstResponder];
    [self.text_Field_Surname resignFirstResponder];
    [self.text_Field_Login resignFirstResponder];

    
    return YES;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
