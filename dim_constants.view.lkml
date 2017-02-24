view: dim_constants {
  sql_table_name: metrics_wba_dev.dim_constants ;;

  dimension: d360_base_url {
    type: string
    hidden: yes
    sql: ${TABLE}.d360_base_url ;;
  }

  dimension: wp_base_url {
    type: string
    hidden:  yes
    sql: ${TABLE}.wp_base_url ;;
  }
}
