view: user_location_mapping {
  sql_table_name: metrics_wba_dev.user_location_mapping ;;

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

}
