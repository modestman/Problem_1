//
//  Utils.m
//  Problem_1
//
//  Created by Admin on 26.04.16.
//  Copyright © 2016 Anton Glezman. All rights reserved.
//

#import "Utils.h"
#include <stdlib.h>

@implementation Utils

+(void)printArray:(NSArray*)array
{
    if ([array count] == 0)
    {
        NSLog(@"0 objects");
    }
    else
    {
        NSString *str = [array componentsJoinedByString:@", "];
        NSLog(@"%@", str);
    }
}

+(NSArray*)fillRandomIntArrayWithCapacity:(int)capacity min:(int)min max:(int)max
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:capacity];
    for (int i = 0; i<capacity; i++) {
        int r = min + arc4random_uniform(max - min + 1);
        [array addObject:[NSNumber numberWithInt:r]];
    }
    return array;
}

@end
