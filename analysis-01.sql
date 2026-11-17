-- QUERY ANALISIS

-- 1. Analisis terkait dengan traffic source, dari melalui apa user mengakses theLook E-commerce?
SELECT
  traffic_source,
  COUNT(id) AS jumlah_user
FROM bigquery-public-data.thelook_ecommerce.users
GROUP BY traffic_source
ORDER BY jumlah_user DESC;

-- Temuan :
-- Berdasarkan data pertanggal 11 Nov 2026, channel traffic terbanyak melaui 'Search' sebanyak 69.956 
-- sedangkan yang paling sedikit dengan jumlah user sebanyak 3.979 adalah 'Display'

-- 2. Pendapatan per negara dan departemen? urutkan dari yang paling tinggi
SELECT
  u.country,
  p.department,
  ROUND(SUM(oi.sale_price), 2) AS pendapatan
FROM 
  `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN 
  `bigquery-public-data.thelook_ecommerce.products` AS p
  ON p.id = oi.product_id
JOIN 
  `bigquery-public-data.thelook_ecommerce.users` AS u
  ON oi.user_id = u.id
WHERE oi.status = 'Complete'
GROUP BY u.country, p.department
ORDER BY pendapatan DESC
LIMIT 5;

-- INSIGHT / TEMUAN
-- departemen dan negara yang memberikan pendapatan tertinggi dipegang oleh China baik untuk departemen 'Men' dan 'Women' yang 
-- kemudian disusul oleh United States sedangkan brasil berada dibagian Top 5 terbawah dengan departemen "Men"-nya


