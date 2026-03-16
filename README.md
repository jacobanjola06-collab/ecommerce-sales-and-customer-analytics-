# Project Background
This project presents a structured exploratory data analysis of an ecommerce transactional dataset. The objective was to systematically examine revenue performance, customer behavior, operational efficiency, and sales distribution in order to understand how the business is performing and where patterns exist within the data.                                                                                                            
       The dataset contains detailed order level information including revenue, product categories, cities, delivery speed, discounts, customer ratings, and timestamps. It focuses on validating data quality, understanding metric distributions, identifying performance concentration, and uncovering behavioral trends across time and segments.

**This exploration provide insights on the following key areas:**

•	***Revenue Distribution :*** How is revenue distributed across time, geography, and product categories and what  (Revenue, Orders, AOV, Customers) reveal about overall business scale?

•	***Time-Based & Seasonal Trends :***  Are there noticeable seasonal or time based performance patterns?

•	***Operational Performance & Customer Satisfaction :*** What patterns exist between delivery speed, satisfaction, and repeat purchasing?

•	***Customer Retention Strength:***  How strong is customer retention within the dataset?

The analysis was performed using MySQL for querying, aggregation, and statistical exploration, and Power BI for KPI visualization and trend analysis.

# Executive Summary
Overview of findings
At a high level, the business generated ***21.78M*** in revenue from 17,000 orders placed by ***5,000*** customers, with an average order value of ***1.28K*** and an average customer rating of ***3.90***. These figures indicate a healthy transaction volume and relatively stable purchasing behavior across the customer base.

*Below is an overview page from the powerBI dashboard and more examples are included throughout the report* .  

