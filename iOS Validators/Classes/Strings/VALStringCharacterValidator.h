//
//  VALStringCharacterValidator.h
//  iOS Validators
//
//  Created by Vandad Nahavandipoor on 23/03/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "VALValidator.h"
#import "VALStringValidator.h"

@interface VALStringCharacterValidator : VALStringValidator

@property (nonatomic, strong) NSCharacterSet *characterSetDisallowed;

/*
 Designated Initializer.
 */
- (id) initWithDisallowedCharactersInSet:(NSCharacterSet *)paramDisallowedCharacterSet;

/*
 Convenience Methods.
 */
+ (id) newWithDisallowedCharactersInSet:(NSCharacterSet *)paramDisallowedCharacterSet;

/*
 Inherited from the superclass.
 */
- (BOOL) isValidObject:(id)paramObject outputError:(__autoreleasing NSError **)paramOutputError;

@end
