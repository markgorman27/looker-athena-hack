view: dim_constants {
  sql_table_name: metrics_wba_dev.dim_constants ;;
  suggestions: no

  dimension: d360_base_url {
    type: string
    sql: ${TABLE}.d360_base_url ;;
  }

  dimension: wp_base_url {
    type: string
    sql: ${TABLE}.wp_base_url ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
