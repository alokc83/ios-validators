//
//  VALStringLengthValidatorTests.h
//  iOS Validators
//
//  Created by Vandad Nahavandipoor on 21/03/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@interface VALStringLengthValidatorTests : SenTestCase

- (void) testIsValidObjectWithNilObjects;
- (void) testIsValidObjectWithEmptyString;
- (void) testIsValidObjectWithNonStringObjects;
- (void) testIsValidObjectWithStrings;

@end
