view: fact_metrics {
  sql_table_name: metrics_wba_dev.fact_metrics ;;
  suggestions: no

  dimension: basic_department_outs {
    type: number
    sql: ${TABLE}.basic_department_outs ;;
  }

  dimension_group: basic_department_outs_last_update {
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
    sql: ${TABLE}.basic_department_outs_last_update ;;
  }

  dimension: beauty_sales_at_all_registers {
    type: number
    sql: ${TABLE}.beauty_sales_at_all_registers ;;
  }

  dimension_group: beauty_sales_at_all_registers_last_update {
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
    sql: ${TABLE}.beauty_sales_at_all_registers_last_update ;;
  }

  dimension: beauty_sales_at_beauty_register {
    type: number
    sql: ${TABLE}.beauty_sales_at_beauty_register ;;
  }

  dimension_group: beauty_sales_at_beauty_register_last_update {
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
    sql: ${TABLE}.beauty_sales_at_beauty_register_last_update ;;
  }

  dimension: cadence {
    type: string
    sql: ${TABLE}.cadence ;;
  }

  dimension_group: calendar {
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
    sql: ${TABLE}.calendar_date ;;
  }

  dimension: cust_cnt_at_beauty_reg {
    type: number
    sql: ${TABLE}.cust_cnt_at_beauty_reg ;;
  }

  dimension_group: cust_cnt_at_beauty_reg_last_update {
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
    sql: ${TABLE}.cust_cnt_at_beauty_reg_last_update ;;
  }

  dimension: efficiency_rate_90_days {
    type: number
    sql: ${TABLE}.efficiency_rate_90_days ;;
  }

  dimension_group: efficiency_rate_90_days_last_update {
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
    sql: ${TABLE}.efficiency_rate_90_days_last_update ;;
  }

  dimension: front_end_actual_vs_budget {
    type: number
    sql: ${TABLE}.front_end_actual_vs_budget ;;
  }

  dimension_group: front_end_actual_vs_budget_last_update {
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
    sql: ${TABLE}.front_end_actual_vs_budget_last_update ;;
  }

  dimension: items_changed_to_zero_pct {
    type: number
    sql: ${TABLE}.items_changed_to_zero_pct ;;
  }

  dimension_group: items_changed_to_zero_pct_last_update {
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
    sql: ${TABLE}.items_changed_to_zero_pct_last_update ;;
  }

  dimension: negative_response {
    type: number
    sql: ${TABLE}.negative_response ;;
  }

  dimension: no_response {
    type: number
    sql: ${TABLE}.no_response ;;
  }

  dimension: non_rph_overtime {
    type: number
    sql: ${TABLE}.non_rph_overtime ;;
  }

  dimension_group: non_rph_overtime_last_update {
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
    sql: ${TABLE}.non_rph_overtime_last_update ;;
  }

  dimension: overall_net_promoter_score {
    type: number
    sql: ${TABLE}.overall_net_promoter_score ;;
  }

  dimension: overall_nps {
    type: number
    sql: ${TABLE}.overall_nps ;;
  }

  dimension: overall_nps_denominator {
    type: number
    sql: ${TABLE}.overall_nps_denominator ;;
  }

  dimension_group: overall_nps_last_update {
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
    sql: ${TABLE}.overall_nps_last_update ;;
  }

  dimension: overall_nps_target {
    type: number
    sql: ${TABLE}.overall_nps_target ;;
  }

  dimension: payroll_hours {
    type: number
    sql: ${TABLE}.payroll_hours ;;
  }

  dimension_group: payroll_hours_last_update {
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
    sql: ${TABLE}.payroll_hours_last_update ;;
  }

  dimension: payroll_hours_target {
    type: number
    sql: ${TABLE}.payroll_hours_target ;;
  }

  dimension: pct_of_beauty_sales_goals {
    type: number
    sql: ${TABLE}.pct_of_beauty_sales_goals ;;
  }

  dimension_group: pct_of_beauty_sales_goals_last_update {
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
    sql: ${TABLE}.pct_of_beauty_sales_goals_last_update ;;
  }

  dimension: pharmacist_b_pay {
    type: number
    sql: ${TABLE}.pharmacist_b_pay ;;
  }

  dimension_group: pharmacist_b_pay_last_update {
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
    sql: ${TABLE}.pharmacist_b_pay_last_update ;;
  }

  dimension: pharmacy_actual_vs_budget {
    type: number
    sql: ${TABLE}.pharmacy_actual_vs_budget ;;
  }

  dimension_group: pharmacy_actual_vs_budget_last_update {
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
    sql: ${TABLE}.pharmacy_actual_vs_budget_last_update ;;
  }

  dimension: pharmacy_net_promoter_score {
    type: number
    sql: ${TABLE}.pharmacy_net_promoter_score ;;
  }

  dimension: positive_response {
    type: number
    sql: ${TABLE}.positive_response ;;
  }

  dimension_group: positive_response_last_update {
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
    sql: ${TABLE}.positive_response_last_update ;;
  }

  dimension: rx_nps {
    type: number
    sql: ${TABLE}.rx_nps ;;
  }

  dimension: rx_nps_denominator {
    type: number
    sql: ${TABLE}.rx_nps_denominator ;;
  }

  dimension_group: rx_nps_last_update {
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
    sql: ${TABLE}.rx_nps_last_update ;;
  }

  dimension: rx_nps_target {
    type: number
    sql: ${TABLE}.rx_nps_target ;;
  }

  dimension: rx_smart_count_compliance_pct {
    type: number
    sql: ${TABLE}.rx_smart_count_compliance_pct ;;
  }

  dimension: scan_out_execution {
    type: number
    sql: ${TABLE}.scan_out_execution ;;
  }

  dimension_group: scan_out_execution_last_update {
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
    sql: ${TABLE}.scan_out_execution_last_update ;;
  }

  dimension: smart_count_unchanged_pct {
    type: number
    sql: ${TABLE}.smart_count_unchanged_pct ;;
  }

  dimension_group: smart_count_unchanged_pct_last_update {
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
    sql: ${TABLE}.smart_count_unchanged_pct_last_update ;;
  }

  dimension: ss_smart_count_compliance_pct {
    type: number
    sql: ${TABLE}.ss_smart_count_compliance_pct ;;
  }

  dimension_group: ss_smart_count_compliance_pct_last_update {
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
    sql: ${TABLE}.ss_smart_count_compliance_pct_last_update ;;
  }

  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
