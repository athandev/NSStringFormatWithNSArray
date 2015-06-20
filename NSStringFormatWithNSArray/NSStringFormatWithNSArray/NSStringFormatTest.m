
//
//  NSStringFormatText.m
//  NSStringFormatWithNSArray
//
//  Created by david on 20/06/15.
//  Copyright (c) 2015 Comunity. All rights reserved.
//

#import "NSStringFormatTest.h"
#import "NSString+NSArrayFormat.h"

@interface NSStringFormatTest ()

@property (nonatomic) NSString *format;
@property (nonatomic) NSArray *arguments;

@end

@implementation NSStringFormatTest

- (instancetype)init {
    self = [super init];
    
    if (self) {
        NSMutableString *mutableFormat = [[NSMutableString alloc] init];
        const NSUInteger noOfArguments = 1000000;
        for (NSUInteger index = 0; index < noOfArguments; ++index) {
            switch (arc4random_uniform(4)) {
                case 0:
                    [mutableFormat appendString:@"asdsadsadsadasds asdsa asdas asd asd %@"];
                    break;
                case 1:
                    [mutableFormat appendString:@"asdsadsadsadasds asdas  adas asdas%@"];
                    break;
                case 2:
                    [mutableFormat appendString:@"as34t tf23423 5y %@"];
                    break;
                case 3:
                    [mutableFormat appendString:@"asdas %@"];
                    break;
                default:
                    break;
            }
        }
        NSMutableArray *arguments = [[NSMutableArray alloc] init];
        for (NSUInteger index = 0; index < noOfArguments; ++index) {
            if (true) {
                [arguments addObject:@(arc4random())];
            } else {
                switch (arc4random_uniform(4)) {
                    case 0:
                        [arguments addObject:@"asdsadsadsadasds asdsa asdas asd asd"];
                        break;
                    case 1:
                        [arguments addObject:@"asdsadsadsadasds asdas  adas asda"];
                        break;
                    case 2:
                        [arguments addObject:@"as34t tf23423 5y"];
                        break;
                    case 3:
                        [arguments addObject:@"asdas"];
                        break;
                    default:
                        break;
                }
            }
        }
        
        self.format = [mutableFormat copy];
        self.arguments = [arguments copy];
    }
    
    return self;
}

- (void)testFunction {
    if (true) {
        __attribute((unused)) NSString *string = [NSString stringWithFormat:self.format arrayArguments:self.arguments];
    } else {
        __attribute((unused)) NSString *string = [NSString stringWithFormat2:self.format arrayArguments:self.arguments];
    }
}

@end
