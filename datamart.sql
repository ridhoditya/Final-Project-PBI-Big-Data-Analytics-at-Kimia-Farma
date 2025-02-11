CREATE TABLE datamart_sales (
SELECT 
    p.id_invoice,
    p.tanggal,
    p.id_customer,
    c.nama AS customer_name,
    c.cabang_sales,
    c.group AS customer_group,
    p.id_barang,
    b.nama_barang,
    b.lini AS product_line,
    b.kemasan,
    p.jumlah_barang,
    p.harga AS harga_produk,
    (p.jumlah_barang * p.harga) AS total_penjualan
FROM penjualan p
LEFT JOIN pelanggan c 
	ON p.id_customer = c.id_customer
LEFT JOIN barang b 
	ON p.id_barang = b.kode_barang
ORDER BY p.tanggal );
Alter table datamart_sales add primary key(id_invoice);