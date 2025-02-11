# Kimia Farma Sales Dashboard 2022 - PBI Big Data Analytics Kimia Farma x Rakamin Academy
Tools: MySQL
Visualization: Looker Data Studio: DashBoard(https://lookerstudio.google.com/reporting/1cf91be9-8afb-46d7-99ff-595fb2618fce)<br>
## *Background*
Project Based Internship is a virtual intership from Rakamin Academy. In this project me as data analyst intern had to analyst and made a sales report using data that had been provided. The goal is to create a data mart, perform data aggregation, and build a dashboard in Looker Studio for better visualization and insights.
<br>
*Goal*
- Design Datamart
- Design Dashboard Sales Report<br>
<br>
*Dataset*
Table:
- Penjualan
- Pelanggan
- Barang
<br>
## *Design Datamart*
### Datamart Table
This table is the combination from Penjualan table, Pelanggan table, and Barang Table. it is used for analyzing the data.<br>
<details>
  <summary> Query </summary>
	<br>
```sql
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
    <br>
</details>
<br>

<p align="center">
    <kbd> <img width="1000" alt="datamart" src="![image](https://github.com/user-attachments/assets/00af0e34-8aa1-4b19-9d0c-53afd4d45f6b)
"> </kbd> <br>
    Datamart Table
</p>
<br>

Query(Postgresql):
- Database: https://drive.google.com/file/d/1heEXevhaIw2eTikzk9Da4mMIaahcz7kr/view?usp=drive_link
- Datamart(Sales): https://drive.google.com/file/d/1PEGgnaa58Yr-B7ErOedLYDwl1wWg6t2L/view?usp=drive_link
- Agregat Datamart (Total Penjualan per Brand): https://drive.google.com/file/d/1gCFRFN796NuotEn1SsBo37C6IIsh4nI0/view?usp=drive_link

Data Visualization(Looker Studio): 
https://lookerstudio.google.com/reporting/1cf91be9-8afb-46d7-99ff-595fb2618fce
