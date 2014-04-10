//
//  TCViewController.h
//  TaxCalc
//
//  Created by hori on 2014/04/03.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UIButton *Clear;
@property (weak, nonatomic) IBOutlet UIButton *Plus;
@property (weak, nonatomic) IBOutlet UIButton *Equal;
@property (weak, nonatomic) IBOutlet UIButton *Tax;
@property (weak, nonatomic) IBOutlet UIButton *farst;



-(IBAction)clearNumber:(id)sender;

- (IBAction)pushCalcButton:(id)sender;

-(IBAction)pushEqualButton:(id)sender;

-(IBAction)pushNumButton:(id)sender;

-(IBAction)pushTaxButton:(id)sender;

- (IBAction)pushPiriodButton:(id)sender;

@end
