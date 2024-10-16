WITH notion_raw AS (
    SELECT 
        page_id,
        title,
        content
    FROM {{ ref('pages') }} -- Replace 'notion_pages' with the actual table name synced to Supabase
)

SELECT 
    page_id,
    title,
    content
FROM notion_raw
WHERE content IS NOT NULL
  AND TRIM(content) != '';
