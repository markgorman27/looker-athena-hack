view: dim_period_dates {
  sql_table_name: metrics_wba_dev.dim_period_dates ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.computeperiod || ${TABLE}.toperiod || ${TABLE}.fromperiod || ${TABLE}.period_comparison || ${TABLE}.calendardate || ${TABLE}.cadence;;
  }

  dimension: computeperiod {
    type: string
    hidden: yes
    sql: ${TABLE}.computeperiod ;;
  }

  dimension: cadence {
    type: string
    hidden: yes
    sql: ${TABLE}.cadence ;;
  }

  dimension: toperiod {
    type: date
    hidden: yes
    sql: ${TABLE}.toperiod ;;
  }

  dimension: fromperiod {
    type: date
    hidden: yes
    sql: ${TABLE}.fromperiod ;;
  }

  dimension: period_comparison {
    type: string
    hidden: yes
    sql: ${TABLE}.period_comparison ;;
  }

  dimension: calendardate {
    type: date
    hidden: yes
    sql: ${TABLE}.calendardate ;;
  }
}
