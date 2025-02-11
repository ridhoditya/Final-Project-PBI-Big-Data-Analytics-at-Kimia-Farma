
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

## **Aggregated Tables**  
Aggregated tables are created by summarizing and computing data from the base tables. These tables contain concise information, making data analysis faster and more efficient. The results from these tables serve as the **data source** for building the **sales report dashboard**.  

### **Top Customer Aggregate Table**  
This table aggregates total sales per customer and identifies the **top 10 customers** with the highest sales.  

<details>
  <summary><strong>Query</strong></summary>

```sql
CREATE TABLE top_customers AS
SELECT 
    customer_name,
    SUM(total_sales) AS total_sales
FROM sales_datamart
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;
```
</details>

---

## **Top Customer Table Preview**  
<p align="center">
    <img width="400" alt="Top Customer Table" src="https://github.com/user-attachments/assets/aed7bf53-4ca0-4b8a-9f44-546484748328">
</p>  

---

### **Monthly Sales by Product Table**  
This table aggregates **total sales per product line** on a **monthly basis** for trend analysis.  

<details>
  <summary><strong>Query</strong></summary>

```sql
CREATE TABLE monthly_sales AS
SELECT 
    MONTHNAME(tanggal) AS bulan,
    product_line,
    SUM(total_sales) AS total_sales
FROM sales_datamart
GROUP BY bulan, product_line;
```
</details>

---

## **Monthly Sales Table Preview**  
<p align="center">
    <img width="400" alt="Monthly Sales Table" src="https://github.com/user-attachments/assets/ff397144-bdd0-4680-9bff-c8add5a4dff4">
</p>  

---

## 📊 **Data Visualization**  

[📌 Sales Report (2022) – Looker Studio](https://lookerstudio.google.com/reporting/1cf91be9-8afb-46d7-99ff-595fb2618fce)  

<p align="center">
    <img width="1000" alt="Kimia Farma Sales Report Dashboard" src="https://github.com/user-attachments/assets/208f5ff8-7e2d-4c71-8cef-5eb625fe4045">
</p>  

### **📈 Sales Report Dashboard – Kimia Farma 2022**  

---
# **📊 Insight**  
---

## **Overall Performance**  
🔹 **Total Sales:** Rp. 49.2M  
🔹 **Total Products Sold:** 9.2K  
🔹 **Total Transactions:** 350  

---

## **📈 Sales Analysis**  

### **Top 3 Sales by Cities**  
1️⃣ **Jakarta (Klinik GM)** – Rp. 12.2M  
2️⃣ **Kuningan (Apotek Maja)** – Rp. 8M  
3️⃣ **Bekasi (Apotek Sinar Jaya)** – Rp. 6M  

📌 **Average Sales Per Month:** Rp. 8.2M  

### **Top 3 Sales by Product**  
1️⃣ **Ampicillin** – Rp. 12M  
2️⃣ **Tramadol Kapsul 50 Mg** – Rp. 8.3M  
3️⃣ **Paracetamol** – Rp. 5.7M  

---

## **📢 Business Recommendations**  

### **1️⃣ Warehouse & Inventory Management**  
✅ Ensure the top 3 best-selling products (**Ampicillin, Tramadol Kapsul, Paracetamol**) are **well-stocked** to meet high demand.  
✅ Reduce excessive stock for non-popular products to **minimize storage costs** and **prevent product expiration**.  

### **2️⃣ Business Expansion Strategy**  
✅ Expand operations in **high-potential cities** near Jakarta, such as **Depok, Bogor, Tangerang**, to **increase market reach** and **better control stock distribution**.  
✅ Partner with **local pharmacies and clinics** in emerging cities to establish **regional distribution hubs**.  

### **3️⃣ Sales & Marketing Strategy**  
✅ Offer **promotional bundles or discounts** for high-demand products to attract more customers and increase sales.  
✅ Implement a **loyalty program** to retain existing customers and encourage repeat purchases.  
✅ Improve **digital presence** by expanding **online sales channels** through e-commerce platforms and digital marketing.  

### **4️⃣ Customer Insights & Personalization**  
✅ Conduct **customer surveys** to understand their needs and adjust product availability accordingly.  
✅ Develop **personalized promotions** based on past purchases to enhance customer experience and engagement.  

---

## **📬 Contact**  

For any questions, collaborations, or feedback, feel free to reach out:  

👤 **Name:** Ridho Aditya Rachman  
📧 **Email:** [eric.ridho88@gmail.com](mailto:eric.ridho88@gmail.com)  
🔗 **LinkedIn:** [Ridho Aditya Rachman](https://www.linkedin.com/in/ridhoditya)  

---
