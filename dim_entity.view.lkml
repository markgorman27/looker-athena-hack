view: dim_entity {
  sql_table_name: metrics_wba_dev.dim_entity ;;

  dimension: area_id {
    type: string
    sql: ${TABLE}.area_id ;;
  }

  dimension: area_name {
    type: string
    sql: ${TABLE}.area_name ;;
  }

  dimension: district_id {
    type: string
    sql: ${TABLE}.district_id ;;
  }

  dimension: district_name {
    type: string
    sql: ${TABLE}.district_name ;;
  }

  dimension: region_id {
    type: string
    sql: ${TABLE}.region_id ;;
  }

  dimension: region_name {
    type: string
    sql: ${TABLE}.region_name ;;
  }

  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }

  dimension: store_name {
    type: string
    sql: ${TABLE}.store_name ;;
  }

  dimension:  location {
    type:  location
    sql_latitude: ${TABLE}.lat ;;
    sql_longitude: ${TABLE}.lng ;;
  }

  dimension: region_path {
    type:  string
    hidden:  no
    sql: 'WBA/' || ${TABLE}.region_id ;;
  }

  dimension: area_path {
    type:  string
    hidden:  no
    sql: 'WBA/' || ${TABLE}.region_id || '/' || ${TABLE}.area_id ;;
  }

  dimension: district_path {
    type:  string
    hidden: no
    sql: 'WBA/' || ${TABLE}.region_id || '/' || ${TABLE}.area_id || '/' || ${TABLE}.district_id ;;
  }

  dimension: store_path {
    type:  string
    hidden:  no
    sql: 'WBA/' || ${TABLE}.region_id || '/' || ${TABLE}.area_id || '/' || ${TABLE}.district_id || '/' || ${TABLE}.store_id ;;
  }
}
