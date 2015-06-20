//
//  NSString+NSArrayFormat.h
//  NSStringFormatWithNSArray
//
//  Created by david on 20/06/15.
//  Copyright (c) 2015 Comunity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSArrayFormat)

+ (NSString *)stringWithFormat:(NSString *)format arrayArguments:(NSArray *)arrayArguments;
+ (NSString *)stringWithFormat2:(NSString *)format arrayArguments:(NSArray *)arrayArguments;

@end
