//
//  VALStringLengthValidatorTests.m
//  iOS Validators
//
//  Created by Vandad Nahavandipoor on 21/03/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "VALStringLengthValidatorTests.h"
#import "VALStringLengthValidator.h"

@implementation VALStringLengthValidatorTests

- (void) testIsValidObjectWithNilObjects{
  
  VALStringLengthValidator *validator = [[VALStringLengthValidator alloc] initWithMinimumRequiredLength:0 maximumAllowedLength:2];
  NSError *error = nil;
  STAssertFalse([validator isValidObject:nil outputError:nil], @"A nil object should come back as invalid.");
  STAssertFalse([validator isValidObject:nil outputError:&error], @"A nil object should come back as invalid.");
  
  NSString *string = nil;
  STAssertFalse([validator isValidObject:string outputError:nil], @"A nil object should come back as invalid.");
  STAssertFalse([validator isValidObject:string outputError:&error], @"A nil object should come back as invalid.");
  
  NSNumber *number = nil;
  STAssertFalse([validator isValidObject:number outputError:nil], @"A nil object should come back as invalid.");
  STAssertFalse([validator isValidObject:number outputError:&error], @"A nil object should come back as invalid.");
  
}
- (void) testIsValidObjectWithEmptyString{
  
  VALStringLengthValidator *validator = [[VALStringLengthValidator alloc] initWithMinimumRequiredLength:0 maximumAllowedLength:2];
  NSError *error = nil;
  
  NSString *string = [[NSString alloc] init];
  STAssertTrue([validator isValidObject:string outputError:nil], @"An empty string with range [0:2] must be valid.");
  STAssertTrue([validator isValidObject:string outputError:&error], @"An empty string with range [0:2] must be valid.");
  
  string = [NSString string];
  STAssertTrue([validator isValidObject:string outputError:nil], @"An empty string with range [0:2] must be valid.");
  STAssertTrue([validator isValidObject:string outputError:&error], @"An empty string with range [0:2] must be valid.");
  
  /* We need at least one character and maximum of 4 characters in the string */
  validator.minimumRequiredLength = 1;
  validator.maximumAllowedLength = 4;
  STAssertFalse([validator isValidObject:string outputError:nil], @"An empty string must fail this test.");
  
}
- (void) testIsValidObjectWithNonStringObjects{
  
  VALStringLengthValidator *validator = [[VALStringLengthValidator alloc] initWithMinimumRequiredLength:0 maximumAllowedLength:2];
  NSError *error = nil;
  
  NSNumber *number = [[NSNumber alloc] initWithInteger:10];
  STAssertFalse([validator isValidObject:number outputError:nil], @"This is a number and not a string, so should NOT be a valid object.");
  STAssertFalse([validator isValidObject:number outputError:&error], @"This is a number and not a string, so should NOT be a valid object.");
  
  NSArray *array = [[NSArray alloc] initWithObjects:number, nil];
  STAssertFalse([validator isValidObject:array outputError:nil], @"This is an array and not a string, so should NOT be a valid object.");
  STAssertFalse([validator isValidObject:array outputError:&error], @"This is an array and not a string, so should NOT be a valid object.");
  
  NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"Pixolity Ltd.", NSLocalizedDescriptionKey, nil];
  STAssertFalse([validator isValidObject:dictionary outputError:nil], @"This is a dictionary and not a string, so should NOT be a valid object.");
  STAssertFalse([validator isValidObject:dictionary outputError:&error], @"This is a dictionary and not a string, so should NOT be a valid object.");
  
}
- (void) testIsValidObjectWithStrings{
  
  VALStringLengthValidator *validator = [[VALStringLengthValidator alloc] initWithMinimumRequiredLength:2 maximumAllowedLength:4];
  NSError *error = nil;
  
  STAssertFalse([validator isValidObject:@"A" outputError:&error], @"This string is 1 character long and fails the criteria [2:4].");
  STAssertTrue([validator isValidObject:@"AB" outputError:&error], @"This string is 2 characters long and passes our criteria [2:4].");
  STAssertTrue([validator isValidObject:@"ABC" outputError:&error], @"This string is 3 characters long and passes our criteria [2:4].");
  STAssertTrue([validator isValidObject:@"ABCD" outputError:&error], @"This string is 3 characters long and passes our criteria [2:4].");
  STAssertFalse([validator isValidObject:@"ABCDE" outputError:&error], @"This string is 5 characters long and fails the criteria [2:4].");
  
}

@end
