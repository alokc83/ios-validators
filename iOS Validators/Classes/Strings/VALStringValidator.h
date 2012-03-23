//
//  VALStringValidator.h
//  iOS Validators
//
//  Created by Vandad Nahavandipoor on 23/03/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "VALValidator.h"

@interface VALStringValidator : VALValidator

/*
 Inherited from the superclass.
 */
- (BOOL) isValidObject:(id)paramObject outputError:(NSError *__autoreleasing *)paramOutputError;

@end
