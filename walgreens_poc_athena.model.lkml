connection: "wba-athena"

# include all the views
include: "*.view.lkml"

# include all the dashboards
include: "*.dashboard.lookml"

explore: fact_metrics {
  view_name: fact_metrics
  from: fact_metrics
  join: dim_period_dates {
    type: inner
    sql_on: ${dim_period_dates.calendardate} = ${fact_metrics.calendar_date} and ${dim_period_dates.cadence} = ${fact_metrics.cadence};;
    relationship: many_to_one
  }

  join: dim_period {
    type: inner
    sql_on: ${dim_period.computeperiod} = ${dim_period_dates.computeperiod} and ${dim_period.toperiod} = ${dim_period_dates.toperiod} and ${dim_period.fromperiod} = ${dim_period_dates.fromperiod} ;;
    relationship: many_to_one
  }

  join: dim_entity {
    type: inner
    sql_on: ${fact_metrics.store_id} = ${dim_entity.store_id} ;;
    relationship: one_to_one
  }

  join: dim_constants {
    type: cross
    relationship: many_to_one
  }

  join: fact_metrics_agg_store {
    type: left_outer
    sql_on: ${dim_entity.store_id} = ${fact_metrics_agg_store.store_id}
          and ${dim_period_dates.computeperiod} = ${fact_metrics_agg_store.computeperiod}
          and ${dim_period_dates.cadence} = ${fact_metrics_agg_store.cadence}
          and ${dim_period_dates.toperiod} = ${fact_metrics_agg_store.toperiod}
          and ${dim_period_dates.period_comparison} = ${fact_metrics_agg_store.period_comparison} ;;
    relationship: many_to_one
  }

  join: fact_metrics_agg_district {
    type: left_outer
    sql_on: ${dim_entity.district_id} = ${fact_metrics_agg_district.district_id}
          and ${dim_period_dates.computeperiod} = ${fact_metrics_agg_district.computeperiod}
          and ${dim_period_dates.cadence} = ${fact_metrics_agg_district.cadence}
          and ${dim_period_dates.toperiod} = ${fact_metrics_agg_district.toperiod}
          and ${dim_period_dates.period_comparison} = ${fact_metrics_agg_district.period_comparison} ;;
    relationship: many_to_one
  }

  join: fact_metrics_agg_area {
    type: left_outer
    sql_on: ${dim_entity.area_id} = ${fact_metrics_agg_area.area_id}
          and ${dim_period_dates.computeperiod} = ${fact_metrics_agg_area.computeperiod}
          and ${dim_period_dates.cadence} = ${fact_metrics_agg_area.cadence}
          and ${dim_period_dates.toperiod} = ${fact_metrics_agg_area.toperiod}
          and ${dim_period_dates.period_comparison} = ${fact_metrics_agg_area.period_comparison} ;;
    relationship: many_to_one
  }

  join: fact_metrics_agg_region {
    type: left_outer
    sql_on: ${dim_entity.region_id} = ${fact_metrics_agg_region.region_id}
          and ${dim_period_dates.computeperiod} = ${fact_metrics_agg_region.computeperiod}
          and ${dim_period_dates.cadence} = ${fact_metrics_agg_region.cadence}
          and ${dim_period_dates.toperiod} = ${fact_metrics_agg_region.toperiod}
          and ${dim_period_dates.period_comparison} = ${fact_metrics_agg_region.period_comparison} ;;
    relationship: many_to_one
  }
}

explore:  hero_metrics {
  extends: [fact_metrics]
  from:  hero_metrics
  join: dim_metadata {
    type:  cross
    relationship:  many_to_one
  }
  always_filter: {
    filters: {
      field: fact_metrics.entity_comparison
      value: "Store"
    }
    filters: {
      field: fact_metrics.period_comparison
      value: "Prior Period"
    }
    filters: {
      field: fact_metrics.dataset_comparison
      value: "Actual"
    }
    filters: {
      field: hero_metric
      value: "NOT NULL"
    }
    filters: {
      field: dim_period.computeperiod
      value: "1MO"
    }
    filters: {
      field: hero_metric_selector
      value: "overall_net_promoter_score"
    }
  }
}

explore:  dim_comparison_suggestions {
  join:  dim_constants {
    type: cross
    relationship: many_to_one}
}

explore:  user_location_mapping {}

explore: dwdatapoint {
  join:  dwdatapointrelatedmetrics {
    type:  left_outer
    sql_on:  ${dwdatapoint.measure_name} = ${dwdatapointrelatedmetrics.measure_name} ;;
    relationship: one_to_many
  }
  join:  dwdatapointcomputeperiod {
    type:  inner
    sql_on:  ${dwdatapoint.measure_name} = ${dwdatapointcomputeperiod.measure_name} ;;
    relationship: one_to_many
  }
}
