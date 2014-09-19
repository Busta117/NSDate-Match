NSDate-Match
============

NSDate comparations and extens 

#### Podfile

```ruby
pod "NSDate+Match"
```

####Methods

```objective-c
-(NSString *)stringWithFormat:(NSString *)format;
+(NSDate *)dateFromString:(NSString*)string withFormat:(NSString *)format;

- (BOOL)isSameDayThanDate:(NSDate*)date; //compare day, month and year
- (NSDate *)nextDay;
- (NSDate *)lastDay;

- (BOOL)isSameWeekThanDate:(NSDate*)date; //compare week and year
- (NSDate *)firstDayOfWeek;
- (NSDate *)firstDayOfWeekStartingMonday:(BOOL)weekStartMonday;
- (NSDate *)lastDayOfWeek;
- (NSDate *)lastDayOfWeekStartingMonday:(BOOL)weekStartMonday;

- (NSDate *)nextWeek;
- (NSDate *)lastWeek;
- (BOOL) isSameWeekday:(int)numDayIn;

- (BOOL)isSameMonthThanDate:(NSDate*)date; //compare month and year
- (NSDate *)nextMonth;
- (NSDate *)lastMonth;
- (NSString *) monthNameComplete;
- (NSString *) monthNameShort;
- (NSString *) monthNameShortSpanish;
- (BOOL) isSameMonthday:(int)numDayIn;

- (BOOL) isSameHour:(int) hourIn; //24 hour format
- (BOOL) isSameHourThanDate:(NSDate*)date; //compare only the hour

- (BOOL)isSameYearThanDate:(NSDate*)date; //compare only year
```
