view: dwdatapointcomputeperiod {
  sql_table_name: metrics_wba_dev.dwdatapointcomputeperiod ;;
  suggestions: no

  dimension: computeperiod {
    type: string
    sql: ${TABLE}.computeperiod ;;
  }

  dimension: measure_name {
    type: string
    sql: ${TABLE}.measure_name ;;
  }

  measure: count {
    type: count
    drill_fields: [measure_name]
  }
}
