//
//  VALStringCharacterValidator.m
//  iOS Validators
//
//  Created by Vandad Nahavandipoor on 23/03/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "VALStringCharacterValidator.h"

@implementation VALStringCharacterValidator

@synthesize characterSetDisallowed;
@synthesize stringComparingOptions;

/* Designated Initializer */
- (id) initWithDisallowedCharactersInSet:(NSCharacterSet *)paramDisallowedCharacterSet 
                  stringComparingOptions:(NSStringCompareOptions)paramStringComparingOptions;{
  
  self = [super init];
  
  if (self != nil){
    characterSetDisallowed = paramDisallowedCharacterSet;
    stringComparingOptions = paramStringComparingOptions;
  }
  
  return self;
  
}

/* Convenience Methods */
+ (id) newWithDisallowedCharactersInSet:(NSCharacterSet *)paramDisallowedCharacterSet
                 stringComparingOptions:(NSStringCompareOptions)paramStringComparingOptions{
  
  return [[self alloc] initWithDisallowedCharactersInSet:paramDisallowedCharacterSet 
                                  stringComparingOptions:paramStringComparingOptions];
  
}

/* Inherited */
- (BOOL) isValidObject:(id)paramObject outputError:(__autoreleasing NSError **)paramOutputError{
  
  BOOL result = NO;
  
  if ([super isValidObject:paramObject outputError:paramOutputError] == NO){
    return NO;
  }
  
  NSString *string = (NSString *)paramObject;
  
  NSRange rangeOfDisallowedCharacters = [string rangeOfCharacterFromSet:self.characterSetDisallowed 
                                                                options:self.stringComparingOptions];
  
  if (rangeOfDisallowedCharacters.location == NSNotFound &&
      rangeOfDisallowedCharacters.length == 0){
    result = YES;
  } else {
    result = NO;
  }
  
  return result;
  
}

@end
