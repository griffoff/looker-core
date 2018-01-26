# definition of fivetran audit table
# with additional [optional] metrics
view: fivetran_audit_base {
  label: "FiveTran Sync Audit"
#  sql_table_name: MT_NB.FIVETRAN_AUDIT ;;
#   derived_table: {
#     sql:
#       with audit as (
#         select *
#         from PROD_ONEDRIVE.FIVETRAN_AUDIT
#         union all
#         select *
#         from PROD_CLHM.FIVETRAN_AUDIT
#         union all
#         select *
#         from mt_nb.FIVETRAN_AUDIT
#         union all
#         select *
#         from prod_nb.FIVETRAN_AUDIT
#       )
#     select
#         *
#         ,row_number() over (partition by "TABLE" order by "START") as update_no
#         ,case when lead(done) over(partition by schema, "TABLE" order by done) is null then True end as latest
#         ,convert_timezone('EST', min("START") over (partition by update_id)) as update_start_time
#         ,convert_timezone('EST', max(done) over (partition by update_id)) as update_finish_time
#      from audit
#       ;;
#   }
  #

  set: table_sync_details {
    fields: [schema, table, start_time, done_time, duration_days, message, status, rows_updated_or_inserted, update_recency]
  }

### additional fields that are not in the raw fivetran audit table, see above for calculations
  dimension: update_start_time {
    type: date_time
    hidden: yes
  }

  dimension: update_finish_time {
    type: date_time
    hidden: yes
  }

  dimension: update_no  {
    type:  number
    hidden: yes
  }

  dimension: initial_sync {
    label: "Initial Sync"
    type:  yesno
    sql: ${update_no} = 1 ;;
    hidden: yes
  }

  dimension: time_elapsed {
    label: "Time Taken for this batch"
    type: number
    sql: datediff(second, ${update_start_time}, ${update_finish_time})/60/60/24 ;;
    value_format_name: duration_hms
    hidden: yes
  }

  measure: time_elapsed_sum {
    label: "Cumulative Time Taken"
    type: sum
    sql: ${time_elapsed} ;;
    value_format_name: duration_hms
    hidden: yes
  }

  dimension: latest {
    type: yesno
    hidden: yes
  }

  measure: latest_rows_updated_or_inserted {
    label: "New or Updated Rows in Latest Update"
    type: sum
    sql: case when ${latest} then ${rows_updated_or_inserted_base} end ;;
    hidden: yes
  }

### End of additional fields

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
    hidden:  yes
  }

  dimension: message {
    type: string
    sql: ${TABLE}.MESSAGE ;;
  }

  dimension_group: progress {
    type: time
    timeframes: [raw, date, hour, hour_of_day, day_of_week, time_of_day, minute, month_name, time]
    sql: convert_timezone('EST', ${TABLE}.PROGRESS) ;;
    hidden: yes
  }

  dimension: schema {
    type: string
    sql: ${TABLE}.SCHEMA ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
  }

  dimension: table {
    type: string
    sql: ${TABLE}."TABLE" ;;
  }

  dimension: update_id {
    type: string
    sql: ${TABLE}.UPDATE_ID ;;
    hidden:  yes
  }

  dimension_group: start {
    type: time
    timeframes: [raw, date, hour, hour_of_day, day_of_week, time_of_day, minute, month_name, time]
    sql: convert_timezone('EST', ${TABLE}."START")  ;;
  }

  dimension_group: update_started {
    type: time
    timeframes: [raw, date, hour, hour_of_day, day_of_week, time_of_day, minute, month_name, time]
    sql: convert_timezone('EST', ${TABLE}.UPDATE_STARTED)  ;;
  }

  dimension_group: done {
    label: "Finish"
    type: time
    timeframes: [raw, date, hour, hour_of_day, day_of_week, time_of_day, minute, month_name, time]
    sql: convert_timezone('EST',${TABLE}.DONE) ;;
  }

  dimension: duration_days {
    label: "Duration"
    type: number
    sql: datediff(second, ${start_raw}, ${done_raw})/60/60/24 ;;
    value_format_name: duration_hms
  }

  measure: duration_days_sum {
    label: "Total Time"
    type: sum
    sql: ${duration_days} ;;
    value_format_name: duration_hms
  }

  measure: latest_update_time {
    type: max
    sql: ${done_raw}  ;;
    hidden: yes
  }

  measure: update_recency {
    type: number
    sql:  timediff(minute, ${latest_update_time}, current_timestamp) / 60 / 24 ;;
    value_format_name: duration_dhm
    drill_fields: [table_sync_details*]
  }

  dimension: rows_updated_or_inserted_base {
    type: number
    sql: ${TABLE}.ROWS_UPDATED_OR_INSERTED ;;
  }

  measure: rows_updated_or_inserted {
    type: sum
    sql: ${rows_updated_or_inserted_base} ;;
    drill_fields: [table_sync_details*]
  }

  measure: count {
    type: count
    drill_fields: [table_sync_details*]
  }
}
