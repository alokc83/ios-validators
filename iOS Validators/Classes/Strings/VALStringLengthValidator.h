//
//  VALStringLengthValidator.h
//  iOS Validators
//
//  Created by Vandad Nahavandipoor on 21/03/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "VALValidator.h"
#import "VALStringValidator.h"

@interface VALStringLengthValidator : VALStringValidator

@property (nonatomic, unsafe_unretained) NSUInteger minimumRequiredLength;
@property (nonatomic, unsafe_unretained) NSUInteger maximumAllowedLength;

/*
 Designated Initializer.
 */
- (id) initWithMinimumRequiredLength:(NSUInteger)paramMinimumRequiredLength
                maximumAllowedLength:(NSInteger)paramMaximumAllowedLength;

/*
 Convenience Method.
 */
+ (id) newWithMinimumRequiredLength:(NSUInteger)paramMinimumRequiredLength
               maximumAllowedLength:(NSInteger)paramMaximumAllowedLength;

/*
 Inherited from the superclass.
 */
- (BOOL) isValidObject:(id)paramObject outputError:(NSError *__autoreleasing *)paramOutputError;

@end
