//
//  VALStringLengthValidator.m
//  iOS Validators
//
//  Created by Vandad Nahavandipoor on 21/03/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "VALStringLengthValidator.h"

@implementation VALStringLengthValidator

@synthesize minimumRequiredLength;
@synthesize maximumAllowedLength;

- (id) initWithMinimumRequiredLength:(NSUInteger)paramMinimumRequiredLength
                maximumAllowedLength:(NSInteger)paramMaximumAllowedLength{
  
  self = [super init];
  
  if (self != nil){
    minimumRequiredLength = paramMinimumRequiredLength;
    maximumAllowedLength = paramMaximumAllowedLength;
  }
  
  return self;
  
}

+ (id) newWithMinimumRequiredLength:(NSUInteger)paramMinimumRequiredLength
               maximumAllowedLength:(NSInteger)paramMaximumAllowedLength{
  return [[self alloc] initWithMinimumRequiredLength:paramMinimumRequiredLength maximumAllowedLength:paramMaximumAllowedLength];
}

- (BOOL) isValidObject:(id)paramObject outputError:(NSError *__autoreleasing *)paramOutputError{
  
  BOOL result = NO;
  
  if ([super isValidObject:paramObject outputError:paramOutputError] == NO){
    return NO;
  }
  
  NSString *string = (NSString *)paramObject;
  if ([string length] >= self.minimumRequiredLength &&
      [string length] <= self.maximumAllowedLength){
    result = YES;
  } else {
    result = NO;
  }
  
  return result;
  
}

@end
