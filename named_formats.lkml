include: "named_formats.*.lkml"

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
