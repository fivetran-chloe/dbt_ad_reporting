{{ config(enabled=var('ad_reporting__pinterest_enabled')) }}

with base as (

    select *
    from {{ ref('pinterest_ads__ad_adapter')}}

), fields as (

    select
        cast(campaign_date as date) as date_day,
        base_url,
        url_host,
        url_path,
        utm_source,
        utm_medium,
        utm_campaign,
        utm_content,
        utm_term,
        cast(campaign_id as {{ dbt_utils.type_string() }}) as campaign_id,
        campaign_name,
        cast(ad_group_id as {{ dbt_utils.type_string() }}) as ad_group_id,
        ad_group_name,
        platform,
        clicks,
        impressions,
        spend
    from base


)

select *
from fields