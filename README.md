**Amazon Sales Analytics: ETL, Predictive Modeling & BI Pipeline**


An end-to-end analytics engineering project that ingests raw e-commerce transaction data, trains a predictive regression model, builds a structured PostgreSQL relational database, and delivers an interactive, executive-ready Power BI dashboard tracking $91.8M in revenue.

🛠️ Tech StackLanguages & Modeling: 
Python (Pandas, Scikit-Learn, NumPy)
Database Layer: PostgreSQL (Staging, Analytical Audits, Performance Queries)
Business Intelligence: Power BI Desktop (DAX Modeling, Executive KPI Canvas)

🚀 Key Project Milestones
1. Data Ingestion & Machine Learning (Jupyter Notebook)Enforced structural schemas during data loading to prevent data truncation and protect critical tracking IDs.Engineered a supervised Linear Regression model utilizing core transaction variables (Quantity, UnitPrice, Discount, Tax, ShippingCost) to predict transaction sizes, achieving a stellar $R^2$ evaluation score of 0.9095.
2. Relational Data Warehousing (PostgreSQL)Migrated the flat transactional matrix into an ACID-compliant PostgreSQL database under strict case-preserving settings.Authored optimized SQL business scripts including multi-year monthly trend isolation (DATE_TRUNC), high-value customer identification, supply chain bottleneck tracing, and margin value leakage audits.
3. Business Intelligence Dashboard (Power BI)Connected Power BI seamlessly to PostgreSQL using the Npgsql framework to cache records into an optimized in-memory processing layer.
Built an executive layout featuring Macro KPIs (Total Revenue, Order Volume, Average Order Value, and Units Sold).Cleaned presentation flows by removing technical system labels (e.g. Sum of totalamount), fixing categorical text clipping, and adding chronological quarterly velocity trend lines.

📂 Repository File TreePlaintext

├── requirements.txt               # Dependencies (pandas, scikit-learn, etc.)
├── README.md                      # Project documentation (This file)
├── notebooks/
│   └── Amazon_Data_Analysis.ipynb # EDA, Data Cleaning & Regression Modeling
├── scripts/
│   └── amazon_sales.sql           # Database staging & performance audit queries
└── dashboard/
    └── Amazon_Sales_Analysis.pbix # Finished interactive Power BI report
