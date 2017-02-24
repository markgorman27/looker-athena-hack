- dashboard: walgreens_sm_tile
  title: Walgreens IMPROvE
  layout: tile
  tile_size: 1
  load_configuration: prefetch_cache_run

  embed_style:
    show_filters_bar: false
    background_color: "transparent"
    show_title: false

  filters:
    - name: store_id
      title: Store ID
      type: string_filter
      model: walgreens_poc_athena
      explore: hero_metrics
      field: dim_entity.store_id

  elements:
  - name: focus_metrics_section_heading
    type: text
    height: 50
    width: 930
    title_text: "Focus Metrics"

  - name: flu_immunization_focus
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: flu_immunization
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: rx_waiters_pct_focus
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: rx_waiters_pct
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: rx_average_time_to_ready_focus
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: rx_average_time_to_ready
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: beauty_sales_at_beauty_register_focus
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: beauty_sales_at_beauty_register
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: improve_section_heading
    type: text
    height: 100
    width: 930
    title_text: "IMPROvE"

  - name: overall_net_promoter_score_improve
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Target
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Current
      fact_metrics.hero_metric_selector: overall_net_promoter_score
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: pharmacy_net_promoter_score_improve
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Target
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Current
      fact_metrics.hero_metric_selector: pharmacy_net_promoter_score
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: payroll_hours_improve
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: payroll_hours
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: rx_per_day_improve
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Target
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Current
      fact_metrics.hero_metric_selector: rx_per_day
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: scan_out_execution_improve
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Target
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Current
      fact_metrics.hero_metric_selector: scan_out_execution
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: metric_details_section_heading
    type: text
    height: 50
    width: 930
    title_text: "Metric Details"

  - name: nps_section_heading
    type: text
    height: 50
    width: 930
    title_text: "Net Promoter Score KPIs"

  - name: overall_net_promoter_score_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: overall_net_promoter_score
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: overall_nps_trend
    title: Overall NPS trend
    height: 250
    width: 690
    type: looker_line
    model: walgreens_poc_athena
    explore: fact_metrics
    dimensions: [dim_period.toperiod]
    measures: [fact_metrics.overall_net_promoter_score, fact_metrics.overall_net_promoter_score_comparison]
    dynamic_fields:
    - table_calculation: date
      label: Date
      expression: trunc_months(${dim_period.toperiod})
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: District
      fact_metrics.period_comparison: Current
      dim_period.computeperiod: 1MO
      fact_metrics.overall_net_promoter_score: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [dim_period.toperiod desc]
    limit: '12'
    column_limit: '50'
    query_timezone: America/Chicago
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: circle
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    series_types: {}
    series_labels:
      fact_metrics.overall_net_promoter_score: 'Overall NPS'
      # Put in pointer to current comparison
      fact_metrics.overall_net_promoter_score_comparison: 'vs. District'
    x_axis_datetime_label: '%b %Y'
    y_axis_unpin: true
    y_axis_value_format: '#%'
    hidden_fields: [dim_period.toperiod]

  - name: nps_related_heading
    type: text
    height: 100
    width: 930
    body_text: "Net Promoter Score Related KPIs"

  - name: phone_hold_time_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: phone_hold_time
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: rx_average_time_to_ready_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: rx_average_time_to_ready
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: return_to_stock_sold_pct_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: return_to_stock_sold_pct
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: pharmacy_net_promoter_score_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: pharmacy_net_promoter_score
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: verified_by_promise_time_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: verified_by_promise_time
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: total_payroll_hours_heading
    type: text
    height: 100
    width: 930
    title_text: "Payroll Hours"

  - name: payroll_hours_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: payroll_hours
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: payroll_hours_trend
    title: Total Payroll Hours Trend (Variance to Budget)
    height: 250
    width: 690
    type: looker_line
    model: walgreens_poc_athena
    explore: fact_metrics
    dimensions: [dim_period.toperiod]
    measures: [fact_metrics.payroll_hours, fact_metrics.payroll_hours_comparison]
    dynamic_fields:
    - table_calculation: date
      label: Date
      expression: trunc_months(${dim_period.toperiod})
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: District
      fact_metrics.period_comparison: Current
      dim_period.computeperiod: 1MO
      fact_metrics.payroll_hours: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [dim_period.toperiod desc]
    limit: '12'
    column_limit: '50'
    query_timezone: America/Chicago
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: circle
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    series_types: {}
    series_labels:
      fact_metrics.payroll_hours: 'Payroll Hours'
      # Put in pointer to current comparison
      fact_metrics.payroll_hours_comparison: 'vs. District'
    x_axis_datetime_label: '%b %Y'
    y_axis_unpin: true
    y_axis_value_format: '#'
    hidden_fields: [dim_period.toperiod]

  - name: payroll_hours_related_heading
    type: text
    height: 100
    width: 930
    body_text: "Payroll Hours Related KPIs"

  - name: pharmacy_actual_vs_budget_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: pharmacy_actual_vs_budget
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: pharmacist_b_pay_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: pharmacist_b_pay
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: non_rph_overtime_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: non_rph_overtime
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: rx_per_day_heading
    type: text
    height: 100
    width: 930
    title_text: "RX/Day (90 Day Adjusted)"

  - name: rx_per_day_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: rx_per_day
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: rx_per_day_trend
    title: RX/Day (90 Day Adjusted)
    height: 250
    width: 690
    type: looker_line
    model: walgreens_poc_athena
    explore: fact_metrics
    dimensions: [dim_period.toperiod]
    measures: [fact_metrics.rx_per_day, fact_metrics.rx_per_day_comparison]
    dynamic_fields:
    - table_calculation: date
      label: Date
      expression: trunc_months(${dim_period.toperiod})
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: District
      fact_metrics.period_comparison: Current
      dim_period.computeperiod: 1MO
      fact_metrics.rx_per_day: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [dim_period.toperiod desc]
    limit: '12'
    column_limit: '50'
    query_timezone: America/Chicago
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: circle
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    series_types: {}
    series_labels:
      fact_metrics.rx_per_day: 'RX/Day'
      # Put in pointer to current comparison
      fact_metrics.rx_per_day_comparison: 'vs. District'
    x_axis_datetime_label: '%b %Y'
    y_axis_unpin: true
    y_axis_value_format: '#'
    hidden_fields: [dim_period.toperiod]

  - name: rx_per_day_related_heading
    type: text
    height: 100
    width: 930
    body_text: "RX/Day Related KPIs"

  - name: return_to_stock_sold_pct_hero2
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: return_to_stock_sold_pct
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: rx_average_time_to_ready_hero2
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: rx_average_time_to_ready
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: rx_partial_fills_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: rx_partial_fills
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: verified_by_promise_time_hero2
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: verified_by_promise_time
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: rx_waiters_pct_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: rx_waiters_pct
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: efficiency_rate_90_days_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: efficiency_rate_90_days
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: scan_out_execution_heading
    type: text
    height: 100
    width: 930
    title_text: "Scan Out Execution"

  - name: scan_out_execution_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: scan_out_execution
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: scan_out_execution_trend
    title: Scan Out Execution Trend
    height: 250
    width: 690
    type: looker_line
    model: walgreens_poc_athena
    explore: fact_metrics
    dimensions: [dim_period.toperiod]
    measures: [fact_metrics.scan_out_execution, fact_metrics.scan_out_execution_comparison]
    dynamic_fields:
    - table_calculation: date
      label: Date
      expression: trunc_months(${dim_period.toperiod})
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: District
      fact_metrics.period_comparison: Current
      dim_period.computeperiod: 1MO
      fact_metrics.scan_out_execution: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [dim_period.toperiod desc]
    limit: '12'
    column_limit: '50'
    query_timezone: America/Chicago
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: circle
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    series_types: {}
    series_labels:
      fact_metrics.scan_out_execution: 'Scan Out Execution'
      # Put in pointer to current comparison
      fact_metrics.scan_out_execution_comparison: 'vs. District'
    x_axis_datetime_label: '%b %Y'
    y_axis_unpin: true
    y_axis_value_format: '#%'
    hidden_fields: [dim_period.toperiod]

  - name: scan_out_execution_related_heading
    type: text
    height: 100
    width: 930
    body_text: "Scan out Execution Related KPIs"

  - name: total_no_of_changes_ss_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: total_no_of_changes_ss
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: ss_smart_count_compliance_pct_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: ss_smart_count_compliance_pct
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: smart_count_unchanged_pct_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: smart_count_unchanged_pct
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: departments_not_scanned_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: departments_not_scanned
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: beauty_sales_heading
    type: text
    height: 100
    width: 930
    title_text: "Beauty Sales"

  - name: beauty_sales_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: beauty_sales_at_all_registers
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: beauty_sales_at_all_registers_trend
    title: Beauty Sales Trend
    height: 250
    width: 690
    type: looker_line
    model: walgreens_poc_athena
    explore: fact_metrics
    dimensions: [dim_period.toperiod]
    measures: [fact_metrics.beauty_sales_at_all_registers, fact_metrics.beauty_sales_at_all_registers_comparison]
    dynamic_fields:
    - table_calculation: date
      label: Date
      expression: trunc_months(${dim_period.toperiod})
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: District
      fact_metrics.period_comparison: Current
      dim_period.computeperiod: 1MO
      fact_metrics.beauty_sales_at_all_registers: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [dim_period.toperiod desc]
    limit: '12'
    column_limit: '50'
    query_timezone: America/Chicago
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: circle
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    series_types: {}
    series_labels:
      fact_metrics.beauty_sales_at_all_registers: 'Beauty Sales'
      # Put in pointer to current comparison
      fact_metrics.beauty_sales_at_all_registers_comparison: 'vs. District'
    x_axis_datetime_label: '%b %Y'
    y_axis_unpin: true
    y_axis_value_format: '#'
    hidden_fields: [dim_period.toperiod]

  - name: beauty_sales_related_heading
    type: text
    height: 100
    width: 930
    body_text: "Beauty Sales Related KPIs"

  - name: pct_of_beauty_sales_goals_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: pct_of_beauty_sales_goals
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: cust_cnt_at_beauty_reg_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: cust_cnt_at_beauty_reg
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: beauty_sales_at_beauty_register_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: beauty_sales_at_beauty_register
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: flu_immunization_heading
    type: text
    height: 100
    width: 930
    title_text: "Flu Immunization"

  - name: flu_immunization_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: flu_immunization
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: flu_immunization_trend
    title: Flu Immunization Trend
    height: 250
    width: 690
    type: looker_line
    model: walgreens_poc_athena
    explore: fact_metrics
    dimensions: [dim_period.toperiod]
    measures: [fact_metrics.flu_immunization, fact_metrics.flu_immunization_comparison]
    dynamic_fields:
    - table_calculation: date
      label: Date
      expression: trunc_months(${dim_period.toperiod})
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: District
      fact_metrics.period_comparison: Current
      dim_period.computeperiod: 1MO
      fact_metrics.flu_immunization: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [dim_period.toperiod desc]
    limit: '12'
    column_limit: '50'
    query_timezone: America/Chicago
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: circle
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    series_types: {}
    series_labels:
      fact_metrics.flu_immunization: 'Flu Immunizations'
      # Put in pointer to current comparison
      fact_metrics.flu_immunization_comparison: 'vs. District'
    x_axis_datetime_label: '%b %Y'
    y_axis_unpin: true
    y_axis_value_format: '#'
    hidden_fields: [dim_period.toperiod]

  - name: flu_immunization_related_heading
    type: text
    height: 100
    width: 930
    body_text: "Flu Immunization Related KPIs"

  - name: non_flu_immunization_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: non_flu_immunization
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: generic_efficiency_hero
    title: ''
    type: sr-single-value-old
    model: walgreens_poc_athena
    explore: hero_metrics
    dimensions: [dim_metadata.human_name, dim_metadata.unit, dim_metadata.good_high_low_nocolor,
      dim_metadata.precision]
    measures: [fact_metrics.hero_metric, fact_metrics.hero_metric_comparison, fact_metrics.hero_metric_compare_text,
      fact_metrics.hero_metric_last_update]
    filters:
      fact_metrics.dataset_comparison: Actual
      fact_metrics.entity_comparison: Store
      fact_metrics.period_comparison: Prior Period
      fact_metrics.hero_metric_selector: generic_efficiency
      dim_period.computeperiod: 1MO
      fact_metrics.hero_metric: NOT NULL
    listen:
      store_id: dim_entity.store_id
    sorts: [fact_metrics.hero_metric desc]
    limit: '1'
    column_limit: '50'
    query_timezone: America/Chicago
    heroType: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    series_types: {}
    width: 230
    height: 260

  - name: section_heading_glossary
    height: 100
    width: 930
    type: text
    title_text: "Glossary"

  - name: flu_immunization_description
    type: text
    height: 230
    width: 300
    title_text: "Flu Immunization"
    subtitle_text: "Last Updated: Feb 1, 2017"
    body_text: "Target: A higher number is better. The number of administered flu immunizations."

  - name: rx_waiters_description
    type: text
    height: 230
    width: 300
    title_text: "RX % Waiters"
    subtitle_text: "Last Updated: Feb 1, 2017"
    body_text: "Target: 25%. The percentage of RX customers that wait in-store for a RX to be filled."

  - name: rx_average_time_to_ready_description
    type: text
    height: 230
    width: 300
    title_text: "RX Average Time to Ready"
    subtitle_text: "Last Updated: Feb 1, 2017"
    body_text: "Target: A lower number is better. The average amount of minutes until a RX is ready for pick up by the customer."

  - name: beauty_sales_description
    type: text
    height: 230
    width: 300
    title_text: "Beauty Sales"
    subtitle_text: "Last Updated: Feb 1, 2017"
    body_text: "Target: A higher number is better. The store's beauty sales for the month."

  - name: nps_description
    type: text
    height: 230
    width: 300
    title_text: "Overall Net Promoter Score"
    subtitle_text: "Last updated: Feb 1, 2017"
    body_text: "Target: A higher number is better. Net Promoter Score (NPS) is a management tool that can be used to gauge the loyalty of a firm's customer relationships. It serves as an alternative to traditional customer satisfaction research and claims to be correlated with revenue growth."

  - name: rx_nps_description
    type: text
    height: 230
    width: 300
    title_text: "Pharmacy Net Promoter Score"
    subtitle_text: "Last updated: Feb 1, 2017"
    body_text: "Target: A higher number is better. Net Promoter Score (NPS) is a management tool that can be used to gauge the loyalty of a firm's customer relationships. It serves as an alternative to traditional customer satisfaction research and claims to be correlated with revenue growth."

  - name: payroll_hours_description
    type: text
    height: 230
    width: 300
    title_text: "Total Payroll Hours"
    subtitle_text: "Last Updated: Feb 1, 2017"
    body_text: "Target: 0% variance. Total Payroll Hours, Variance to Budget. Total payroll hours in a given store, compared to their allotted number of hours. This number should be close to zero."

  - name: rx_per_day_description
    type: text
    height: 230
    width: 300
    title_text: "RX/Day (90 Day Adjusted)"
    subtitle_text: "Last Updated: Feb 1, 2017"
    body_text: "Target: A higher number is better. The count of RX filled per day including 90 day RX."

  - name: scan_out_execution_description
    type: text
    height: 230
    width: 300
    title_text: "Scan Out Execution"
    subtitle_text: "Last Updated: Feb 1, 2017"
    body_text: "Target: 85%. The percentage of departments scanned compared to the scan out goal for the day."
