view: dim_metadata {
  derived_table: {
    sql: select  id,
                 data_point_code,
                 data_type,
                 unit,
                 human_name,
                 precision,
                 shift,
                 description,
                 good_high_low_nocolor,
                 measure_name
            from metrics_wba_dev.dwdatapoint dp
           where {% condition fact_metrics.hero_metric_selector %} measure_name {% endcondition %}
 ;;
  }

  dimension: id {
    type: string
    hidden: no
    sql: ${TABLE}.id ;;
  }

  dimension: data_point_code {
    type:  string
    hidden: no
    sql:  ${TABLE}.data_point_code ;;
  }

  dimension: data_type {
    type:  string
    hidden: no
    sql:  ${TABLE}.data_type ;;
  }

  dimension: unit {
    type:  string
    hidden: no
    sql:  ${TABLE}.unit ;;
  }

  dimension: human_name {
    type:  string
    sql:  ${TABLE}.human_name ;;
  }

  dimension: precision {
    type:  string
    hidden: no
    sql:  ${TABLE}.precision ;;
  }

  dimension: shift {
    type:  string
    hidden: no
    sql:  ${TABLE}.shift ;;
  }

  dimension: description {
    type:  string
    sql:  ${TABLE}.description ;;
  }

  dimension: good_high_low_nocolor {
    type: string
    hidden: no
    sql: ${TABLE}.good_high_low_nocolor ;;
  }

  dimension: measure_name {
    type: string
    hidden: no
    sql: ${TABLE}.measure_name ;;
  }
}
