//
//  NSDate+match.m
//
//
//  Created by Santiago Bustamante on 11/21/13.
//  Copyright (c) 2013 Busta. All rights reserved.
//

#import "NSDate+match.h"

@implementation NSDate (match)


#pragma mark - conversion section
-(NSString *)stringWithFormat:(NSString *)format {
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    
    return [formatter stringFromDate:self];
}


+(NSDate *)dateFromString:(NSString*)string withFormat:(NSString *)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    NSDate *capturedStartDate = [dateFormatter dateFromString: string];
    return capturedStartDate;
}


#pragma mark - day section

- (BOOL)isSameDayThanDate:(NSDate*)date {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:self];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date];
    
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}


- (NSDate *)nextDay{
    // start by retrieving day, weekday, month and year components for yourDate
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    
    // now build a NSDate object for the next day
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:1];
    NSDate *nextDate = [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];

    return nextDate;
}

- (NSDate *)lastDay{
    // start by retrieving day, weekday, month and year components for yourDate
    NSCalendar *gregorian = [NSCalendar currentCalendar];

    // now build a NSDate object for the next day
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:-1];
    NSDate *nextDate = [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
    
    return nextDate;
}



#pragma mark - week section

- (BOOL)isSameWeekThanDate:(NSDate*)date {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitWeekOfYear;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:[self firstDayOfWeek]];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:[date firstDayOfWeek]];
    
    return [comp1 month] == [comp2 month] && [comp1 year]  == [comp2 year] && [comp1 weekOfYear]  == [comp2 weekOfYear];
}


- (NSDate *)firstDayOfWeek{
    return [self firstDayOfWeekStartingMonday:YES];
}


- (NSDate *)firstDayOfWeekStartingMonday:(BOOL)weekStartMonday{
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitWeekday fromDate:self];
    
    
    NSInteger weekdayoffset1 = (weekStartMonday) ? 2:1;
    
    NSDateComponents *componentsToSubtract  = [[NSDateComponents alloc] init];
    [componentsToSubtract setDay: (0 - ([weekdayComponents weekday] == 1 ? 8 : [weekdayComponents weekday])) + weekdayoffset1];
    
    NSDate *beginningOfWeek = [gregorian dateByAddingComponents:componentsToSubtract toDate:self options:0];
    return beginningOfWeek;
}



- (NSDate *)lastDayOfWeek{
    return [self lastDayOfWeekStartingMonday:YES];
}

- (NSDate *)lastDayOfWeekStartingMonday:(BOOL)weekStartMonday{
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    
    NSDateComponents *componentsToAdd = [gregorian components:NSDayCalendarUnit fromDate:[self firstDayOfWeekStartingMonday:weekStartMonday]];
    [componentsToAdd setDay:6];
    NSDate *endOfWeek = [gregorian dateByAddingComponents:componentsToAdd toDate:[self firstDayOfWeekStartingMonday:weekStartMonday] options:0];
    
    return endOfWeek;
}


- (NSDate *)nextWeek{
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    
    // now build a NSDate object for the next week
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:7];
    NSDate *nextDate = [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
    
    return nextDate;
}

- (NSDate *)lastWeek{
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    
    // now build a NSDate object for the next week
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:-7];
    NSDate *nextDate = [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
    
    return nextDate;
}

- (BOOL) isSameWeekday:(int)numDayIn{
    numDayIn += 2;
    numDayIn = numDayIn == 8 ? 1 : numDayIn;
    
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSCalendarUnitWeekday;
    NSDateComponents *comp1 = [calendar components:unitFlags fromDate:self];
    
    NSInteger day = [comp1 weekday];
    return day == numDayIn;
}

#pragma mark - month section

- (BOOL)isSameMonthThanDate:(NSDate*)date {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitWeekOfYear;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:self];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date];
    
    return [comp1 month] == [comp2 month] && [comp1 year]  == [comp2 year];
}



- (NSDate *)nextMonth{
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    
    // now build a NSDate object for the next day
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:1];
    NSDate *nextDate = [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
    
    return nextDate;
}

- (NSDate *)lastMonth{
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    
    // now build a NSDate object for the next day
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:-1];
    NSDate *nextDate = [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
    
    return nextDate;
}


- (NSString *) monthNameComplete{
    NSArray *months =@[@"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December"];
    
    NSString *dateStr = [self stringWithFormat:@"M"];
    return months[[dateStr intValue]-1];
}


- (NSString *) monthNameShort{
    NSArray *months =@[@"Jan.",@"Feb.",@"Mar.",@"Apr.",@"May.",@"Jun.",@"Jul.",@"Aug.",@"Sep.",@"Oct.",@"Nov.",@"Dec."];
    
    NSString *dateStr = [self stringWithFormat:@"M"];
    return months[[dateStr intValue]-1];
}

- (NSString *) monthNameShortSpanish{
    NSArray *months =@[@"Ene",@"Feb",@"Mar",@"Abr",@"May",@"Jun",@"Jul",@"Ago",@"Sep",@"Oct",@"Nov",@"Dic"];
    
    NSString *dateStr = [self stringWithFormat:@"M"];
    return months[[dateStr intValue]-1];
}

- (BOOL) isSameMonthday:(int)numDayIn{
    numDayIn += 1;
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSCalendarUnitDay;
    NSDateComponents *comp1 = [calendar components:unitFlags fromDate:self];
    
    NSInteger day = [comp1 day];
    return day == numDayIn;
}


#pragma mark - hour section

- (BOOL) isSameHour:(int) hourIn{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour) fromDate:self];
    NSInteger hour = [components hour];
    
    if (hour >= hourIn && hour < hourIn+1) {
        return YES;
    }
    return NO;
    
}

- (BOOL) isSameHourThanDate:(NSDate*)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp1 = [calendar components:(NSCalendarUnitHour) fromDate:self];
    NSDateComponents* comp2 = [calendar components:(NSCalendarUnitHour) fromDate:date];
    
    return [comp1 hour]  == [comp2 hour];
    
}



#pragma mark - year section
- (BOOL)isSameYearThanDate:(NSDate*)date{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSCalendarUnitYear;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:self];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date];
    
    return [comp1 year]  == [comp2 year];
}


@end
