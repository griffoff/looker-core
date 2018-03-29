fiscal_month_offset: 3
week_start_day: monday

named_value_format: duration_hms {
  value_format: "hh:mm:ss"
}

named_value_format: duration_dhm {
  value_format: "d \d\a\y\s hh:mm"
}

named_value_format: duration_hms_full {
  value_format: "h \h\r\s m \m\i\n\s s \s\e\c\s"
}

named_value_format: currency {
  value_format: "$#,##0.00"
}

datagroup: schedule_bi_weekly_monday_0600 {
  sql_trigger: select floor(datediff(week, '2018-01-22 06:00:00', current_timestamp()) / 2) ;;
}
