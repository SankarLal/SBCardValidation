//
//  SBCardValidationViewController.m
//  SBCardValidation
//
//  Created by SANKARLAL on 10/11/16.
//  Copyright © 2016 SANKARLAL. All rights reserved.
//

#import "SBCardValidationViewController.h"
#import "SBCardValidateModel.h"

@interface SBCardValidationViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *cardNumberTextFld;
@property (weak, nonatomic) IBOutlet UIImageView *cardTypeImageView;
@property (weak, nonatomic) IBOutlet UILabel *validCardLable;
@property (weak, nonatomic) IBOutlet UILabel *cardTypeNameLabel;

@property (strong, nonatomic) IBOutlet SBCardValidateModel *sbCardValidateModel;


@end

@implementation SBCardValidationViewController
@synthesize cardNumberTextFld, cardTypeImageView, validCardLable, cardTypeNameLabel, sbCardValidateModel;

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"SB Card Validation";
    
    cardNumberTextFld.delegate = self;
    
    validCardLable.text = @"";
    cardTypeNameLabel.text = @"";
    
    sbCardValidateModel = [[SBCardValidateModel alloc] init];

}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [cardNumberTextFld becomeFirstResponder];
}

#pragma mark - Perform Clear Button
-(IBAction)performClearButton {
    
    cardNumberTextFld.text = @"";
    cardTypeImageView.image = nil;
    validCardLable.text = @"";
    cardTypeNameLabel.text = @"";

}

#pragma mark - TextFiedl Delegate Function
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *trimmedText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSDictionary* validateCard = [sbCardValidateModel validateCard:trimmedText];
   
    if ([validateCard[@"isValidCard"] boolValue]) {
        cardTypeImageView.image = [UIImage imageNamed:validateCard[@"cardTypeName"]];
        validCardLable.text = @"Card No is Valid";

    } else {
        cardTypeImageView.image = nil;
        validCardLable.text = @"Card No is Not Valid";

    }
    
    cardTypeNameLabel.text = validateCard[@"cardTypeName"];
    
    if ([trimmedText isEqualToString:@""]) {
        [self performClearButton];
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
