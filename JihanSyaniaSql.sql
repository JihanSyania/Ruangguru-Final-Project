-- Jihan Syania DBA2092442
-- Department marketing Kelompok 279

SELECT * FROM users;

SELECT 
	u.*, 
	-- Menambahkan beberapa kolom dari tabel order
	o.order_id, o.status, o.created_order_at, o.returned_at, 
	o.shipped_at, o.delivered_at, o.num_of_item,
	-- Menambahkan kolom product_id dari tabel product
	p.product_id, 
	-- Menambahkan kolom brand dari tabel items
	i.brand,
	-- Mengubah nama kolom
	i.category AS product_category,
	i.name AS product_name,
	-- Mengekstrak kolom yang bertipe datetime
	TO_CHAR(created_at, 'YYYY-MM') AS date_created,
	EXTRACT(YEAR FROM created_at) AS year_created,
	TO_CHAR(created_order_at, 'YYYY-MM') AS date_order,
	EXTRACT(YEAR FROM created_order_at) AS year_order,
	TO_CHAR(o.returned_at, 'YYYY-MM') AS date_return,
	EXTRACT(YEAR FROM o.returned_at) AS year_return,
	TO_CHAR(o.shipped_at, 'YYYY-MM') AS date_shipped,
	EXTRACT(YEAR FROM o.shipped_at) AS year_shipped,
	TO_CHAR(o.delivered_at, 'YYYY-MM') AS date_delivered,
	EXTRACT(YEAR FROM o.delivered_at) AS year_delivered
FROM users u
FULL JOIN orders o ON u.user_id = o.user_id
LEFT JOIN product p ON o.order_id = p.order_id
LEFT JOIN items i ON p.product_id = i.id
--Mengurutkan data berdasarkan first name
WHERE u.first_name IS NOT NULL
ORDER BY u.first_name ASC;






