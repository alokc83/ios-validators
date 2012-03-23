//
//  VALStringValidator.m
//  iOS Validators
//
//  Created by Vandad Nahavandipoor on 23/03/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "VALStringValidator.h"

@implementation VALStringValidator

- (BOOL) isValidObject:(id)paramObject outputError:(NSError *__autoreleasing *)paramOutputError{
  
  BOOL result = YES;
  
  if ([super isValidObject:paramObject outputError:paramOutputError] == NO){
    return NO;
  }
  
  /* Make sure we are getting a string object first */
  if ([paramObject isKindOfClass:[NSString class]] == NO){
    return NO;
  }
  
  return result;
  
}

@end
