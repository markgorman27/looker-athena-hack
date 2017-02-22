view: dim_period_dates {
  sql_table_name: metrics_wba_dev.dim_period_dates ;;
  suggestions: no

  dimension: cadence {
    type: string
    sql: ${TABLE}.cadence ;;
  }

  dimension_group: calendardate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.calendardate ;;
  }

  dimension: computeperiod {
    type: string
    sql: ${TABLE}.computeperiod ;;
  }

  dimension_group: fromperiod {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.fromperiod ;;
  }

  dimension: period_comparison {
    type: string
    sql: ${TABLE}.period_comparison ;;
  }

  dimension_group: toperiod {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.toperiod ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
