//
//  VALValidatorTests.m
//  iOS Validators
//
//  Created by Vandad Nahavandipoor on 21/03/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "VALValidatorTests.h"
#import "VALValidator.h"

@implementation VALValidatorTests

- (void) testIsValidObjectWithNilObjects{
  
  VALValidator *validator = [[VALValidator alloc] init];
  NSError *error = nil;
  STAssertFalse([validator isValidObject:nil outputError:nil], @"The result of this method should be FALSE as the object being validated is nil.");
  STAssertFalse([validator isValidObject:nil outputError:&error], @"The result of this method should be FALSE as the object being validated is nil.");
  
}

- (void) testIsValidObjectWithNonNilObjects{
  
  VALValidator *validator = [[VALValidator alloc] init];
  NSError *error = nil;
  STAssertTrue([validator isValidObject:validator outputError:nil], @"The result of this method should be TRUE.");
  STAssertTrue([validator isValidObject:validator outputError:&error], @"The result of this method should be TRUE.");
  
}

@end
