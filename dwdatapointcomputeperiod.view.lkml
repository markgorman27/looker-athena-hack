view: dwdatapointcomputeperiod {
  sql_table_name: metrics_wba_dev.dwdatapointcomputeperiod ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.measure_name || ${TABLE}.computeperiod ;;
  }

  dimension: computeperiod {
    type: string
    sql: ${TABLE}.computeperiod ;;
  }

  dimension: measure_name {
    type: string
    sql: ${TABLE}.measure_name ;;
  }
}
