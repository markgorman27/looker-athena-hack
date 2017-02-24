view: dim_comparison_suggestions {
  sql_table_name: metrics_wba_dev.dim_comparison_suggestions ;;

  dimension: compare {
    type: string
    hidden: yes
    sql: ${TABLE}.compare ;;
  }
}
