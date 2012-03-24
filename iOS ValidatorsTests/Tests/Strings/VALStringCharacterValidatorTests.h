//
//  VALStringCharacterValidatorTests.h
//  iOS Validators
//
//  Created by Vandad Nahavandipoor on 23/03/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@interface VALStringCharacterValidatorTests : SenTestCase

/*
 Nil values getting sent everywhere to check edge cases.
 */
- (void) testIsValidObjectWithDisallowedCharactersAndNilParameters;

/*
 The proper values getting past to the test.
 */
- (void) testIsValidObjectWithDisallowedCharacters;

@end
