view: snowflake_history {
  label: "Snowflake Query Status (last hour)"
  derived_table: {
  sql: select *
       from table(
              information_schema.query_history_by_user('Looker'
                                             , end_time_range_start=>dateadd(second, -3660, current_timestamp())                                             )
              )
       where query_text not like 'WITH snowflake_history AS%'
       and query_text not like 'SELECT reg_key, looker, created_at%'
       and query_text not like 'DROP TABLE LOOKER_SCRATCH%'
       and query_text not like 'SELECT 1%'
       and query_text != 'show /* JDBC:DatabaseMetaData.getTables() */ tables in account'
       and query_text != 'SELECT current_session()'
       and query_text not like 'CALL SYSTEM$%'
      ;;

  }

  dimension: database_name {}
  dimension: execution_status {}
  dimension_group: start_time {
    group_label: "Start Time"
    label: "Start"
    type: time
    timeframes: [hour, minute, time]
  }
  dimension: total_elapsed_time {
    type: number
    sql: total_elapsed_time / 60 / 60 / 24 ;;
    value_format_name: duration_hms
  }
  dimension: query_text {}

  measure: count {
    type: count
  }
}
