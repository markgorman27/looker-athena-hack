view: fact_metrics {
  sql_table_name: metrics_wba_dev.fact_metrics ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.store_id || ${TABLE}.calendar_date || ${TABLE}.cadence ;;
  }

  dimension: calendar_date {
    type: date
    hidden: yes
    convert_tz: no
    sql: ${TABLE}.calendar_date  ;;
  }

  measure: overall_net_promoter_score {
    label: "Overall Net Promoter Score"
    type: number
    value_format_name: percent_1
    sql: case
           when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.overall_nps_denominator end) = 0 then null
           else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.overall_nps*${TABLE}.overall_nps_denominator end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.overall_nps_denominator end)/100.0
         end ;;
  }

  measure: overall_net_promoter_score_comparison {
    label: "Overall Net Promoter Score Comparison"
    type: average
    value_format_name: percent_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_store.overall_nps}/100.0
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN ${fact_metrics_agg_store.overall_nps_target}/100.0
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_district.overall_nps}/100.0
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN null
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_area.overall_nps}/100.0
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN null
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_region.overall_nps}/100.0
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN null
             END
      END
       ;;
  }

  measure: overall_net_promoter_score_last_update {
    label: "Overall Net Promoter Score Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.overall_nps_last_update) ;;
  }

  measure: phone_hold_time {
    label: "Phone Hold Time"
    type: number
    value_format_name: decimal_1
    sql: case
           when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.phone_hold_time_denominator end) = 0 then null
           else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.phone_hold_time*${TABLE}.phone_hold_time_denominator end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.phone_hold_time_denominator end)
         end ;;
  }

  measure: phone_hold_time_comparison {
    label: "Phone Hold Time Comparison"
    type: average
    value_format_name: decimal_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.phone_hold_time}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.phone_hold_time}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.phone_hold_time}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.phone_hold_time}
      END
       ;;
  }

  measure: phone_hold_time_last_update {
    label: "Phone Hold Time Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.phone_hold_time_last_update) ;;
  }

  measure: rx_average_time_to_ready {
    label: "RX Average Time to Ready"
    type: number
    value_format_name: decimal_1
    sql: avg(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.rx_average_time_to_ready end)
      ;;
  }

  measure: rx_average_time_to_ready_comparison {
    label: "RX Average Time to Ready Comparison"
    type: average
    value_format_name: decimal_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.rx_average_time_to_ready}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.rx_average_time_to_ready}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.rx_average_time_to_ready}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.rx_average_time_to_ready}
      END
       ;;
  }

  measure: rx_average_time_to_ready_last_update {
    label: "RX Average Time to Ready Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.rx_average_time_to_ready_last_update) ;;
  }

  measure: return_to_stock_sold_pct {
    label: "Return to Stock % Sold"
    type: number
    value_format_name: percent_1
    sql: case
           when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.return_to_stock_sold_den end) = 0 then null
           else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.return_to_stock_sold_pct*${TABLE}.return_to_stock_sold_den end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.return_to_stock_sold_den end)/100.0
         end ;;
  }

  measure: return_to_stock_sold_pct_comparison {
    label: "Return to Stock % Sold Comparison"
    type: average
    value_format_name: percent_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.return_to_stock_sold_pct}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.return_to_stock_sold_pct}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.return_to_stock_sold_pct}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.return_to_stock_sold_pct}/100.0
      END
       ;;
  }

  measure: return_to_stock_sold_pct_last_update {
    label: "Return to Stock % Sold Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.return_to_stock_sold_pct_last_update) ;;
  }

  measure: verified_by_promise_time {
    label: "Verified by Promised Time"
    type: number
    value_format_name: percent_1
    sql: case
           when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.verified_by_promise_time_denominator end) = 0 then null
           else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.verified_by_promise_time*${TABLE}.verified_by_promise_time_denominator end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.verified_by_promise_time_denominator end)/100.0
         end ;;
  }

  measure: verified_by_promise_time_comparison {
    label: "Verified by Promised Time Comparison"
    type: average
    value_format_name: percent_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.verified_by_promise_time}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.verified_by_promise_time}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.verified_by_promise_time}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.verified_by_promise_time}/100.0
      END
       ;;
  }

  measure: verified_by_promise_time_last_update {
    label: "Verified by Promised Time Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.verified_by_promise_time_last_update) ;;
  }

  measure: basic_department_outs {
    label: "Basic Department Outs"
    type: number
    value_format_name: decimal_0
    sql: avg(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.basic_department_outs end)
      ;;
  }

  measure: basic_department_outs_comparison {
    label: "Basic Department Outs Comparison"
    type: average
    value_format_name: decimal_0
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.basic_department_outs}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.basic_department_outs}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.basic_department_outs}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.basic_department_outs}
      END
       ;;
  }

  measure: basic_department_outs_last_update {
    label: "Basic Department Outs Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.basic_department_outs_last_update) ;;
  }

  measure: payroll_hours {
    label: "Total Payroll Hours (Variance to Budget)"
    type: number
    value_format_name: decimal_0
    sql: avg(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.payroll_hours end)
      ;;
  }

  measure: payroll_hours_comparison {
    label: "Total Payroll Hours (Variance to Budget) Comparison"
    type: average
    value_format_name: decimal_0
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_store.payroll_hours}
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN ${fact_metrics_agg_store.payroll_hours_target}
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_district.payroll_hours}
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN ${fact_metrics_agg_district.payroll_hours_target}
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_area.payroll_hours}
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN ${fact_metrics_agg_area.payroll_hours_target}
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_region.payroll_hours}
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN ${fact_metrics_agg_region.payroll_hours_target}
             END
      END
       ;;
  }

  measure: payroll_hours_last_update {
    label: "Total Payroll Hours (Variance to Budget) Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.payroll_hours_last_update) ;;
  }

  measure: front_end_actual_vs_budget {
    label: "Front End Actual vs. Budget"
    type: number
    value_format_name: decimal_1
    sql: avg(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.front_end_actual_vs_budget end)
      ;;
  }

  measure: front_end_actual_vs_budget_comparison {
    label: "Front End Actual vs. Budget Comparison"
    type: average
    value_format_name: decimal_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.front_end_actual_vs_budget}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.front_end_actual_vs_budget}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.front_end_actual_vs_budget}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.front_end_actual_vs_budget}
      END
       ;;
  }

  measure: front_end_actual_vs_budget_last_update {
    label: "Front End Actual vs. Budget Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.front_end_actual_vs_budget_last_update) ;;
  }

  measure: pharmacy_actual_vs_budget {
    label: "Pharmacy Actual vs. Budget"
    type: number
    value_format_name: decimal_1
    sql: avg(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.pharmacy_actual_vs_budget end)
      ;;
  }

  measure: pharmacy_actual_vs_budget_comparison {
    label: "Pharmacy Actual vs. Budget Comparison"
    type: average
    value_format_name: decimal_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.pharmacy_actual_vs_budget}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.pharmacy_actual_vs_budget}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.pharmacy_actual_vs_budget}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.pharmacy_actual_vs_budget}
      END
       ;;
  }

  measure: pharmacy_actual_vs_budget_last_update {
    label: "Pharmacy Actual vs. Budget Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.pharmacy_actual_vs_budget_last_update) ;;
  }

  measure: non_rph_overtime {
    label: "Non-Rph Overtime"
    type: number
    value_format_name: decimal_2
    sql: avg(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.non_rph_overtime end)
      ;;
  }

  measure: non_rph_overtime_comparison {
    label: "Non-Rph Overtime Comparison"
    type: average
    value_format_name: decimal_2
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.non_rph_overtime}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.non_rph_overtime}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.non_rph_overtime}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.non_rph_overtime}
      END
       ;;
  }

  measure: non_rph_overtime_last_update {
    label: "Non-Rph Overtime Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.non_rph_overtime_last_update) ;;
  }

  measure: pharmacist_b_pay {
    label: "Pharmacist B-Pay"
    type: number
    value_format_name: decimal_2
    sql: avg(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.pharmacist_b_pay end)
      ;;
  }

  measure: pharmacist_b_pay_comparison {
    label: "Pharmacist B-Pay Comparison"
    type: average
    value_format_name: decimal_2
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.pharmacist_b_pay}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.pharmacist_b_pay}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.pharmacist_b_pay}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.pharmacist_b_pay}
      END
       ;;
  }

  measure: pharmacist_b_pay_last_update {
    label: "Pharmacist B-Pay Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.pharmacist_b_pay_last_update) ;;
  }

  measure: pharmacy_net_promoter_score {
    label: "Pharmacy Net Promoter Score"
    type: number
    value_format_name: percent_1
    sql: case
           when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.rx_nps_denominator end) = 0 then null
           else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.rx_nps*${TABLE}.rx_nps_denominator end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.rx_nps_denominator end)/100.0
         end ;;
  }

  measure: pharmacy_net_promoter_score_comparison {
    label: "Pharmacy Net Promoter Score Comparison"
    type: average
    value_format_name: percent_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_store.rx_nps}/100.0
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN ${fact_metrics_agg_store.rx_nps_target}/100.0
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_district.rx_nps}/100.0
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN null
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_area.rx_nps}/100.0
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN null
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_region.rx_nps}/100.0
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN null
             END
      END
       ;;
  }

  measure: pharmacy_net_promoter_score_last_update {
    label: "Pharmacy Net Promoter Score Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.rx_nps_last_update) ;;
  }

  measure: rx_partial_fills {
    label: "RX Partial Fills"
    type: number
    value_format_name: decimal_0
    sql: sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.rx_partial_fills end)
      ;;
  }

  measure: rx_partial_fills_comparison {
    label: "RX Partial Fills Comparison"
    type: average
    value_format_name: decimal_0
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.rx_partial_fills}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.rx_partial_fills}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.rx_partial_fills}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.rx_partial_fills}
      END
       ;;
  }

  measure: rx_partial_fills_last_update {
    label: "RX Partial Fills Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.rx_partial_fills_last_update) ;;
  }

  measure: departments_not_scanned {
    label: "Departments Not Scanned"
    type: number
    value_format_name: decimal_1
    sql: avg(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.departments_not_scanned end)
      ;;
  }

  measure: departments_not_scanned_comparison {
    label: "Departments Not Scanned Comparison"
    type: average
    value_format_name: decimal_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.departments_not_scanned}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.departments_not_scanned}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.departments_not_scanned}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.departments_not_scanned}
      END
       ;;
  }

  measure: departments_not_scanned_last_update {
    label: "Departments Not Scanned Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.departments_not_scanned_last_update) ;;
  }

  measure: rx_per_day {
    label: "RX/Day (90 Day Adjusted)"
    type: number
    value_format_name:decimal_1
    sql: case
           when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.rx_per_day_sample_size end) = 0 then null
           else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.rx_per_day_actuals*${TABLE}.rx_per_day_sample_size end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.rx_per_day_sample_size end)
         end ;;
  }

  measure: ly_rx_per_day {
    label: "RX/Day (90 Day Adjusted) - LY"
    hidden: yes
    type: number
    value_format_name:decimal_1
    sql: case
           when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.ly_rx_per_day_sample_size end) = 0 then null
           else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.ly_rx_per_day_actuals*${TABLE}.ly_rx_per_day_sample_size end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.ly_rx_per_day_sample_size end)
         end ;;
  }

  measure: rx_per_day_yoy_pct {
    label: "RX/Day (90 Day Adjusted) - YoY %"
    hidden: yes
    type: number
    value_format_name: percent_1
    sql: case
           when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.rx_per_day_sample_size end)*sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.ly_rx_per_day_actuals*${TABLE}.ly_rx_per_day_sample_size end) = 0 then null
           else (sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.rx_per_day_actuals*${TABLE}.rx_per_day_sample_size end)*sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.ly_rx_per_day_sample_size end))/(sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.rx_per_day_sample_size end)*sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.ly_rx_per_day_actuals*${TABLE}.ly_rx_per_day_sample_size end)) - 1
         end ;;
  }

  measure: rx_per_day_target {
    label: "RX/Day (90 Day Adjusted) - Target"
    hidden: yes
    type: number
    value_format_name:decimal_1
    sql: case
           when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.ly_rx_per_day_sample_size end) = 0 then null
           else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.rx_per_day_target_actuals*${TABLE}.ly_rx_per_day_sample_size end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.ly_rx_per_day_sample_size end)
         end ;;
  }

  measure: rx_per_day_target_pct {
    label: "RX/Day (90 Day Adjusted) - Target Pct"
    hidden: yes
    type: number
    value_format_name:percent_1
    sql: case
           when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.ly_rx_per_day_actuals*${TABLE}.ly_rx_per_day_sample_size end) = 0 then null
           else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.rx_per_day_target_actuals*${TABLE}.ly_rx_per_day_sample_size end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.ly_rx_per_day_actuals*${TABLE}.ly_rx_per_day_sample_size end) - 1
         end ;;
  }

  measure: rx_per_day_comparison {
    label: "RX/Day (90 Day Adjusted) Comparison"
    type: average
    value_format_name: decimal_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_store.rx_per_day}
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN ${fact_metrics_agg_store.rx_per_day_target}
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_district.rx_per_day}
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN ${fact_metrics_agg_district.rx_per_day_target}
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_area.rx_per_day}
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN ${fact_metrics_agg_area.rx_per_day_target}
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_region.rx_per_day}
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN ${fact_metrics_agg_region.rx_per_day_target}
             END
      END
       ;;
  }

  measure: rx_per_day_last_update {
    label: "RX/Day (90 Day Adjusted) Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.rx_per_day_actuals_last_update) ;;
  }

  measure: rx_waiters_pct {
    label: "RX % Waiters"
    type: number
    value_format_name: percent_1
    sql: case
           when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.rx_waiters_den end) = 0 then null
           else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.rx_waiters_pct*${TABLE}.rx_waiters_den end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.rx_waiters_den end)/100.0
         end ;;
  }

  measure: rx_waiters_pct_comparison {
    label: "RX % Waiters Comparison"
    type: average
    value_format_name: percent_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.rx_waiters_pct}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.rx_waiters_pct}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.rx_waiters_pct}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.rx_waiters_pct}/100.0
      END
       ;;
  }

  measure: rx_waiters_pct_last_update {
    label: "RX % Waiters Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.rx_waiters_pct_last_update) ;;
  }

  measure: efficiency_rate_90_days {
    label: "90 Day Efficiency Rate"
    type: number
    value_format_name: percent_1
    sql: avg(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.efficiency_rate_90_days end)/100.0
      ;;
  }

  measure: efficiency_rate_90_days_comparison {
    label: "90 Day Efficiency Rate Comparison"
    type: average
    value_format_name: percent_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.efficiency_rate_90_days}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.efficiency_rate_90_days}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.efficiency_rate_90_days}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.efficiency_rate_90_days}/100.0
      END
       ;;
  }

  measure: efficiency_rate_90_days_last_update {
    label: "90 Day Efficiency Rate Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.efficiency_rate_90_days_last_update) ;;
  }

  measure: scan_out_execution {
    label: "Scan Out Execution"
    type: number
    value_format_name: percent_1
    sql: avg(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.scan_out_execution end)/100.0
      ;;
  }

  measure: scan_out_execution_comparison {
    label: "Scan Out Execution Comparison"
    type: average
    value_format_name: percent_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_store.scan_out_execution}/100.0
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN .85
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_district.scan_out_execution}/100.0
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN .80
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_area.scan_out_execution}/100.0
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN null
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_region.scan_out_execution}/100.0
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN null
             END
    END
    ;;
  }

  measure: scan_out_execution_last_update {
    label: "Scan Out Execution Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.scan_out_execution_last_update) ;;
  }

  measure: total_no_of_changes_ss {
    label: "Total # of Changes"
    type: number
    value_format_name: decimal_0
    sql: sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.total_no_of_changes_ss end)
      ;;
  }

  measure: total_no_of_changes_ss_comparison {
    label: "Total # of Changes Comparison"
    type: average
    value_format_name: decimal_0
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.total_no_of_changes_ss}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.total_no_of_changes_ss}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.total_no_of_changes_ss}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.total_no_of_changes_ss}
      END
       ;;
  }

  measure: total_no_of_changes_ss_last_update {
    label: "Total # of Changes Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.total_no_of_changes_ss_last_update) ;;
  }

  measure: ss_smart_count_compliance_pct {
    label: "Smart Count Compliance %"
    type: number
    value_format_name: percent_1
    sql: avg(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.ss_smart_count_compliance_pct end)/100.0
      ;;
  }

  measure: ss_smart_count_compliance_pct_comparison {
    label: "Smart Count Compliance % Comparison"
    type: average
    value_format_name: percent_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.ss_smart_count_compliance_pct}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.ss_smart_count_compliance_pct}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.ss_smart_count_compliance_pct}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.ss_smart_count_compliance_pct}/100.0
      END
       ;;
  }

  measure: ss_smart_count_compliance_pct_last_update {
    label: "Smart Count Compliance % Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.ss_smart_count_compliance_pct_last_update) ;;
  }

  measure: smart_count_unchanged_pct {
    label: "Smart Count Unchanged %"
    type: number
    value_format_name: percent_1
    sql: avg(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.smart_count_unchanged_pct end)/100.0
      ;;
  }

  measure: smart_count_unchanged_pct_comparison {
    label: "Smart Count Unchanged % Comparison"
    type: average
    value_format_name: percent_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.smart_count_unchanged_pct}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.smart_count_unchanged_pct}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.smart_count_unchanged_pct}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.smart_count_unchanged_pct}/100.0
      END
       ;;
  }

  measure: smart_count_unchanged_pct_last_update {
    label: "Smart Count Unchanged % Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.smart_count_unchanged_pct_last_update) ;;
  }

  measure: beauty_sales_at_all_registers {
    label: "Beauty Sales"
    type: number
    value_format_name: usd
    sql: avg(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.beauty_sales_at_all_registers end)
      ;;
  }

  measure: beauty_sales_at_all_registers_comparison {
    label: "Beauty Sales Comparison"
    type: average
    value_format_name: usd
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_store.beauty_sales_at_all_registers}
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN ${fact_metrics_agg_store.beauty_sales_goal}
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_district.beauty_sales_at_all_registers}
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN ${fact_metrics_agg_district.beauty_sales_goal}
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_area.beauty_sales_at_all_registers}
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN ${fact_metrics_agg_area.beauty_sales_goal}
             END
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN CASE
               WHEN {% condition dataset_comparison %} 'Actual' {% endcondition %}
               THEN ${fact_metrics_agg_region.beauty_sales_at_all_registers}
               WHEN {% condition dataset_comparison %} 'Target' {% endcondition %}
               THEN ${fact_metrics_agg_region.beauty_sales_goal}
             END
    END
    ;;
  }

  measure: beauty_sales_at_all_registers_last_update {
    label: "Beauty Sales Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.beauty_sales_at_all_registers_last_update) ;;
  }

  measure: pct_of_beauty_sales_goals {
    label: "% of Beauty Sales Goal"
    type: number
    value_format_name:decimal_1
    sql: case
           when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.beauty_sales_goal end) = 0 then null
           else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.beauty_sales_at_all_registers end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.beauty_sales_goal end)
         end ;;
  }

  measure: pct_of_beauty_sales_goals_comparison {
    label: "% of Beauty Sales Goal Comparison"
    type: average
    value_format_name: decimal_1
    sql: CASE
           WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
            AND {% condition entity_comparison %} 'Store' {% endcondition %}
           THEN ${fact_metrics_agg_store.pct_of_beauty_sales_goals}
           WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
            AND {% condition entity_comparison %} 'District' {% endcondition %}
           THEN ${fact_metrics_agg_district.pct_of_beauty_sales_goals}
           WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
            AND {% condition entity_comparison %} 'Area' {% endcondition %}
           THEN ${fact_metrics_agg_area.pct_of_beauty_sales_goals}
           WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
            AND {% condition entity_comparison %} 'Region' {% endcondition %}
           THEN ${fact_metrics_agg_region.pct_of_beauty_sales_goals}
         END
    ;;
  }

  measure: pct_of_beauty_sales_goals_last_update {
    label: "% of Beauty Sales Goal Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.pct_of_beauty_sales_goals_last_update) ;;
  }

  measure: cust_cnt_at_beauty_reg {
    label: "Customer Count at Beauty Register"
    type: number
    value_format_name: decimal_1
    sql: avg(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.cust_cnt_at_beauty_reg end)
      ;;
  }

  measure: cust_cnt_at_beauty_reg_comparison {
    label: "Customer Count at Beauty Register Comparison"
    type: average
    value_format_name: decimal_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.cust_cnt_at_beauty_reg}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.cust_cnt_at_beauty_reg}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.cust_cnt_at_beauty_reg}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.cust_cnt_at_beauty_reg}
      END
       ;;
  }

  measure: cust_cnt_at_beauty_reg_last_update {
    label: "Customer Count at Beauty Register Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.cust_cnt_at_beauty_reg_last_update) ;;
  }

  measure: beauty_sales_at_beauty_register {
    label: "Beauty Sales at Beauty Register"
    type: number
    value_format_name: usd
    sql: avg(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.beauty_sales_at_beauty_register end)
      ;;
  }

  measure: beauty_sales_at_beauty_register_comparison {
    label: "Beauty Sales at Beauty Register Comparison"
    type: average
    value_format_name: usd
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.beauty_sales_at_beauty_register}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.beauty_sales_at_beauty_register}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.beauty_sales_at_beauty_register}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.beauty_sales_at_beauty_register}
      END
    ;;
  }

  measure: beauty_sales_at_beauty_register_last_update {
    label: "Beauty Sales at Beauty Register Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.beauty_sales_at_beauty_register_last_update) ;;
  }

  measure: flu_immunization {
    label: "Flu Immunization"
    type: number
    value_format_name: decimal_0
    sql: sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.flu_immunization end)
      ;;
  }

  measure: flu_immunization_comparison {
    label: "Flu Immunization Comparison"
    type: average
    value_format_name: decimal_0
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.flu_immunization}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.flu_immunization}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.flu_immunization}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.flu_immunization}
      END
       ;;
  }

  measure: flu_immunization_last_update {
    label: "Flu Immunization Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.flu_immunization_last_update) ;;
  }

  measure: non_flu_immunization {
    label: "Non-Flu Immunization"
    type: number
    value_format_name: decimal_0
    sql: sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.non_flu_immunization end)
      ;;
  }

  measure: non_flu_immunization_comparison {
    label: "Non-Flu Immunization Comparison"
    type: average
    value_format_name: decimal_0
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.non_flu_immunization}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.non_flu_immunization}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.non_flu_immunization}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.non_flu_immunization}
      END
       ;;
  }

  measure: non_flu_immunization_last_update {
    label: "Non-Flu Immunization Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.non_flu_immunization_last_update) ;;
  }

  measure: generic_efficiency {
    label: "Generic Efficiency %"
    type: number
    value_format_name:decimal_1
    sql: case
           when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.generic_efficiency_denominator end) = 0 then null
           else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.generic_efficiency*${TABLE}.generic_efficiency_denominator end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.generic_efficiency_denominator end)
         end ;;
  }

  measure: generic_efficiency_comparison {
    label: "Generic Efficiency % Comparison"
    type: average
    value_format_name: decimal_1
    sql: CASE
           WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
            AND {% condition entity_comparison %} 'Store' {% endcondition %}
           THEN ${fact_metrics_agg_store.generic_efficiency}
           WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
            AND {% condition entity_comparison %} 'District' {% endcondition %}
           THEN ${fact_metrics_agg_district.generic_efficiency}
           WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
            AND {% condition entity_comparison %} 'Area' {% endcondition %}
           THEN ${fact_metrics_agg_area.generic_efficiency}
           WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
            AND {% condition entity_comparison %} 'Region' {% endcondition %}
           THEN ${fact_metrics_agg_region.generic_efficiency}
         END
    ;;
  }

  measure: generic_efficiency_last_update {
    label: "Generic Efficiency % Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.generic_efficiency_last_update) ;;
  }

  measure: positive_response {
    label: "90-Day Patient Indicator"
    type: number
    value_format_name: percent_1
    sql: case
          when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.positive_response + ${TABLE}.negative_response end) = 0 then null
          else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.positive_response end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.positive_response + ${TABLE}.negative_response end)
          end ;;
  }

  measure: positive_response_comparison {
    label: "90-Day Patient Indicator Comparison"
    type: average
    value_format_name: percent_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.positive_response}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.positive_response}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.positive_response}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.positive_response}
      END
    ;;
  }

  measure: positive_response_last_update {
    label: "90-Day Patient Indicator Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.positive_response_last_update) ;;
  }

  measure: items_changed_to_zero_pct {
    label: "Items Changed to 0%"
    type: number
    value_format_name: percent_1
    sql: avg(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.items_changed_to_zero_pct end)/100.0
      ;;
  }

  measure: items_changed_to_zero_pct_comparison {
    label: "Items Changed to 0% Comparison"
    type: average
    value_format_name: percent_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.items_changed_to_zero_pct}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.items_changed_to_zero_pct}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.items_changed_to_zero_pct}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.items_changed_to_zero_pct}/100.0
      END
       ;;
  }

  measure: items_changed_to_zero_pct_last_update {
    label: "Items Changed to 0% Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.items_changed_to_zero_pct_last_update) ;;
  }

  measure: order_change_pct_ss {
    label: "Order Change %"
    type: number
    value_format_name: percent_1
    sql: case
          when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.order_change_pct_denominator_ss end) = 0 then null
          else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.order_change_pct_ss*${TABLE}.order_change_pct_denominator_ss end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.order_change_pct_denominator_ss end)/100.0
          end ;;
  }

  measure: order_change_pct_ss_comparison {
    label: "Order Change % Comparison"
    type: average
    value_format_name: percent_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.order_change_pct_ss}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.order_change_pct_ss}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.order_change_pct_ss}/100.0
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.order_change_pct_ss}/100.0
      END
    ;;
  }

  measure: order_change_pct_ss_last_update {
    label: "Order Change % Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.order_change_pct_ss_last_update) ;;
  }

  measure: pct_compliant {
    label: "% Compliant"
    type: number
    value_format_name: percent_1
    sql: case
          when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.pct_compliant_denominator end) = 0 then null
          else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.pct_compliant*${TABLE}.pct_compliant_denominator end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.pct_compliant_denominator end)
          end ;;
  }

  measure: pct_compliant_comparison {
    label: "% Compliant Comparison"
    type: average
    value_format_name: percent_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.pct_compliant}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.pct_compliant}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.pct_compliant}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.pct_compliant}
      END
    ;;
  }

  measure: pct_compliant_last_update {
    label: "% Compliant Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.pct_compliant_last_update) ;;
  }

  measure: self_service_product_loss {
    label: "Self Service Product Loss"
    type: number
    value_format_name: usd
    sql: sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.self_service_product_loss end)
      ;;
  }

  measure: self_service_product_loss_comparison {
    label: "Self Service Product Loss Comparison"
    type: average
    value_format_name: usd
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.self_service_product_loss}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.self_service_product_loss}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.self_service_product_loss}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.self_service_product_loss}
      END
       ;;
  }

  measure: self_service_product_loss_last_update {
    label: "Self Service Product Loss Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.self_service_product_loss_last_update) ;;
  }

  measure: unsaleable_claims {
    label: "Unsaleable Claims (1506)"
    type: number
    value_format_name: usd
    sql: sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.unsaleable_claims end)
      ;;
  }

  measure: unsaleable_claims_comparison {
    label: "Unsaleable Claims (1506) Comparison"
    type: average
    value_format_name: usd
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.unsaleable_claims}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.unsaleable_claims}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.unsaleable_claims}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.unsaleable_claims}
      END
       ;;
  }

  measure: unsaleable_claims_last_update {
    label: "Unsaleable Claims (1506) Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.unsaleable_claims_last_update) ;;
  }

  measure: beauty_enthusiast_autoprompt_success_rate {
    label: "Beauty Enthusiast AutoPrompt Success Rate"
    type: number
    value_format_name: percent_1
    sql: case
          when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.beauty_enthusiast_autoprompt_success_rate_denominator end) = 0 then null
          else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.beauty_enthusiast_autoprompt_success_rate*${TABLE}.beauty_enthusiast_autoprompt_success_rate_denominator end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.beauty_enthusiast_autoprompt_success_rate_denominator end)
          end ;;
  }

  measure: beauty_enthusiast_autoprompt_success_rate_comparison {
    label: "Beauty Enthusiast AutoPrompt Success Rate Comparison"
    type: average
    value_format_name: percent_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.beauty_enthusiast_autoprompt_success_rate}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.beauty_enthusiast_autoprompt_success_rate}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.beauty_enthusiast_autoprompt_success_rate}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.beauty_enthusiast_autoprompt_success_rate}
      END
    ;;
  }

  measure: beauty_enthusiast_autoprompt_success_rate_last_update {
    label: "Beauty Enthusiast AutoPrompt Success Rate Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.beauty_enthusiast_autoprompt_success_rate_last_update) ;;
  }

  measure: beauty_enthusiast_cashier_triggered_success_rate {
    label: "Beauty Enthusiast Cashier Triggered Success Rate"
    type: number
    value_format_name: percent_1
    sql: case
          when sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.beauty_enthusiast_cashier_triggered_success_rate_denominator end) = 0 then null
          else sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.beauty_enthusiast_cashier_triggered_success_rate*${TABLE}.beauty_enthusiast_cashier_triggered_success_rate_denominator end)/sum(case when ${dim_period_dates.period_comparison} = 'Current' then ${TABLE}.beauty_enthusiast_cashier_triggered_success_rate_denominator end)
          end ;;
  }

  measure: beauty_enthusiast_cashier_triggered_success_rate_comparison {
    label: "Beauty Enthusiast Cashier Triggered Success Rate Comparison"
    type: average
    value_format_name: percent_1
    sql: CASE
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Store' {% endcondition %}
        THEN ${fact_metrics_agg_store.beauty_enthusiast_cashier_triggered_success_rate}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'District' {% endcondition %}
        THEN ${fact_metrics_agg_district.beauty_enthusiast_cashier_triggered_success_rate}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Area' {% endcondition %}
        THEN ${fact_metrics_agg_area.beauty_enthusiast_cashier_triggered_success_rate}
        WHEN {% condition period_comparison %} ${dim_period_dates.period_comparison} {% endcondition %}
         AND {% condition entity_comparison %} 'Region' {% endcondition %}
        THEN ${fact_metrics_agg_region.beauty_enthusiast_cashier_triggered_success_rate}
      END
    ;;
  }

  measure: beauty_enthusiast_cashier_triggered_success_rate_last_update {
    label: "Beauty Enthusiast Cashier Triggered Success Rate Last Update"
    hidden:  yes
    type: date
    sql: max(${TABLE}.beauty_enthusiast_cashier_triggered_success_rate_last_update) ;;
  }

  dimension: store_id {
    type: string
    hidden:  yes
    sql: ${TABLE}.store_id ;;
  }

  dimension: cadence {
    type: string
    hidden:  yes
    sql: ${TABLE}.cadence ;;
  }

  filter: period_comparison {
    label: "Comparison Period"
    description: "Choose behavior of comparison measures"
    type: string
    default_value: "Current"
    suggestions: ["Current", "Prior Period", "Prior Year"]
  }

  filter: entity_comparison {
    label: "Comparison Entity"
    description: "Choose behavior of comparison measures"
    type: string
    default_value: "Store"
    suggestions: ["Store", "District", "Area", "Region"]
  }

  filter: dataset_comparison {
    label: "Comparison Dataset"
    description: "Choose behavior of comparison measures"
    type: string
    default_value: "Actual"
    suggestions: ["Actual", "Target"]
  }
}