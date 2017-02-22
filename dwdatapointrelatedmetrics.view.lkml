view: dwdatapointrelatedmetrics {
  sql_table_name: metrics_wba_dev.dwdatapointrelatedmetrics ;;
  suggestions: no

  dimension: measure_name {
    type: string
    sql: ${TABLE}.measure_name ;;
  }

  dimension: related_measure_name {
    type: string
    sql: ${TABLE}.related_measure_name ;;
  }

  dimension: relrank {
    type: number
    sql: ${TABLE}.relrank ;;
  }

  measure: count {
    type: count
    drill_fields: [measure_name, related_measure_name]
  }
}
