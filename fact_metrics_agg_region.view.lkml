view: fact_metrics_agg_region {
  sql_table_name: metrics_wba_dev.fact_metrics_agg_region ;;

  dimension: primary_key {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.region_id || ${TABLE}.toperiod || ${TABLE}.computeperiod || ${TABLE}.cadence ||${TABLE}.period_comparison ;;
  }

  dimension: region_id {
    type: string
    hidden: yes
    sql: ${TABLE}.region_id ;;
  }

  dimension: toperiod {
    type: date
    hidden: yes
    sql: ${TABLE}.toperiod ;;
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

  dimension: period_comparison {
    type: string
    hidden: yes
    sql: ${TABLE}.period_comparison ;;
  }

  dimension: overall_net_promoter_score {
    type: number
    hidden: yes
    sql: ${TABLE}.overall_net_promoter_score ;;
  }

  dimension: phone_hold_time{
    type: number
    hidden: yes
    sql: ${TABLE}.phone_hold_time ;;
  }

  dimension: rx_average_time_to_ready {
    type: number
    hidden: yes
    sql: ${TABLE}.rx_average_time_to_ready ;;
  }


  dimension: return_to_stock_sold_pct {
    type: number
    hidden: yes
    sql: ${TABLE}.return_to_stock_sold_pct ;;
  }

  dimension: verified_by_promise_time {
    type: number
    hidden: yes
    sql: ${TABLE}.verified_by_promise_time ;;
  }

  dimension: basic_department_outs {
    type: number
    hidden: yes
    sql: ${TABLE}.basic_department_outs ;;
  }

  dimension: payroll_hours {
    type: number
    hidden: yes
    sql: ${TABLE}.payroll_hours ;;
  }

  dimension: payroll_hours_target {
    type: number
    hidden: yes
    sql: ${TABLE}.payroll_hours_target ;;
  }

  dimension: front_end_actual_vs_budget {
    type: number
    hidden: yes
    sql: ${TABLE}.front_end_actual_vs_budget ;;
  }

  dimension: pharmacy_actual_vs_budget {
    type: number
    hidden: yes
    sql: ${TABLE}.pharmacy_actual_vs_budget ;;
  }

  dimension: non_rph_overtime {
    type: number
    hidden: yes
    sql: ${TABLE}.non_rph_overtime ;;
  }

  dimension: pharmacist_b_pay {
    type: number
    hidden: yes
    sql: ${TABLE}.pharmacist_b_pay ;;
  }

  dimension: pharmacy_net_promoter_score {
    type: number
    hidden: yes
    sql: ${TABLE}.pharmacy_net_promoter_score ;;
  }

  dimension: rx_partial_fills {
    type: number
    hidden: yes
    sql: ${TABLE}.rx_partial_fills ;;
  }

  dimension: overall_nps {
    type: number
    hidden: yes
    sql: ${TABLE}.overall_nps ;;
  }

  dimension: rx_nps {
    type: number
    hidden: yes
    sql: ${TABLE}.rx_nps ;;
  }

  dimension: departments_not_scanned {
    type: number
    hidden: yes
    sql: ${TABLE}.departments_not_scanned ;;
  }

  dimension: rx_per_day {
    type: number
    hidden: yes
    sql: ${TABLE}.rx_per_day ;;
  }

  dimension: ly_rx_per_day {
    type: number
    hidden: yes
    sql: ${TABLE}.ly_rx_per_day ;;
  }

  dimension: rx_per_day_yoy_pct {
    type: number
    hidden: yes
    sql: ${TABLE}.rx_per_day_yoy_pct ;;
  }

  dimension: rx_per_day_target {
    type: number
    hidden: yes
    sql: ${TABLE}.rx_per_day_target ;;
  }

  dimension: rx_per_day_target_pct {
    type: number
    hidden: yes
    sql: ${TABLE}.rx_per_day_target_pct ;;
  }

  dimension: rx_waiters_pct {
    type: number
    hidden: yes
    sql: ${TABLE}.rx_waiters_pct ;;
  }

  dimension: efficiency_rate_90_days {
    type: number
    hidden: yes
    sql: ${TABLE}.efficiency_rate_90_days ;;
  }

  dimension: scan_out_execution {
    type: number
    hidden: yes
    sql: ${TABLE}.scan_out_execution ;;
  }

  dimension: total_no_of_changes_ss {
    type: number
    hidden: yes
    sql: ${TABLE}.total_no_of_changes_ss ;;
  }

  dimension: ss_smart_count_compliance_pct {
    type: number
    hidden: yes
    sql: ${TABLE}.ss_smart_count_compliance_pct ;;
  }

  dimension: smart_count_unchanged_pct {
    type: number
    hidden: yes
    sql: ${TABLE}.smart_count_unchanged_pct ;;
  }

  dimension: beauty_sales_at_all_registers {
    type: number
    hidden: yes
    sql: ${TABLE}.beauty_sales_at_all_registers ;;
  }

  dimension: beauty_sales_goal {
    type: number
    hidden: yes
    sql: ${TABLE}.beauty_sales_goal ;;
  }

  dimension: pct_of_beauty_sales_goals {
    type: number
    hidden: yes
    sql: ${TABLE}.pct_of_beauty_sales_goals ;;
  }

  dimension: cust_cnt_at_beauty_reg {
    type: number
    hidden: yes
    sql: ${TABLE}.cust_cnt_at_beauty_reg ;;
  }

  dimension: beauty_sales_at_beauty_register {
    type: number
    hidden: yes
    sql: ${TABLE}.beauty_sales_at_beauty_register ;;
  }

  dimension: flu_immunization {
    type: number
    hidden: yes
    sql: ${TABLE}.flu_immunization ;;
  }

  dimension: non_flu_immunization {
    type: number
    hidden: yes
    sql: ${TABLE}.non_flu_immunization ;;
  }

  dimension: generic_efficiency {
    type: number
    hidden: yes
    sql: ${TABLE}.generic_efficiency ;;
  }

  dimension: positive_response {
    type: number
    hidden: yes
    sql: ${TABLE}.positive_response ;;
  }

  dimension: items_changed_to_zero_pct {
    type: number
    hidden: yes
    sql: ${TABLE}.items_changed_to_zero_pct ;;
  }

  dimension: order_change_pct_ss {
    type: number
    hidden: yes
    sql: ${TABLE}.order_change_pct_ss ;;
  }

  dimension: pct_compliant {
    type: number
    hidden: yes
    sql: ${TABLE}.pct_compliant ;;
  }

  dimension: self_service_product_loss {
    type: number
    hidden: yes
    sql: ${TABLE}.self_service_product_loss ;;
  }

  dimension: unsaleable_claims {
    type: number
    hidden: yes
    sql: ${TABLE}.unsaleable_claims ;;
  }

  dimension: beauty_enthusiast_autoprompt_success_rate {
    type: number
    hidden: yes
    sql: ${TABLE}.beauty_enthusiast_autoprompt_success_rate ;;
  }

  dimension: beauty_enthusiast_cashier_triggered_success_rate {
    type: number
    hidden: yes
    sql: ${TABLE}.beauty_enthusiast_cashier_triggered_success_rate ;;
  }
}
