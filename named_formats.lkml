# explore: date_test {}
# view: date_test {
#   derived_table: {
#     sql: select datediff(milliseconds, '2021-03-16 14:52:32'::timestamp, current_timestamp()) / (1000 * 60 * 60 * 24) as date ;;
#   }

#   measure: date {
#     type: sum
#     value_format: "d \d\a\y\s" # 1 dayys
#     #value_format: "d \d\a\y\s h"

#   }
# }


# these two formats are creating validation issues - with look support
named_value_format: duration_mdh {
  #value_format: "M m\o\n\t\h\s d \da\y\s h \h\ou\r\s"
  value_format: "M:dd:hh"
}

named_value_format: duration_dhm {
#  value_format: "d \d\a\y\s hh:mm"
  value_format: "d \d\a\y\s hh:mm:ss"
}
################################

named_value_format: duration_hms {
  value_format: "[h]:mm:ss"
}

named_value_format: duration_minutes {
  value_format: "[m]:ss \mi\n\s"
}

named_value_format: duration_days {
  #value_format: "d \da\y\s h \hr\s m \mi\n\s s \sec\s"
  value_format: "d \d\a\y\s"
}

named_value_format: duration_ymd {
  value_format: "Y \y\e\a\r M \m\o\n\t\h\s d \d\a\y\s"
}

named_value_format: duration_hms_full {
  value_format: "[h] \h\r\s m \mi\n\s s \s\e\c\s"
}

named_value_format: currency {
  value_format: "$#,##0.00"
}

named_value_format: TB_1{
  value_format: "#,##0.0 \T\B"
}

named_value_format: MB{
  value_format: "#,##0 \M\B"
}
