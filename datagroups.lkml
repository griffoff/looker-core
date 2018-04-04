datagroup: schedule_bi_weekly_monday_0600 {
  sql_trigger: select floor(datediff(week, '2018-01-22 06:00:00', current_timestamp()) / 2) ;;
}
