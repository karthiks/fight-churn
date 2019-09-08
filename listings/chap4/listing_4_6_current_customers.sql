with metric_date as
(
    select  max(metric_time) as last_metric_time from metric
)
select account_id, metric_time,
sum(case when metric_name_id=0 then metric_value else 0 end) as like_per_month,
sum(case when metric_name_id=1 then metric_value else 0 end) as account_tenure,
sum(case when metric_name_id=2 then metric_value else 0 end) as newfriend_per_month,
sum(case when metric_name_id=3 then metric_value else 0 end) as post_per_month,
sum(case when metric_name_id=4 then metric_value else 0 end) as adview_feed_per_month,
sum(case when metric_name_id=5 then metric_value else 0 end) as dislike_per_month,
sum(case when metric_name_id=6 then metric_value else 0 end) as unfriend_per_month,
sum(case when metric_name_id=7 then metric_value else 0 end) as message_per_month,
sum(case when metric_name_id=8 then metric_value else 0 end) as reply_per_month
from metric inner join metric_date on metric_time =last_metric_time
group by account_id, metric_time
order by account_id
