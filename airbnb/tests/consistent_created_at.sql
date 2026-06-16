WITH review_dates AS (
    SELECT
        r.listing_id,
        r.review_date,
        l.created_at
    FROM {{ ref('fct_reviews') }} AS r
    JOIN {{ ref('dim_listings_cleansed') }} AS l
        ON r.listing_id = l.listing_id
)

SELECT *
FROM review_dates
WHERE TO_DATE(review_date) < TO_DATE(created_at)
