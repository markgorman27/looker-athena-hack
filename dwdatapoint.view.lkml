view: dwdatapoint {
  sql_table_name: metrics_wba_dev.dwdatapoint ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: data_point_code {
    type: string
    sql: ${TABLE}.data_point_code ;;
  }

  dimension: data_type {
    type: string
    sql: ${TABLE}.data_type ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: good_high_low_nocolor {
    type: string
    sql: ${TABLE}.good_high_low_nocolor ;;
  }

  dimension: human_name {
    type: string
    sql: ${TABLE}.human_name ;;
  }

  dimension: measure_name {
    type: string
    sql: ${TABLE}.measure_name ;;
  }

  dimension: precision {
    type: string
    sql: ${TABLE}.precision ;;
  }

  dimension: shift {
    type: string
    sql: ${TABLE}.shift ;;
  }

  dimension: unit {
    type: string
    sql: ${TABLE}.unit ;;
  }
}
