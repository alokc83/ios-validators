//
//  VALValidator.m
//  iOS Validators
//
//  Created by Vandad Nahavandipoor on 21/03/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "VALValidator.h"

@implementation VALValidator

- (BOOL) isValidObject:(id)paramObject outputError:(__autoreleasing NSError **)paramOutputError{
  
  BOOL result = YES;
  
  if (paramObject == nil){
    return NO;
  }
  
  return result;
}

@end
