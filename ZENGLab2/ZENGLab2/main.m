//
//  main.c
//  ZENGLab2
//
//  Created by Li Zeng on 1/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <Foundation/Foundation.h>

void PrintMDict() {
    NSLog(@"Section 1");
    // create and initialize the dictionary
    NSMutableDictionary *mDict = [NSMutableDictionary dictionary];
    [mDict setValue: [NSNumber numberWithInt: 1] forKey:@"Centimeter"];
    [mDict setValue: [NSNumber numberWithInt: 4] forKey:@"Pound"];
    [mDict setValue: [NSNumber numberWithInt: 4] forKey:@"Ounce"];
    [mDict setValue: [NSNumber numberWithInt: 2] forKey:@"Kilogram"];
    [mDict setValue: [NSNumber numberWithInt: 3] forKey:@"Yard"];
    [mDict setValue: [NSNumber numberWithInt: 1] forKey:@"Millimeter"];
    [mDict setValue: [NSNumber numberWithInt: 1] forKey:@"Kilometer"];
    
    // enumerate
    for (NSString* key in mDict) {
        if ([key hasSuffix:@"meter"]) {
            NSLog(@"%ld", [[mDict valueForKey: key] integerValue]);
        }
    }
}

void PrintSet() {
    NSLog(@"Section 2");
    // create and initialize the sets
    NSSet *set0 = [NSSet setWithArray: @[@5, @3, @2, @9, @2, @9, @7]];
    NSSet *set1 = [NSSet setWithArray: @[@3, @9, @2, @7, @7]];
    
    NSLog(@"(1) %d", [set0 isSubsetOfSet: set1]);
    NSLog(@"(2) %d", [set1 isSubsetOfSet: set0]);
    NSLog(@"(3) %d", [set0 containsObject: [NSNumber numberWithInteger: 4]]);
    NSLog(@"(4) %d", [set1 containsObject: [NSNumber numberWithInteger: 2]]);
    NSLog(@"(5) %d", [set1 intersectsSet: set0]);
}

void PrintDate() {
    NSLog(@"Section 3");
    // create and define date format
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"MM/dd/yyyy"];
    
    NSDate *today = [NSDate date];
    NSDate *eightDayAgo = [today dateByAddingTimeInterval: -8*24*60*60];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:NSWeekdayCalendarUnit fromDate:today];
    
    NSLog(@"(1) %@", [dateFormatter stringFromDate: today]);
    NSLog(@"(2) %@", [dateFormatter stringFromDate: eightDayAgo]);
    NSLog(@"(3) %@", [dateFormatter stringFromDate: [today dateByAddingTimeInterval:(-1)*([comps weekday] + 4)*24*60*60]]);
    NSLog(@"(4) %@", [dateFormatter stringFromDate:[[NSDate dateWithString:@"2012-8-27 24:0:0 +0"] earlierDate:[NSDate dateWithString:@"2012-9-13 24:0:0 +0"]]]);
    NSLog(@"(5) %@", [dateFormatter stringFromDate:[[NSDate dateWithString:@"2012-1-10 24:0:0 +0"] laterDate:[NSDate dateWithString:@"2011-12-20 24:0:0 +0"]]]);

}

void PrintRNumb() {
    NSLog(@"Section 4");
    NSArray *number = @[@"Zero", @"One", @"Two", @"Three", @"Four", @"Five", @"Six", @"Seven", @"Eight", @"Nine"];
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        int rdNumber = arc4random_uniform(9);
        [result addObject:number[rdNumber]];
    }
    for (id val in result) {
        NSLog(@"%@", val);
    }
}


int main(int argc, const char * argv[])
{
    // insert code here...
    @autoreleasepool {
        PrintMDict();
        PrintSet();
        PrintDate();
        PrintRNumb();
    }
    return 0;
}










