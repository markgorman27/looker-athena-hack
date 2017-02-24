view: dwdatapointrelatedmetrics {
  sql_table_name: metrics_wba_dev.dwdatapointrelatedmetrics ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.measure_name || ${TABLE}.related_measure_name ;;
  }

  dimension: measure_name {
    type: string
    sql: ${TABLE}.measure_name ;;
  }

  dimension: related_measure_name {
    type: string
    sql: ${TABLE}.related_measure_name ;;
  }

  dimension: relrank {
    type: string
    sql: ${TABLE}.relrank ;;
  }
}
