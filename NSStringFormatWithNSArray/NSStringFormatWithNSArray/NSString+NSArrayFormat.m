//
//  NSString+NSArrayFormat.m
//  NSStringFormatWithNSArray
//
//  Created by david on 20/06/15.
//  Copyright (c) 2015 Comunity. All rights reserved.
//

#import "NSString+NSArrayFormat.h"

@implementation NSString (NSArrayFormat)

+ (NSString *)stringWithFormat:(NSString *)format arrayArguments:(NSArray *)arrayArguments {
    static NSString *objectSpecifier = @"%@"; // static is redunant because compiler will optimize this string to have same address
    NSMutableString *string = [[NSMutableString alloc] init]; // here we'll create the string
    NSRange searchRange = NSMakeRange(0, [format length]);
    NSRange rangeOfPlaceholder = NSMakeRange(NSNotFound, 0); // variables are declared here because they're needed for NSAsserts
    NSUInteger index;
    for (index = 0; index < [arrayArguments count]; ++index) {
        rangeOfPlaceholder = [format rangeOfString:objectSpecifier options:0 range:searchRange]; // find next object specifier
        if (rangeOfPlaceholder.location != NSNotFound) { // if we found one
            NSRange substringRange = NSMakeRange(searchRange.location, rangeOfPlaceholder.location - searchRange.location);
            NSString *formatSubstring = [format substringWithRange:substringRange];
            [string appendString:formatSubstring]; // copy the format from previous specifier up to this one
            NSObject *object = [arrayArguments objectAtIndex:index];
            NSString *objectDescription = [object description]; // convert object into string
            [string appendString:objectDescription];
            searchRange.location = rangeOfPlaceholder.location + [objectSpecifier length]; // update the search range in order to minimize search
            searchRange.length = [format length] - searchRange.location;
        } else {
            break;
        }
    }
    if (rangeOfPlaceholder.location != NSNotFound) { // we need to check if format still specifiers
        rangeOfPlaceholder = [format rangeOfString:@"%@" options:0 range:searchRange];
    }
    NSAssert(rangeOfPlaceholder.location == NSNotFound, @"arrayArguments doesn't have enough objects to fill specified format");
    NSAssert(index == [arrayArguments count], @"Objects starting with index %lu from arrayArguments have been ignored because there aren't enough object specifiers!", index);
    return string;
}

+ (NSString *)stringWithFormat2:(NSString *)format arrayArguments:(NSArray *)arrayArguments { // same as function above but uses stringByReplacingCharactersInRange:
    static NSString *objectSpecifier = @"%@";
    NSRange searchRange = NSMakeRange(0, [format length]);
    NSRange rangeOfPlaceholder;
    NSUInteger index = 0;
    for (NSUInteger index = 0; index < [arrayArguments count]; ++index) {
        rangeOfPlaceholder = [format rangeOfString:objectSpecifier options:0 range:searchRange];
        if (rangeOfPlaceholder.location != NSNotFound) {
            searchRange.location = rangeOfPlaceholder.location + [objectSpecifier length];
            NSRange replaceRange = NSMakeRange(rangeOfPlaceholder.location, [objectSpecifier length]);
            NSObject *object = [arrayArguments objectAtIndex:index];
            NSString *objectDescription = [object description];
            format = [format stringByReplacingCharactersInRange:replaceRange withString:objectDescription];
            searchRange.location = rangeOfPlaceholder.location + [objectDescription length];
            searchRange.length = [format length] - searchRange.location;
        } else {
            break;
        }
    }
    if (rangeOfPlaceholder.location != NSNotFound) {
        rangeOfPlaceholder = [format rangeOfString:@"%@" options:0 range:searchRange];
    }
    NSAssert(rangeOfPlaceholder.location == NSNotFound, @"arrayArguments doesn't have enough objects to fill specified format");
    NSAssert(index == [arrayArguments count], @"Objects starting with index %lu from arrayArguments have been ignored because there aren't enough object specifiers!", index);
    return format;
}

@end
