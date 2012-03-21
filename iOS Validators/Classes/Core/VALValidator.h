//
//  VALValidator.h
//  iOS Validators
//
//  Created by Vandad Nahavandipoor on 21/03/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VALValidator : NSObject

/* All subclasses that override this method, must call this method first and return NO if this method
 returns NO. If this method returns YES, the subclass can continue */
- (BOOL) isValidObject:(id)paramObject outputError:(__autoreleasing NSError **)paramOutputError;

@end
