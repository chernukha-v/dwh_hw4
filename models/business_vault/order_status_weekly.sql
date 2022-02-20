SELECT
	date_trunc('week', order_date::timestamp) as order_week,
	status,
	count(order_pk) as order_pk
FROM
	{{ ref('sat_order_details') }}
GROUP BY
	order_week,
	status
ORDER BY
	order_week,
	status