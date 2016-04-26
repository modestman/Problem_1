//
//  main.m
//  Problem_1
//
//  Created by Admin on 26.04.16.
//  Copyright © 2016 Anton Glezman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utils.h"

// declaration
void solveProblemWithArray(NSArray* array);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // make the array with random numbers
        NSArray *array = [Utils fillRandomIntArrayWithCapacity:10 min:-10 max:10];
        
        // print the array
        [Utils printArray:array];
        
        solveProblemWithArray(array);
    }
    return 0;
}

// implementation
void solveProblemWithArray(NSArray* array)
{
    if ([array count] == 0)
    {
        NSLog(@"Array is empty");
        return;
    }
    
    // The dictionary will be contain the number as a key and counter as a value
    NSMutableDictionary *duplicates = [NSMutableDictionary new];
    
    // min and max values from the array
    int min = [array[0] intValue];
    int max = [array[0] intValue];
    
    // find min and max, and fill the dictionary
    for (int i = 0; i < [array count]; i++)
    {
        NSNumber *number = array[i];
        int n = [number intValue];
        if (n > max)
            max = n;
        if (n < min)
            min = n;
        
        // if dictionary contains the number then increment its counter, else set the counter value is 1
        NSNumber *counter = @1;
        if (duplicates[number] != nil)
        {
            counter = [NSNumber numberWithInt:([duplicates[number] intValue] + 1)];
        }
        [duplicates setObject:counter forKey:number];
    }
    
    // Output results
    NSLog(@"Range is %d to %d", min, max);
    
    NSLog(@"Missing Numbers:");
    for (int i = min; i < max; i++)
    {
        NSNumber *number = [NSNumber numberWithInt:i];
        if (duplicates[number] != nil)
            continue;
        else
            NSLog(@"%d\n", i);
    }
    
    NSLog(@"Duplicate Numbers:");
    for (NSNumber *number in [duplicates allKeys])
    {
        NSLog(@"%@ appears %@ times", number, duplicates[number]);
    }
}