![image alt](https://github.com/jacobanjola06-collab/ecommerce-sales-and-customer-analytics-/blob/a347b41eb03818b6ba1b855220dce03dc320e0ff/Screenshot%202026-03-16%20214813.png)


**the entire interactive dashboard can be downloaded here** .![link alt](https://github.com/jacobanjola06-collab/ecommerce-sales-and-customer-analytics-/blob/f07114aea077e5a567de6cc0403adde38d1d591e/Ecommerce%20dashboard.pbix)

# Insight Deep Dive 

![image alt](https://github.com/jacobanjola06-collab/ecommerce-sales-and-customer-analytics-/blob/6a16bffec1499514b834c2f1afd26ad8d6fef6a2/Screenshot%202026-03-17%20000000.png)
![image alt](https://github.com/jacobanjola06-collab/ecommerce-sales-and-customer-analytics-/blob/b3aa2c88a0e3c611aa4f672c5d6e8ddc2811eaf3/Screenshot%202026-03-16%20234931.png)

1) **Revenue Distribution:** The business generated ***21.78M in total sales from 17,000 orders placed by 5,000 customers***, resulting in an average order value of ***1.28K.*** From a scale perspective, this indicates steady purchasing behavior and consistent transaction size across the dataset. sales is not driven by unusually large orders but by sustained order activity.When examining geographic distribution, sales is clearly concentrated in a few high-performing cities. ***The top performing city generated 5.6M, which is significantly higher than the second ranked city at 3.1M***. This shows that a substantial portion of total revenue is coming from a limited number of core markets.
       Similarly, product category analysis shows uneven contribution, where select categories ***(electronics)*** generate a larger share of revenue **10m*** compared to the next best two performing cartegories ***Home & Gardens (4M), Sports (3M)***. This confirms that overall performance is being driven by specific high performing segments rather than evenly distributed demand.

2) **Time Based And Seasonal Trends:** Revenue performance across time reveals noticeable fluctuations rather than steady growth.The most significant movement occurred in ***April***, where revenue declined by ***45%** compared to the previous month. This represents the sharpest drop within the reporting period and suggests a temporary disruption or slowdown in demand.Following this decline, the business gradually recovered. In July, revenue increased by ***14% month over month***, signaling renewed growth momentum. The year closed strongly, with December recording a ***12% increase***, indicating improved performance toward year end.

   This pattern suggests that revenue performance is influenced by seasonal or timing-related factors rather than consistent month-over-month growth. The mid year slowdown followed by recovery implies variability in demand cycles, promotional timing, or market conditions.This shows that while the business demonstrates resilience and the ability to recover from downturns, revenue performance is not yet stable across all months


![image alt](https://github.com/jacobanjola06-collab/ecommerce-sales-and-customer-analytics-/blob/c01ec26fcaf4ee0b04944a07696b7c96ec3a1eda/Screenshot%202026-03-16%20230528.png)

4) **Operational Performance And Customer Satisfaction :** When i examined delivery performance alongside customer ratings, a clear pattern begins to emerge. The majority of orders are delivered within ***ten days***, with ***7,572 orders arriving within five days and another 6,787 delivered between six and ten days***. Only ***2,179 orders** fall into the      slow delivery category of ***eleven days or more**, meaning operationally, most transactions are fulfilled within a reasonable timeframe.   Customer satisfaction remains relatively stable across delivery speeds, but subtle differences are visible. Orders delivered within five days received an average rating of ***3.90**, while those delivered within ***six to ten days*** recorded a slightly higher ***3.91**. However, once delivery extends beyond ***ten days***, the average rating drops to ***3.86**. While this decline may appear small numerically, it signals that prolonged delivery times do begin to impact customer perception.
       What this says  is that the business is performing well operationally overall, but maintaining delivery within the fast to medium range is important for preserving customer satisfaction. Once delivery delays stretch past ten days, customer experience begins to weaken. The relationship isn’t extreme, but it is measurable and consistent.

![image alt](https://github.com/jacobanjola06-collab/ecommerce-sales-and-customer-analytics-/blob/74a4e06e8b916b01b0ec94f42649dcd2da74ebcf/Screenshot%202026-03-17%20000301.png)
![image alt](https://github.com/jacobanjola06-collab/ecommerce-sales-and-customer-analytics-/blob/2186c308a6ff5b2ca02a7868798a71144ecdcd2c/Screenshot%202026-03-17%20000422.png)

5) ***Customer Retention Strength:***
Looking at customer behavior over time. Out of 5,000 total customers, ***3,862 (77.24%)*** are returning customers, while only ***1,138(22.76%)***, made a single purchase. This indicates that the majority of revenue is supported by customers who come back to purchase again, rather than relying entirely on new customer acquisition.
       The influence of discounts further reinforces this pattern. Customers who received discounts generated an average revenue per customer of ***4,268.7***, compared to ***2,385.4*** among customers who did not receive discounts. This is a significant difference and suggests that promotional strategies are not only driving purchases but are associated with higher overall customer value.  

# Recommendation:                                                                                                                                                                                                                                                
**Based on the insight above the following recommendation would be provided:**

1) ***Revenue Growth & Market Expansion Strategy:*** 

•	Protect and scale high performing cities and product categories through targeted marketing and inventory prioritization.

•	Develop growth strategies for underperforming regions to reduce revenue concentration risk.

•	Increase Average Order Value through cross-selling, bundling, and personalized product recommendations.
  
2) ***Revenue stability and seasonal optimization :***

•	Implement proactive campaigns ahead of historically weak months to reduce revenue volatility.

•	Replicate strategies used during high growth months to stabilize performance across the year.

•	Align inventory and marketing planning with seasonal demand patterns.

3)**Operational Efficiency and Experience Protection :**

•	Reduce delivery times exceeding 10 days to prevent satisfaction decline.

•	Optimize logistics and fulfillment processes in high volume regions.

•	Monitor delivery performance as a key driver of customer experience.

4)**Customer Retention And Value Maximization:**

•	Convert one time buyers into repeat customers through structured post-purchase engagement.

•	Optimize discount strategies to increase customer lifetime value while maintaining profitability.

•	Invest in loyalty focused initiatives to strengthen repeat purchasing behavior.


# Tools & Methodology

•	**MySQL** – Aggregation, statistical exploration, growth calculations

•	**Power BI** – KPI dashboards, time series visualization, category & city performance tracking

**Structured EDA framework:**

o	Database exploration

o	Measures & KPI analysis

o	Ranking analysis

o	Time based trend analysis

o	Customer & operational performance evaluation
