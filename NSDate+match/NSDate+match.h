//
//  NSDate+match.h
//  
//
//  Created by Santiago Bustamante on 11/21/13.
//  Copyright (c) 2013 Busta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (match)

-(NSString *)stringWithFormat:(NSString *)format;
+(NSDate *)dateFromString:(NSString*)string withFormat:(NSString *)format;

- (BOOL)isSameDayThanDate:(NSDate*)date;
- (NSDate *)nextDay;
- (NSDate *)lastDay;

- (BOOL)isSameWeekThanDate:(NSDate*)date;
- (NSDate *)firstDayOfWeek;
- (NSDate *)lastDayOfWeek;
- (NSDate *)nextWeek;
- (NSDate *)lastWeek;
- (BOOL) isSameWeekday:(int)numDayIn;

- (BOOL)isSameMonthThanDate:(NSDate*)date;
- (NSDate *)nextMonth;
- (NSDate *)lastMonth;
- (NSString *) monthNameComplete;
- (NSString *) monthNameShort;
- (NSString *) monthNameShortSpanish;
- (BOOL) isSameMonthday:(int)numDayIn;

- (BOOL) isSameHour:(int) hourIn;

- (BOOL)isSameYearThanDate:(NSDate*)date;

@end
