datagroup: daily_refresh {
  sql_trigger: SELECT CURRENT_DATE() ;;
}

datagroup: always_refresh {
  sql_trigger: SELECT CURRENT_TIMESTAMP() ;;
}

datagroup: hourly_refresh {
  sql_trigger: SELECT DATE_TRUNC(HOUR,CURRENT_TIMESTAMP()) ;;
}


datagroup: do_not_update {
  sql_trigger: SELECT 1 ;;
}

datagroup: sunday_refresh {
  #2021-03-21 was a sunday
  sql_trigger: SELECT FLOOR(DATEDIFF(DAY, '2021-03-21', CURRENT_DATE())/7)  ;;
}

datagroup: schedule_bi_weekly_monday_0600 {
  sql_trigger: SELECT FLOOR(DATEDIFF(HOUR, '2021-03-22 06:00:00'::TIMESTAMP, CURRENT_TIMESTAMP()) / (24 * 14)) ;;
}
