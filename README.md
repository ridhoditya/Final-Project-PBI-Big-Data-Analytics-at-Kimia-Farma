
---

# **Kimia Farma Sales Dashboard 2022**  
## *PBI Big Data Analytics Kimia Farma x Rakamin Academy*  

- **Tools:** MySQL  
- **Visualization:** [Looker Studio Dashboard](https://lookerstudio.google.com/reporting/1cf91be9-8afb-46d7-99ff-595fb2618fce)  

## **Background**  
Project-Based Internship (PBI) is a virtual internship program from Rakamin Academy. As a Data Analyst intern, my role was to analyze sales data and generate a comprehensive sales report using the provided dataset. The goal was to create a **data mart**, perform **data aggregation**, and build a **dashboard in Looker Studio** to visualize insights effectively.  

## **Goals**  
- **Design a Data Mart** for structured data analysis.  
- **Develop a Sales Report Dashboard** in Looker Studio.  

## **Dataset**  
The dataset consists of three tables:  
- **`penjualan`** (Sales)  
- **`pelanggan`** (Customers)  
- **`barang`** (Products)  

---

## **Data Mart Design**  
The **Data Mart Table** is created by combining data from the `penjualan`, `pelanggan`, and `barang` tables. This table serves as the foundation for analyzing sales trends and customer behavior.  

<details>
  <summary><strong>Data Mart Query</strong></summary>

```sql
CREATE TABLE datamart_sales AS
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
ORDER BY p.tanggal;

ALTER TABLE datamart_sales ADD PRIMARY KEY (id_invoice);
```

</details>

---

## **Data Mart Table Preview**  
<p align="center">
    <img width="1000" alt="Datamart Table" src="https://github.com/user-attachments/assets/00af0e34-8aa1-4b19-9d0c-53afd4d45f6b">
</p>  

This **Data Mart Table** allows for easier querying and analysis, providing key sales insights.  

---

