//
//  TCViewController.m
//  TaxCalc
//
//  Created by hori on 2014/04/03.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "TCViewController.h"
#import <AudioToolbox/AudioServices.h>

@interface TCViewController ()

@end

@implementation TCViewController


float  sStacValue = 0;
int    sPlusMode  = 0;
bool   sNewNum    = false;


-(IBAction)clearNumber:(id)sender{
    AudioServicesPlaySystemSound(1305); // key type sound
    // 表示エリアの更新
    _text.text = [NSString stringWithFormat:@"%d", 0];
    sStacValue = 0;
    sPlusMode  = 0;
    sNewNum = true;
}

//
- (IBAction)pushCalcButton:(id)sender{
    AudioServicesPlaySystemSound(1105); // key type sound
    UIButton *sender_btn = (UIButton *)sender;
    if( sStacValue != 0 ){
        if( sPlusMode == 1 ){
            sStacValue /= _text.text.floatValue;
        } else if(sPlusMode == 2 ){
            sStacValue *= _text.text.floatValue;
        } else if(sPlusMode == 3 ){
            sStacValue -= _text.text.floatValue;
        } else if(sPlusMode == 4 ){
            sStacValue += _text.text.floatValue;
        }
    } else {
        sStacValue = _text.text.floatValue;
    }
    sPlusMode  = (int)sender_btn.tag;
    sNewNum = true;
    
    _text.text = [NSString stringWithFormat:@"%g", sStacValue];
    
}

- (IBAction)pushEqualButton:(id)sender{
    AudioServicesPlaySystemSound(1105); // key type sound
    if( sPlusMode == 1 ){
        sStacValue /= _text.text.floatValue;
    } else if(sPlusMode == 2 ){
        sStacValue *= _text.text.floatValue;
    } else if(sPlusMode == 3 ){
        sStacValue -= _text.text.floatValue;
    } else if(sPlusMode == 4 ){
        sStacValue += _text.text.floatValue;
    }
    
    _text.text = [NSString stringWithFormat:@"%g", sStacValue];
    sNewNum = true;

    
    sPlusMode = 0;
    sStacValue = 0;
}




- (IBAction)pushNumButton:(id)sender{
    AudioServicesPlaySystemSound(1105); // key type sound
    UIButton *sender_btn = (UIButton *)sender;

    if ( sNewNum == true ){
        _text.text = [NSString stringWithFormat:@"%d", (int)sender_btn.tag];
        sNewNum = false;

    } else {
        if( sender_btn.tag == 0 && _text.text.intValue == 0){
            // 何もしない
        } else {
        
            // 押したボタンの値
            NSString *buttonText= [NSString stringWithFormat:@"%d", (int)sender_btn.tag];
            // 表示エリアの値
            NSString *labelText= _text.text;
            
            // 小数点を含むか
            NSRange range = [_text.text rangeOfString:@"."];
            // 表示エリアの更新
            if ( _text.text.intValue == 0 && range.location == NSNotFound){
                _text.text = [NSString stringWithFormat:@"%@", buttonText];
            } else {
                _text.text = [NSString stringWithFormat:@"%@%@", labelText, buttonText];
            }
        }
    }
}

- (IBAction)pushTaxButton:(id)sender{
    AudioServicesPlaySystemSound(1308); // key type sound
    int num = (int)_text.text.intValue;
    _text.text = [NSString stringWithFormat:@"%d", (int)ceil(num * 1.08)];
}

- (IBAction)pushPiriodButton:(id)sender{
    AudioServicesPlaySystemSound(1105); // key type sound
    NSRange range = [_text.text rangeOfString:@"."];
    if ( range.location == NSNotFound ){
        NSString *labelText= _text.text;
        _text.text = [NSString stringWithFormat:@"%@%@", labelText, @"."];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    sStacValue = 0;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
