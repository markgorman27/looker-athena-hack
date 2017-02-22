view: dim_comparison_suggestions {
  sql_table_name: metrics_wba_dev.dim_comparison_suggestions ;;
  suggestions: no

  dimension: compare {
    type: string
    hidden: no
    sql: ${TABLE}.compare ;;
  }
}
