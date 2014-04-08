NSDate-Match
============

NSDate comparations and extens 

#### Podfile

```ruby
pod "NSDate+Match"
```

####Methods

```objective-c
+(NSDate *)dateFromString:(NSString*)string withFormat:(NSString *)format;
-(NSString *)stringWithFormat:(NSString *)format;

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
```
