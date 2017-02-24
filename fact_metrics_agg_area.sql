CREATE EXTERNAL TABLE IF NOT EXISTS metrics_wba_dev.fact_metrics_agg_area (
	  `toperiod` date,
	  `computeperiod` string,
	  `cadence` string,
	  `period_comparison` string,
	  `overall_net_promoter_score` float,
	  `phone_hold_time` float,
	  `rx_average_time_to_ready` float,
	  `return_to_stock_sold_pct` float,
	  `verified_by_promise_time` float,
	  `basic_department_outs` float,
	  `payroll_hours` float,
	  `payroll_hours_target` float,
	  `front_end_actual_vs_budget` float,
	  `pharmacy_actual_vs_budget` float,
	  `non_rph_overtime` float,
	  `pharmacist_b_pay` float,
	  `pharmacy_net_promoter_score` float,
	  `rx_partial_fills` bigint,
	  `overall_nps` float,
	  `overall_nps_target` float,
	  `rx_nps` float,
	  `rx_nps_target` float,
	  `departments_not_scanned` float,
	  `rx_per_day` float,
	  `ly_rx_per_day` float,
	  `rx_per_day_yoy_pct` float,
	  `rx_per_day_target` float,
	  `rx_per_day_target_pct` float,
	  `rx_waiters_pct` float,
	  `efficiency_rate_90_days` float,
	  `scan_out_execution` float,
	  `total_no_of_changes_ss` bigint,
	  `ss_smart_count_compliance_pct` float,
	  `smart_count_unchanged_pct` float,
	  `beauty_sales_at_all_registers` float,
	  `beauty_sales_goal` float,
	  `pct_of_beauty_sales_goals` float,
	  `cust_cnt_at_beauty_reg` float,
	  `beauty_sales_at_beauty_register` float,
	  `flu_immunization` bigint,
	  `non_flu_immunization` bigint,
	  `generic_efficiency` float,
	  `positive_response` float,
	  `items_changed_to_zero_pct` float,
	  `order_change_pct_ss` float,
	  `pct_compliant` float,
	  `self_service_product_loss` float,
	  `unsaleable_claims` float,
	  `beauty_enthusiast_autoprompt_success_rate` float,
	  `beauty_enthusiast_cashier_triggered_success_rate` float 
	)
	partitioned by (area_id string)
	ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
	WITH SERDEPROPERTIES (
		  'serialization.format' = ',',
		  'field.delim' = ','
	) LOCATION 's3://metrics-wba-dev/fact_metrics_agg_area/'

