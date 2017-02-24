include: "fact_metrics.view.lkml"
view: hero_metrics {
  label: "Hero Metrics"
  extends: [fact_metrics]

  dimension: hero_metric_name {
    type:  string
    sql:  case
         when {% condition hero_metric_selector %} 'overall_net_promoter_score' {% endcondition %}
         THEN 'overall_net_promoter_score'
         when {% condition hero_metric_selector %} 'phone_hold_time' {% endcondition %}
         THEN 'phone_hold_time'
         when {% condition hero_metric_selector %} 'rx_average_time_to_ready' {% endcondition %}
         THEN 'rx_average_time_to_ready'
         when {% condition hero_metric_selector %} 'return_to_stock_sold_pct' {% endcondition %}
         THEN 'return_to_stock_sold_pct'
         when {% condition hero_metric_selector %} 'verified_by_promise_time' {% endcondition %}
         THEN 'verified_by_promise_time'
         when {% condition hero_metric_selector %} 'basic_department_outs' {% endcondition %}
         THEN 'basic_department_outs'
         when {% condition hero_metric_selector %} 'payroll_hours' {% endcondition %}
         THEN 'payroll_hours'
         when {% condition hero_metric_selector %} 'front_end_actual_vs_budget' {% endcondition %}
         THEN 'front_end_actual_vs_budget'
         when {% condition hero_metric_selector %} 'pharmacy_actual_vs_budget' {% endcondition %}
         THEN 'pharmacy_actual_vs_budget'
         when {% condition hero_metric_selector %} 'non_rph_overtime' {% endcondition %}
         THEN 'non_rph_overtime'
         when {% condition hero_metric_selector %} 'pharmacist_b_pay' {% endcondition %}
         THEN 'pharmacist_b_pay'
         when {% condition hero_metric_selector %} 'pharmacy_net_promoter_score' {% endcondition %}
         THEN 'pharmacy_net_promoter_score'
         when {% condition hero_metric_selector %} 'rx_partial_fills' {% endcondition %}
         THEN 'rx_partial_fills'
         when {% condition hero_metric_selector %} 'departments_not_scanned' {% endcondition %}
         THEN 'departments_not_scanned'
         when {% condition hero_metric_selector %} 'rx_per_day' {% endcondition %}
         THEN 'rx_per_day'
         when {% condition hero_metric_selector %} 'rx_waiters_pct' {% endcondition %}
         THEN 'rx_waiters_pct'
         when {% condition hero_metric_selector %} 'efficiency_rate_90_days' {% endcondition %}
         THEN 'efficiency_rate_90_days'
         when {% condition hero_metric_selector %} 'scan_out_execution' {% endcondition %}
         THEN 'scan_out_execution'
         when {% condition hero_metric_selector %} 'total_no_of_changes_ss' {% endcondition %}
         THEN 'total_no_of_changes_ss'
         when {% condition hero_metric_selector %} 'ss_smart_count_compliance_pct' {% endcondition %}
         THEN 'ss_smart_count_compliance_pct'
         when {% condition hero_metric_selector %} 'smart_count_unchanged_pct' {% endcondition %}
         THEN 'smart_count_unchanged_pct'
         when {% condition hero_metric_selector %} 'beauty_sales_at_all_registers' {% endcondition %}
         THEN 'beauty_sales_at_all_registers'
         when {% condition hero_metric_selector %} 'pct_of_beauty_sales_goals' {% endcondition %}
         THEN 'pct_of_beauty_sales_goals'
         when {% condition hero_metric_selector %} 'cust_cnt_at_beauty_reg' {% endcondition %}
         THEN 'cust_cnt_at_beauty_reg'
         when {% condition hero_metric_selector %} 'beauty_sales_at_beauty_register' {% endcondition %}
         THEN 'beauty_sales_at_beauty_register'
         when {% condition hero_metric_selector %} 'flu_immunization' {% endcondition %}
         THEN 'flu_immunization'
         when {% condition hero_metric_selector %} 'non_flu_immunization' {% endcondition %}
         THEN 'non_flu_immunization'
         when {% condition hero_metric_selector %} 'generic_efficiency' {% endcondition %}
         THEN 'generic_efficiency'
         when {% condition hero_metric_selector %} 'positive_response' {% endcondition %}
         THEN 'positive_response'
         when {% condition hero_metric_selector %} 'items_changed_to_zero_pct' {% endcondition %}
         THEN 'items_changed_to_zero_pct'
         when {% condition hero_metric_selector %} 'order_change_pct_ss' {% endcondition %}
         THEN 'order_change_pct_ss'
         when {% condition hero_metric_selector %} 'pct_compliant' {% endcondition %}
         THEN 'pct_compliant'
         when {% condition hero_metric_selector %} 'self_service_product_loss' {% endcondition %}
         THEN 'self_service_product_loss'
         when {% condition hero_metric_selector %} 'unsaleable_claims' {% endcondition %}
         THEN 'unsaleable_claims'
         when {% condition hero_metric_selector %} 'beauty_enthusiast_autoprompt_success_rate' {% endcondition %}
         THEN 'beauty_enthusiast_autoprompt_success_rate'
         when {% condition hero_metric_selector %} 'beauty_enthusiast_cashier_triggered_success_rate' {% endcondition %}
         THEN 'beauty_enthusiast_cashier_triggered_success_rate'
      END
       ;;
  }

  measure: hero_metric {
    type:  number
    sql:  case
         when {% condition hero_metric_selector %} 'overall_net_promoter_score' {% endcondition %}
         THEN ${overall_net_promoter_score}
         when {% condition hero_metric_selector %} 'phone_hold_time' {% endcondition %}
         THEN ${phone_hold_time}
         when {% condition hero_metric_selector %} 'rx_average_time_to_ready' {% endcondition %}
         THEN ${rx_average_time_to_ready}
         when {% condition hero_metric_selector %} 'return_to_stock_sold_pct' {% endcondition %}
         THEN ${return_to_stock_sold_pct}
         when {% condition hero_metric_selector %} 'verified_by_promise_time' {% endcondition %}
         THEN ${verified_by_promise_time}
         when {% condition hero_metric_selector %} 'basic_department_outs' {% endcondition %}
         THEN ${basic_department_outs}
         when {% condition hero_metric_selector %} 'payroll_hours' {% endcondition %}
         THEN ${payroll_hours}
         when {% condition hero_metric_selector %} 'front_end_actual_vs_budget' {% endcondition %}
         THEN ${front_end_actual_vs_budget}
         when {% condition hero_metric_selector %} 'pharmacy_actual_vs_budget' {% endcondition %}
         THEN ${pharmacy_actual_vs_budget}
         when {% condition hero_metric_selector %} 'non_rph_overtime' {% endcondition %}
         THEN ${non_rph_overtime}
         when {% condition hero_metric_selector %} 'pharmacist_b_pay' {% endcondition %}
         THEN ${pharmacist_b_pay}
         when {% condition hero_metric_selector %} 'pharmacy_net_promoter_score' {% endcondition %}
         THEN ${pharmacy_net_promoter_score}
         when {% condition hero_metric_selector %} 'rx_partial_fills' {% endcondition %}
         THEN ${rx_partial_fills}
         when {% condition hero_metric_selector %} 'departments_not_scanned' {% endcondition %}
         THEN ${departments_not_scanned}
         when {% condition hero_metric_selector %} 'rx_per_day' {% endcondition %}
         THEN ${rx_per_day}
         when {% condition hero_metric_selector %} 'rx_waiters_pct' {% endcondition %}
         THEN ${rx_waiters_pct}
         when {% condition hero_metric_selector %} 'efficiency_rate_90_days' {% endcondition %}
         THEN ${efficiency_rate_90_days}
         when {% condition hero_metric_selector %} 'scan_out_execution' {% endcondition %}
         THEN ${scan_out_execution}
         when {% condition hero_metric_selector %} 'total_no_of_changes_ss' {% endcondition %}
         THEN ${total_no_of_changes_ss}
         when {% condition hero_metric_selector %} 'ss_smart_count_compliance_pct' {% endcondition %}
         THEN ${ss_smart_count_compliance_pct}
         when {% condition hero_metric_selector %} 'smart_count_unchanged_pct' {% endcondition %}
         THEN ${smart_count_unchanged_pct}
         when {% condition hero_metric_selector %} 'beauty_sales_at_all_registers' {% endcondition %}
         THEN ${beauty_sales_at_all_registers}
         when {% condition hero_metric_selector %} 'pct_of_beauty_sales_goals' {% endcondition %}
         THEN ${pct_of_beauty_sales_goals}
         when {% condition hero_metric_selector %} 'cust_cnt_at_beauty_reg' {% endcondition %}
         THEN ${cust_cnt_at_beauty_reg}
         when {% condition hero_metric_selector %} 'beauty_sales_at_beauty_register' {% endcondition %}
         THEN ${beauty_sales_at_beauty_register}
         when {% condition hero_metric_selector %} 'flu_immunization' {% endcondition %}
         THEN ${flu_immunization}
         when {% condition hero_metric_selector %} 'non_flu_immunization' {% endcondition %}
         THEN ${non_flu_immunization}
         when {% condition hero_metric_selector %} 'generic_efficiency' {% endcondition %}
         THEN ${generic_efficiency}
         when {% condition hero_metric_selector %} 'positive_response' {% endcondition %}
         THEN ${positive_response}
         when {% condition hero_metric_selector %} 'items_changed_to_zero_pct' {% endcondition %}
         THEN ${items_changed_to_zero_pct}
         when {% condition hero_metric_selector %} 'order_change_pct_ss' {% endcondition %}
         THEN ${order_change_pct_ss}
         when {% condition hero_metric_selector %} 'pct_compliant' {% endcondition %}
         THEN ${pct_compliant}
         when {% condition hero_metric_selector %} 'self_service_product_loss' {% endcondition %}
         THEN ${self_service_product_loss}
         when {% condition hero_metric_selector %} 'unsaleable_claims' {% endcondition %}
         THEN ${unsaleable_claims}
         when {% condition hero_metric_selector %} 'beauty_enthusiast_autoprompt_success_rate' {% endcondition %}
         THEN ${beauty_enthusiast_autoprompt_success_rate}
         when {% condition hero_metric_selector %} 'beauty_enthusiast_cashier_triggered_success_rate' {% endcondition %}
         THEN ${beauty_enthusiast_cashier_triggered_success_rate}
      END
       ;;
  }

  measure: hero_metric_comparison {
    type:  number
    sql:  case
         when {% condition hero_metric_selector %} 'overall_net_promoter_score' {% endcondition %}
         THEN ${overall_net_promoter_score_comparison}
         when {% condition hero_metric_selector %} 'phone_hold_time' {% endcondition %}
         THEN ${phone_hold_time_comparison}
         when {% condition hero_metric_selector %} 'rx_average_time_to_ready' {% endcondition %}
         THEN ${rx_average_time_to_ready_comparison}
         when {% condition hero_metric_selector %} 'return_to_stock_sold_pct' {% endcondition %}
         THEN ${return_to_stock_sold_pct_comparison}
         when {% condition hero_metric_selector %} 'verified_by_promise_time' {% endcondition %}
         THEN ${verified_by_promise_time_comparison}
         when {% condition hero_metric_selector %} 'basic_department_outs' {% endcondition %}
         THEN ${basic_department_outs_comparison}
         when {% condition hero_metric_selector %} 'payroll_hours' {% endcondition %}
         THEN ${payroll_hours_comparison}
         when {% condition hero_metric_selector %} 'front_end_actual_vs_budget' {% endcondition %}
         THEN ${front_end_actual_vs_budget_comparison}
         when {% condition hero_metric_selector %} 'pharmacy_actual_vs_budget' {% endcondition %}
         THEN ${pharmacy_actual_vs_budget_comparison}
         when {% condition hero_metric_selector %} 'non_rph_overtime' {% endcondition %}
         THEN ${non_rph_overtime_comparison}
         when {% condition hero_metric_selector %} 'pharmacist_b_pay' {% endcondition %}
         THEN ${pharmacist_b_pay_comparison}
         when {% condition hero_metric_selector %} 'pharmacy_net_promoter_score' {% endcondition %}
         THEN ${pharmacy_net_promoter_score_comparison}
         when {% condition hero_metric_selector %} 'rx_partial_fills' {% endcondition %}
         THEN ${rx_partial_fills_comparison}
         when {% condition hero_metric_selector %} 'departments_not_scanned' {% endcondition %}
         THEN ${departments_not_scanned_comparison}
         when {% condition hero_metric_selector %} 'rx_per_day' {% endcondition %}
         THEN ${rx_per_day_comparison}
         when {% condition hero_metric_selector %} 'rx_waiters_pct' {% endcondition %}
         THEN ${rx_waiters_pct_comparison}
         when {% condition hero_metric_selector %} 'efficiency_rate_90_days' {% endcondition %}
         THEN ${efficiency_rate_90_days_comparison}
         when {% condition hero_metric_selector %} 'scan_out_execution' {% endcondition %}
         THEN ${scan_out_execution_comparison}
         when {% condition hero_metric_selector %} 'total_no_of_changes_ss' {% endcondition %}
         THEN ${total_no_of_changes_ss_comparison}
         when {% condition hero_metric_selector %} 'ss_smart_count_compliance_pct' {% endcondition %}
         THEN ${ss_smart_count_compliance_pct_comparison}
         when {% condition hero_metric_selector %} 'smart_count_unchanged_pct' {% endcondition %}
         THEN ${smart_count_unchanged_pct_comparison}
         when {% condition hero_metric_selector %} 'beauty_sales_at_all_registers' {% endcondition %}
         THEN ${beauty_sales_at_all_registers_comparison}
         when {% condition hero_metric_selector %} 'pct_of_beauty_sales_goals' {% endcondition %}
         THEN ${pct_of_beauty_sales_goals_comparison}
         when {% condition hero_metric_selector %} 'cust_cnt_at_beauty_reg' {% endcondition %}
         THEN ${cust_cnt_at_beauty_reg_comparison}
         when {% condition hero_metric_selector %} 'beauty_sales_at_beauty_register' {% endcondition %}
         THEN ${beauty_sales_at_beauty_register_comparison}
         when {% condition hero_metric_selector %} 'flu_immunization' {% endcondition %}
         THEN ${flu_immunization_comparison}
         when {% condition hero_metric_selector %} 'non_flu_immunization' {% endcondition %}
         THEN ${non_flu_immunization_comparison}
         when {% condition hero_metric_selector %} 'generic_efficiency' {% endcondition %}
         THEN ${generic_efficiency_comparison}
         when {% condition hero_metric_selector %} 'positive_response' {% endcondition %}
         THEN ${positive_response_comparison}
         when {% condition hero_metric_selector %} 'items_changed_to_zero_pct' {% endcondition %}
         THEN ${items_changed_to_zero_pct_comparison}
         when {% condition hero_metric_selector %} 'order_change_pct_ss' {% endcondition %}
         THEN ${order_change_pct_ss_comparison}
         when {% condition hero_metric_selector %} 'pct_compliant' {% endcondition %}
         THEN ${pct_compliant_comparison}
         when {% condition hero_metric_selector %} 'self_service_product_loss' {% endcondition %}
         THEN ${self_service_product_loss_comparison}
         when {% condition hero_metric_selector %} 'unsaleable_claims' {% endcondition %}
         THEN ${unsaleable_claims_comparison}
         when {% condition hero_metric_selector %} 'beauty_enthusiast_autoprompt_success_rate' {% endcondition %}
         THEN ${beauty_enthusiast_autoprompt_success_rate_comparison}
         when {% condition hero_metric_selector %} 'beauty_enthusiast_cashier_triggered_success_rate' {% endcondition %}
         THEN ${beauty_enthusiast_cashier_triggered_success_rate_comparison}
      END
       ;;
  }

  measure: hero_metric_compare_text {
    type:  string
    sql:  case
         when {% condition period_comparison %} 'Prior Period' {% endcondition %}
         THEN 'vs. Prior Period'
         when {% condition period_comparison %} 'Prior Year' {% endcondition %}
         THEN 'vs. Prior Year'
         when {% condition dataset_comparison %} 'Target' {% endcondition %}
         THEN 'vs. Target'
         when {% condition entity_comparison %} 'District' {% endcondition %}
         THEN 'vs. District'
         when {% condition entity_comparison %} 'Area' {% endcondition %}
         THEN 'vs. Area'
         when {% condition entity_comparison %} 'Region' {% endcondition %}
         THEN 'vs. Region'
      END
       ;;
  }

  measure: hero_metric_last_update {
    type:  string
    hidden:  no
    sql:  case
         when {% condition hero_metric_selector %} 'overall_net_promoter_score' {% endcondition %}
         THEN ${overall_net_promoter_score_last_update}
         when {% condition hero_metric_selector %} 'phone_hold_time' {% endcondition %}
         THEN ${phone_hold_time_last_update}
         when {% condition hero_metric_selector %} 'rx_average_time_to_ready' {% endcondition %}
         THEN ${rx_average_time_to_ready_last_update}
         when {% condition hero_metric_selector %} 'return_to_stock_sold_pct' {% endcondition %}
         THEN ${return_to_stock_sold_pct_last_update}
         when {% condition hero_metric_selector %} 'verified_by_promise_time' {% endcondition %}
         THEN ${verified_by_promise_time_last_update}
         when {% condition hero_metric_selector %} 'basic_department_outs' {% endcondition %}
         THEN ${basic_department_outs_last_update}
         when {% condition hero_metric_selector %} 'payroll_hours' {% endcondition %}
         THEN ${payroll_hours_last_update}
         when {% condition hero_metric_selector %} 'front_end_actual_vs_budget' {% endcondition %}
         THEN ${front_end_actual_vs_budget_last_update}
         when {% condition hero_metric_selector %} 'pharmacy_actual_vs_budget' {% endcondition %}
         THEN ${pharmacy_actual_vs_budget_last_update}
         when {% condition hero_metric_selector %} 'non_rph_overtime' {% endcondition %}
         THEN ${non_rph_overtime_last_update}
         when {% condition hero_metric_selector %} 'pharmacist_b_pay' {% endcondition %}
         THEN ${pharmacist_b_pay_last_update}
         when {% condition hero_metric_selector %} 'pharmacy_net_promoter_score' {% endcondition %}
         THEN ${pharmacy_net_promoter_score_last_update}
         when {% condition hero_metric_selector %} 'rx_partial_fills' {% endcondition %}
         THEN ${rx_partial_fills_last_update}
         when {% condition hero_metric_selector %} 'departments_not_scanned' {% endcondition %}
         THEN ${departments_not_scanned_last_update}
         when {% condition hero_metric_selector %} 'rx_per_day' {% endcondition %}
         THEN ${rx_per_day_last_update}
         when {% condition hero_metric_selector %} 'rx_waiters_pct' {% endcondition %}
         THEN ${rx_waiters_pct_last_update}
         when {% condition hero_metric_selector %} 'efficiency_rate_90_days' {% endcondition %}
         THEN ${efficiency_rate_90_days_last_update}
         when {% condition hero_metric_selector %} 'scan_out_execution' {% endcondition %}
         THEN ${scan_out_execution_last_update}
         when {% condition hero_metric_selector %} 'total_no_of_changes_ss' {% endcondition %}
         THEN ${total_no_of_changes_ss_last_update}
         when {% condition hero_metric_selector %} 'ss_smart_count_compliance_pct' {% endcondition %}
         THEN ${ss_smart_count_compliance_pct_last_update}
         when {% condition hero_metric_selector %} 'smart_count_unchanged_pct' {% endcondition %}
         THEN ${smart_count_unchanged_pct_last_update}
         when {% condition hero_metric_selector %} 'beauty_sales_at_all_registers' {% endcondition %}
         THEN ${beauty_sales_at_all_registers_last_update}
         when {% condition hero_metric_selector %} 'pct_of_beauty_sales_goals' {% endcondition %}
         THEN ${pct_of_beauty_sales_goals_last_update}
         when {% condition hero_metric_selector %} 'cust_cnt_at_beauty_reg' {% endcondition %}
         THEN ${cust_cnt_at_beauty_reg_last_update}
         when {% condition hero_metric_selector %} 'beauty_sales_at_beauty_register' {% endcondition %}
         THEN ${beauty_sales_at_beauty_register_last_update}
         when {% condition hero_metric_selector %} 'flu_immunization' {% endcondition %}
         THEN ${flu_immunization_last_update}
         when {% condition hero_metric_selector %} 'non_flu_immunization' {% endcondition %}
         THEN ${non_flu_immunization_last_update}
         when {% condition hero_metric_selector %} 'generic_efficiency' {% endcondition %}
         THEN ${generic_efficiency_last_update}
         when {% condition hero_metric_selector %} 'positive_response' {% endcondition %}
         THEN ${positive_response_last_update}
         when {% condition hero_metric_selector %} 'items_changed_to_zero_pct' {% endcondition %}
         THEN ${items_changed_to_zero_pct_last_update}
         when {% condition hero_metric_selector %} 'order_change_pct_ss' {% endcondition %}
         THEN ${order_change_pct_ss_last_update}
         when {% condition hero_metric_selector %} 'pct_compliant' {% endcondition %}
         THEN ${pct_compliant_last_update}
         when {% condition hero_metric_selector %} 'self_service_product_loss' {% endcondition %}
         THEN ${self_service_product_loss_last_update}
         when {% condition hero_metric_selector %} 'unsaleable_claims' {% endcondition %}
         THEN ${unsaleable_claims_last_update}
         when {% condition hero_metric_selector %} 'beauty_enthusiast_autoprompt_success_rate' {% endcondition %}
         THEN ${beauty_enthusiast_autoprompt_success_rate_last_update}
         when {% condition hero_metric_selector %} 'beauty_enthusiast_cashier_triggered_success_rate' {% endcondition %}
         THEN ${beauty_enthusiast_cashier_triggered_success_rate_last_update}
      END
       ;;
  }

  measure: overall_net_promoter_score {
    hidden:  yes
  }

  measure: overall_net_promoter_score_comparison {
    hidden:  yes
  }

  measure: phone_hold_time {
    hidden:  yes
  }

  measure: phone_hold_time_comparison {
    hidden:  yes
  }

  measure: rx_average_time_to_ready {
    hidden:  yes
  }

  measure: rx_average_time_to_ready_comparison {
    hidden:  yes
  }

  measure: return_to_stock_sold_pct {
    hidden:  yes
  }

  measure: return_to_stock_sold_pct_comparison {
    hidden:  yes
  }

  measure: verified_by_promise_time {
    hidden:  yes
  }

  measure: verified_by_promise_time_comparison {
    hidden:  yes
  }

  measure: basic_department_outs {
    hidden:  yes
  }

  measure: basic_department_outs_comparison {
    hidden:  yes
  }

  measure: payroll_hours {
    hidden:  yes
  }

  measure: payroll_hours_comparison {
    hidden:  yes
  }

  measure: front_end_actual_vs_budget {
    hidden:  yes
  }

  measure: front_end_actual_vs_budget_comparison {
    hidden:  yes
  }

  measure: pharmacy_actual_vs_budget {
    hidden:  yes
  }

  measure: pharmacy_actual_vs_budget_comparison {
    hidden:  yes
  }

  measure: non_rph_overtime {
    hidden:  yes
  }

  measure: non_rph_overtime_comparison {
    hidden:  yes
  }

  measure: pharmacist_b_pay {
    hidden:  yes
  }

  measure: pharmacist_b_pay_comparison {
    hidden:  yes
  }

  measure: pharmacy_net_promoter_score {
    hidden:  yes
  }

  measure: pharmacy_net_promoter_score_comparison {
    hidden:  yes
  }

  measure: rx_partial_fills {
    hidden:  yes
  }

  measure: rx_partial_fills_comparison {
    hidden:  yes
  }

  measure: departments_not_scanned {
    hidden: yes
  }

  measure: departments_not_scanned_comparison {
    hidden: yes
  }

  measure: rx_per_day {
    hidden: yes
  }

  measure: rx_per_day_comparison {
    hidden: yes
  }

  measure: rx_waiters_pct {
    hidden: yes
  }

  measure: rx_waiters_pct_comparison {
    hidden: yes
  }

  measure: efficiency_rate_90_days {
    hidden: yes
  }

  measure: efficiency_rate_90_days_comparison {
    hidden: yes
  }

  measure: scan_out_execution {
    hidden: yes
  }

  measure: scan_out_execution_comparison {
    hidden: yes
  }

  measure: total_no_of_changes_ss {
    hidden: yes
  }

  measure: total_no_of_changes_ss_comparison {
    hidden: yes
  }

  measure: ss_smart_count_compliance_pct {
    hidden: yes
  }

  measure: ss_smart_count_compliance_pct_comparison {
    hidden: yes
  }

  measure: smart_count_unchanged_pct {
    hidden: yes
  }

  measure: smart_count_unchanged_pct_comparison {
    hidden: yes
  }

  measure: beauty_sales_at_all_registers {
    hidden: yes
  }

  measure: beauty_sales_at_all_registers_comparison {
    hidden: yes
  }

  measure: pct_of_beauty_sales_goals {
    hidden: yes
  }

  measure: pct_of_beauty_sales_goals_comparison {
    hidden: yes
  }

  measure: cust_cnt_at_beauty_reg {
    hidden: yes
  }

  measure: cust_cnt_at_beauty_reg_comparison {
    hidden: yes
  }

  measure: beauty_sales_at_beauty_register {
    hidden: yes
  }

  measure: beauty_sales_at_beauty_register_comparison {
    hidden: yes
  }

  measure: flu_immunization {
    hidden: yes
  }

  measure: flu_immunization_comparison {
    hidden: yes
  }

  measure: non_flu_immunization {
    hidden: yes
  }

  measure: non_flu_immunization_comparison {
    hidden: yes
  }

  measure: generic_efficiency {
    hidden: yes
  }

  measure: generic_efficiency_comparison {
    hidden: yes
  }

  measure: positive_response {
    hidden: yes
  }

  measure: positive_response_comparison {
    hidden: yes
  }

  measure: items_changed_to_zero_pct {
    hidden: yes
  }

  measure: items_changed_to_zero_pct_comparison {
    hidden: yes
  }

  measure: order_change_pct_ss {
    hidden: yes
  }

  measure: order_change_pct_ss_comparison {
    hidden: yes
  }

  measure: pct_compliant {
    hidden: yes
  }

  measure: pct_compliant_comparison {
    hidden: yes
  }

  measure: self_service_product_loss {
    hidden: yes
  }

  measure: self_service_product_loss_comparison {
    hidden: yes
  }

  measure: unsaleable_claims {
    hidden: yes
  }

  measure: unsaleable_claims_comparison {
    hidden: yes
  }

  measure: beauty_enthusiast_autoprompt_success_rate {
    hidden: yes
  }

  measure: beauty_enthusiast_autoprompt_success_rate_comparison {
    hidden: yes
  }

  measure: beauty_enthusiast_cashier_triggered_success_rate {
    hidden: yes
  }

  measure: beauty_enthusiast_cashier_triggered_success_rate_comparison {
    hidden: yes
  }


  filter: comparison_behavior {
    label: "Select Comparison"
    description: "Comparison Behavior"
    hidden:  yes
    type: string
    default_value: "Prior Period"
    suggest_explore: dim_comparison_suggestions
    suggest_dimension: dim_comparison_suggestions.compare
  }

  filter: hero_metric_selector {
    label: "Hero Metric Selector"
    description: "Hero Metric Selector"
    type: string

    default_value: "overall_net_promoter_score"
    suggestions: ["overall_net_promoter_score",
      "phone_hold_time",
      "rx_average_time_to_ready",
      "return_to_stock_sold_pct",
      "verified_by_promise_time",
      "basic_department_outs",
      "payroll_hours",
      "front_end_actual_vs_budget",
      "pharmacy_actual_vs_budget",
      "non_rph_overtime",
      "pharmacist_b_pay",
      "pharmacy_net_promoter_score",
      "rx_partial_fills",
      "departments_not_scanned",
      "rx_per_day",
      "rx_waiters_pct",
      "efficiency_rate_90_days",
      "scan_out_execution",
      "total_no_of_changes_ss",
      "ss_smart_count_compliance_pct",
      "smart_count_unchanged_pct",
      "beauty_sales_at_all_registers",
      "pct_of_beauty_sales_goals",
      "cust_cnt_at_beauty_reg",
      "beauty_sales_at_beauty_register",
      "flu_immunization",
      "non_flu_immunization",
      "generic_efficiency",
      "positive_response",
      "items_changed_to_zero_pct",
      "order_change_pct_ss",
      "pct_compliant",
      "self_service_product_loss",
      "unsaleable_claims",
      "beauty_enthusiast_autoprompt_success_rate",
      "beauty_enthusiast_cashier_triggered_success_rate"]
  }

}
