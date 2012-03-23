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

- (void) testIsValidObjectWithDisallowedCharactersAndNoStringComparingOptions{
  
  /* Form a character set of upper and lower case characters */
  NSMutableCharacterSet *disallowedCharacters = [[NSMutableCharacterSet alloc] init];
  [disallowedCharacters formUnionWithCharacterSet:[NSCharacterSet lowercaseLetterCharacterSet]];
  [disallowedCharacters formUnionWithCharacterSet:[NSCharacterSet uppercaseLetterCharacterSet]];
  
  VALStringCharacterValidator *validator = [[VALStringCharacterValidator alloc] initWithDisallowedCharactersInSet:disallowedCharacters
                                                                                           stringComparingOptions:0];
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
  
}

- (void) testIsValidObjectWithDisallowedCharactersAndNoStringComparingOptionsAndNilParameters{
  
  VALStringCharacterValidator *validator = [[VALStringCharacterValidator alloc] initWithDisallowedCharactersInSet:nil
                                                                                           stringComparingOptions:0];
  STAssertFalse([validator isValidObject:nil outputError:nil], @"A nil object is not valid.");
  
}

- (void) testIsValidObjectWithDisallowedCharactersAndCaseInsensitiveStringComparingOptions{
  /* Do not allow lower-case letters */
  NSMutableCharacterSet *disallowedCharacters = [[NSMutableCharacterSet alloc] init];
  [disallowedCharacters formUnionWithCharacterSet:[NSCharacterSet lowercaseLetterCharacterSet]];
  
  /* Don't allow lower-case or upper-case letters (look at option!) */
  VALStringCharacterValidator *validator = [[VALStringCharacterValidator alloc] initWithDisallowedCharactersInSet:disallowedCharacters
                                                                                           stringComparingOptions:NSCaseInsensitiveSearch];
  NSError *error = nil;
  
  STAssertFalse([validator isValidObject:@"abc" outputError:&error], @"Lower or upper-case letters should NOT be allowed");
  STAssertFalse([validator isValidObject:@"abC" outputError:&error], @"Lower or upper-case letters should NOT be allowed");
  STAssertFalse([validator isValidObject:@"ABC" outputError:&error], @"Lower or upper-case letters should NOT be allowed");
  STAssertFalse([validator isValidObject:@"ab1" outputError:&error], @"Lower or upper-case letters should NOT be allowed");
  STAssertFalse([validator isValidObject:@"AB1" outputError:&error], @"Lower or upper-case letters should NOT be allowed");
  STAssertFalse([validator isValidObject:@"aB1" outputError:&error], @"Lower or upper-case letters should NOT be allowed");
  STAssertTrue([validator isValidObject:@"111" outputError:&error], @"Numbers are perfectly fine and should be allowed.");
  STAssertFalse([validator isValidObject:@"22a" outputError:&error], @"Lower or upper-case letters should NOT be allowed");
  STAssertTrue([validator isValidObject:@"..." outputError:&error], @"This contains neither a lower or an upper case letter, and should be fine.");
  STAssertFalse([validator isValidObject:@"p[]" outputError:&error], @"Lower or upper-case letters should NOT be allowed");
  STAssertTrue([validator isValidObject:@"@#$" outputError:&error], @"This contains neither a lower or an upper case letter, and should be fine.");
  STAssertFalse([validator isValidObject:@"A2#" outputError:&error], @"Lower or upper-case letters should NOT be allowed");
}

@end
