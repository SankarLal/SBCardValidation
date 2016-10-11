//
//  SBCardValidateModel.h
//  SBCardValidation
//
//  Created by SANKARLAL on 10/11/16.
//  Copyright © 2016 SANKARLAL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBCardValidateModel : NSObject

-(NSDictionary*)validateCard:(NSString *)cardNumber;
@property (strong, nonatomic) NSString *cardTypeStr;

@end

