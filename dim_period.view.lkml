view: dim_period {
  sql_table_name: metrics_wba_dev.dim_period ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.computeperiod || ${TABLE}.toperiod ;;
  }

  dimension: computeperiod {
    type: string
    sql: ${TABLE}.computeperiod ;;
  }

  dimension: computeyear {
    type: number
    hidden: yes
    sql: ${TABLE}.computeyear ;;
  }

  dimension: fromperiod {
    type: date
    hidden: yes
    sql: ${TABLE}.fromperiod ;;
  }

  dimension: toperiod {
    type: date
    sql: ${TABLE}.toperiod ;;
  }

  dimension: total_days {
    type: number
    hidden: yes
    sql: ${TABLE}.total_days ;;
  }

  dimension: prior_period_computeyear {
    type: number
    hidden: yes
    sql: ${TABLE}.pp_computeyear ;;
  }

  dimension: prior_period_fromperiod {
    type: date
    hidden: yes
    sql: ${TABLE}.pp_fromperiod ;;
  }

  dimension: prior_period_toperiod {
    type: date
    hidden: yes
    sql: ${TABLE}.pp_toperiod ;;
  }

  dimension: prior_period_total_days {
    type: number
    hidden: yes
    sql: ${TABLE}.pp_total_days ;;
  }

  dimension: prior_year_computeyear {
    type: number
    hidden: yes
    sql: ${TABLE}.py_computeyear ;;
  }

  dimension: prior_year_fromperiod {
    type: date
    hidden: yes
    sql: ${TABLE}.py_fromperiod ;;
  }

  dimension: prior_year_toperiod {
    type: date
    hidden: yes
    sql: ${TABLE}.py_toperiod ;;
  }

  dimension: prior_year_total_days {
    type: number
    hidden: yes
    sql: ${TABLE}.py_total_days ;;
  }
}
