//
//  SBCardValidateModel.m
//  SBCardValidation
//
//  Created by SANKARLAL on 10/11/16.
//  Copyright © 2016 SANKARLAL. All rights reserved.
//

#import "SBCardValidateModel.h"

@implementation SBCardValidateModel
@synthesize cardTypeStr;

-(NSDictionary*)validateCard:(NSString *)cardNumber {
    
    cardTypeStr = @"";
    
    if([cardNumber length]>3)
    {
        switch ([[cardNumber substringToIndex:2] intValue]) {
                
            case 34:
            case 37:
                cardTypeStr = @"Amex"; // American Express
                break;
                
            case 36:
                cardTypeStr = @"DinersClub"; // Diners Club
                break;
                
            case 38:
                cardTypeStr = @"CarteBlanche"; // Carte Blanche
                break;
                
            case 51:
            case 52:
            case 53:
            case 54:
            case 55:
                cardTypeStr = @"MasterCard"; // Master Card
                break;
                
            default:
                
                switch ([[cardNumber substringToIndex:4] intValue]) {
                        
                    case 2014:
                    case 2149:
                        cardTypeStr = @"EnRoute"; // EnRoute
                        break;
                        
                    case 2131:
                    case 1800:
                        cardTypeStr = @"Jcb"; // JCB
                        break;
                        
                    case 6011:
                        cardTypeStr = @"Discover"; // Discover
                        break;
                        
                    default:
                        
                        switch ([[cardNumber substringToIndex:3] intValue]) {
                                
                            case 300:
                            case 301:
                            case 302:
                            case 303:
                            case 304:
                            case 305:
                                cardTypeStr = @"AmericanDinersClub"; // American Diners Club
                                break;
                                
                            default:
                                
                                switch ([[cardNumber substringToIndex:1] intValue]) {
                                        
                                    case 3:
                                        cardTypeStr = @"Jcb"; // JCB
                                        break;
                                        
                                    case 4:
                                        cardTypeStr = @"VisaCard";  // Visa Card
                                        break;
                                        
                                    default:
                                        cardTypeStr = @"NoName";
                                        break;
                                }
                                
                                break;
                        }
                        break;
                        
                        break;
                        
                        
                }
        }
        
        
    }
    // End Check Card Type
    NSLog(@"lent cardNumber %lu",(unsigned long)[cardNumber length]);
    
    if([cardNumber length]>12)
    {
        
        NSMutableArray *characters = [[NSMutableArray alloc] initWithCapacity:[cardNumber length]];
        for (int i=0; i < [cardNumber length]; i++) {
            NSString *ichar  = [NSString stringWithFormat:@"%c", [cardNumber characterAtIndex:i]];
            [characters addObject:ichar];
        }
        NSMutableArray *stringAsChars=[[NSMutableArray alloc] initWithArray:characters];
        
        
        BOOL isOdd = YES;
        
        int oddSum = 0;
        int evenSum = 0;
        int stringLength =  (int)[cardNumber length];
        
        for (int i = stringLength - 1; i >= 0; i--) {
            
            int digit = [(NSString *)[stringAsChars objectAtIndex:i] intValue];
            
            if (isOdd) 
                oddSum += digit;
            else 
                evenSum += digit/5 + (2*digit) % 10;
            
            isOdd = !isOdd;				 
        }
        NSLog(@"Boole %d",((oddSum + evenSum) % 10 == 0));
        
        return @{
                 @"isValidCard" : [NSNumber numberWithBool:((oddSum + evenSum) % 10 == 0)],
                 @"cardTypeName" : cardTypeStr
                 };
    }
    else
        return @{
                 @"isValidCard" : [NSNumber numberWithBool:false],
                 @"cardTypeName" : cardTypeStr
                 };
}

@end
