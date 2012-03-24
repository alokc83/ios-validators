//
//  VALStringCharacterValidatorTests.m
//  iOS Validators
//
//  Created by Vandad Nahavandipoor on 23/03/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "VALStringCharacterValidatorTests.h"
#import "VALStringCharacterValidator.h"

@implementation VALStringCharacterValidatorTests

- (void) testIsValidObjectWithDisallowedCharacters{
  
  /* Form a character set of upper and lower case characters */
  NSMutableCharacterSet *disallowedCharacters = [[NSMutableCharacterSet alloc] init];
  [disallowedCharacters formUnionWithCharacterSet:[NSCharacterSet lowercaseLetterCharacterSet]];
  [disallowedCharacters formUnionWithCharacterSet:[NSCharacterSet uppercaseLetterCharacterSet]];
  
  VALStringCharacterValidator *validator = [[VALStringCharacterValidator alloc] initWithDisallowedCharactersInSet:disallowedCharacters];
  NSError *error = nil;
  
  STAssertFalse([validator isValidObject:@"ABCDEFG" outputError:&error], @"Alpha characters (upper/lower case) should NOT be accepted.");
  STAssertFalse([validator isValidObject:@"abcdefg" outputError:&error], @"Alpha characters (upper/lower case) should NOT be accepted.");
  STAssertFalse([validator isValidObject:@"abCDEFg" outputError:&error], @"Alpha characters (upper/lower case) should NOT be accepted.");
  STAssertTrue([validator isValidObject:@"12344" outputError:&error], @"Only non-alpha characters should be accepted.");
  STAssertFalse([validator isValidObject:@"abcdefg123456" outputError:&error], @"Alpha characters (upper/lower case) should NOT be accepted.");
  STAssertFalse([validator isValidObject:@"ABCDEFG123456" outputError:&error], @"Alpha characters (upper/lower case) should NOT be accepted.");
  STAssertFalse([validator isValidObject:@"1abcd2" outputError:&error], @"Alpha characters (upper/lower case) should NOT be accepted.");
  STAssertFalse([validator isValidObject:@"1ABCD2" outputError:&error], @"Alpha characters (upper/lower case) should NOT be accepted.");
  STAssertTrue([validator isValidObject:@"!@#$%^&*()_" outputError:&error], @"Non-alpha characters should be accepted.");
  STAssertFalse([validator isValidObject:@"a.a." outputError:&error], @"Alpha characters (upper/lower case) should NOT be accepted.");
  STAssertFalse([validator isValidObject:@"b.B" outputError:&error], @"Alpha characters (upper/lower case) should NOT be accepted.");
  STAssertFalse([validator isValidObject:@"BBBB0" outputError:&error], @"Alpha characters (upper/lower case) should NOT be accepted.");
  STAssertFalse([validator isValidObject:@"abcde " outputError:&error], @"Alpha characters (upper/lower case) should NOT be accepted.");
  STAssertFalse([validator isValidObject:@" abcDEF" outputError:&error], @"Alpha characters (upper/lower case) should NOT be accepted.");
  STAssertFalse([validator isValidObject:@" ABCDEF" outputError:&error], @"Alpha characters (upper/lower case) should NOT be accepted.");
  
  validator.characterSetDisallowed = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
  
  STAssertFalse([validator isValidObject:@"abc" outputError:&error], @"Lower case letters should NOT be allowed");
  STAssertFalse([validator isValidObject:@"abC" outputError:&error], @"Lower case letters should NOT be allowed");
  STAssertTrue([validator isValidObject:@"ABC" outputError:&error], @"Upper-case letters should be allowed");
  STAssertFalse([validator isValidObject:@"ab1" outputError:&error], @"Lower case letters should NOT be allowed");
  STAssertTrue([validator isValidObject:@"AB1" outputError:&error], @"Upper-case letters and numbers should be allowed");
  STAssertFalse([validator isValidObject:@"aB1" outputError:&error], @"Lower case letters should NOT be allowed");
  STAssertTrue([validator isValidObject:@"111" outputError:&error], @"Numbers are perfectly fine and should be allowed.");
  STAssertFalse([validator isValidObject:@"22a" outputError:&error], @"Lower case letters should NOT be allowed");
  STAssertTrue([validator isValidObject:@"..." outputError:&error], @"This doesn't contain a lower-case letter, and should be fine.");
  STAssertFalse([validator isValidObject:@"p[]" outputError:&error], @"Lower case letters should NOT be allowed");
  STAssertTrue([validator isValidObject:@"@#$" outputError:&error], @"This doesn't contain a lower-case letter, and should be fine.");
  STAssertTrue([validator isValidObject:@"A2#" outputError:&error], @"This doesn't contain a lower-case letter, and should be fine.");
  
}

- (void) testIsValidObjectWithDisallowedCharactersAndNilParameters{
  
  VALStringCharacterValidator *validator = [[VALStringCharacterValidator alloc] initWithDisallowedCharactersInSet:nil];
  STAssertFalse([validator isValidObject:nil outputError:nil], @"A nil object is not valid.");
  
}

@end
