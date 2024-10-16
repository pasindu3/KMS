WITH notion_raw AS (
    SELECT 
        id,
        properties,
        parent
    FROM {{ ref('pages') }} -- Replace 'notion_pages' with the actual table name synced to Supabase
)

SELECT 
    id,
    properties,
    parent
FROM notion_raw
WHERE properties IS NOT NULL
  AND TRIM(properties) != '';
