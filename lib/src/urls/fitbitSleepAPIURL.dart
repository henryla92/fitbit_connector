import '../utils/formats.dart';

import 'fitbitAPIURL.dart';

class FitbitSleepAPIURL extends FitbitAPIURL {
  /// Default constructor
  FitbitSleepAPIURL({String url, String userID})
      : super(
          url: url,
          userID: userID,
        );

  /// Generates a [FitbitSleepAPIURL] to get [FitbitSleepData] of a specific day [date]
  /// and a given user [userID].
  factory FitbitSleepAPIURL.withUserIDAndDay({String userID, DateTime date}){
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitSleepAPIURL(
      url: 'https://api.fitbit.com/1.2/user/$userID/sleep/date/$dateStr.json',
      userID: userID,
    );
  }// FitbitSleepAPIURL.withUserIDAndDay

  /// Generates a [FitbitSleepAPIURL] to get [FitbitSleepData] of a specific date range
  /// between [startDate] and [endDate] of a given user [userID].
  factory FitbitSleepAPIURL.withUserIDAndDateRange({String userID, DateTime startDate, DateTime endDate}){
    String startDateStr = Formats.onlyDayDateFormatTicks.format(startDate);
    String endDateStr = Formats.onlyDayDateFormatTicks.format(endDate);
    return FitbitSleepAPIURL(
      url: 'https://api.fitbit.com/1.2/user/$userID/sleep/date/$startDateStr/$endDateStr.json',
      userID: userID,
    );
  }// FitbitSleepAPIURL.withUserIDAndDateRange

  /// Generates a [FitbitSleepAPIURL] to get the [FitbitSleepData] list of a user [userId].
  /// before a given day [date]. Maximum [limit] sleep logs are returned. 
  /// The resulting entries are ordered descending.
  /// 
  factory FitbitSleepAPIURL.listWithUserIDAndBeforeDate({String userID, DateTime beforeDate, int limit}){
    String beforeDateStr = Formats.onlyDayDateFormatTicks.format(beforeDate);
    return FitbitSleepAPIURL(
      url: 'https://api.fitbit.com/1.2/user/$userID/sleep/list.json?beforeDate=$beforeDateStr&sort=desc&offset=0&limit=$limit',
      userID: userID,
    );
  }// FitbitSleepAPIURL.listWithUserIDAndBeforeDate

  /// Generates a [FitbitSleepAPIURL] to get the [FitbitSleepData] list of a user [userId].
  /// after a given day [date]. Maximum [limit] sleep logs are returned. 
  /// The resulting entries are ordered ascending.
  /// 
  factory FitbitSleepAPIURL.listWithUserIDAndAfterDate({String userID, DateTime afterDate, int limit}){
    String afterDateStr = Formats.onlyDayDateFormatTicks.format(afterDate);
    return FitbitSleepAPIURL(
      url: 'https://api.fitbit.com/1.2/user/$userID/sleep/list.json?beforeDate=$afterDateStr&sort=asc&offset=0&limit=$limit',
      userID: userID,
    );
  }// FitbitSleepAPIURL.listWithUserIDAndAfterDate


} // FitbitSleepAPIURL
