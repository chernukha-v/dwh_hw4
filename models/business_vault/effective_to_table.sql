SELECT
    hub.customer_key,
    hub.customer_pk,
    sat.first_name,
    sat.last_name,
    sat.email,
    sat.effective_from,
    coalesce(lead(effective_from) OVER (PARTITION BY hub.customer_pk ORDER BY effective_from), '9999-12-31') AS effective_to
FROM
    {{ ref('sat_customer_details') }} sat
        LEFT JOIN {{ ref('hub_customer') }} hub
        ON sat.customer_pk = hub.customer_pk