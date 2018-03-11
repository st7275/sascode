/*
 * Name:        oneLiner_TodayTime
 * Description: A logic that show date and time to today by a line.
 *              Format is is8601dt.
 */

%put %sysfunc(date(), yymmdd10.)T%sysfunc(time(), time8.);
