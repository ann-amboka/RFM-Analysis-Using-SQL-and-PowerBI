RFM CUSTOMER SEGMENTATION ANALYSIS
Understanding Customer Behaviour, Value Contribution & Engagement Patterns

Analysis Period: January 2022 – December 2024

Dataset: 112,000 Transactions  |  5,000 Customers  |  500 Products  |  120 Campaigns

1. Project Background

This project focuses on Customer Segmentation Analysis to understand behaviour, value contribution, and engagement patterns, and to assess how these factors affect overall business performance. Using the RFM (Recency, Frequency, Monetary) framework, customers were scored and grouped into distinct segments, enabling data-driven identification of high-value customers, at-risk accounts, and re-engagement opportunities.
The analysis spans three years of transactional data and integrates customer demographics, campaign performance, product performance, and payment behaviour to build a comprehensive view of the customer base.
![image alt](https://github.com/ann-amboka/RFM-Analysis-Using-SQL-and-PowerBI/blob/f5cfd8bf5d98adc194a857f74eb69930675d15be/RFM%20analysis%20dashboard.png)

2. Data Structure

The analysis is built on a star schema comprising one fact table and three dimension tables:

    • fact_transactions  fact_transactions
    • 112,000 rows | 32 columns
    • Core transactional data, including revenue, discounts, margins, payment method, purchase channel, and campaign attribution
    • Filtered to Completed orders for all revenue and RFM calculations

    • dim_customersdim_customers  
    • 5,000 customers | 18 columns
    • Demographics, acquisition channel, loyalty tier, segment, preferred device, and payment method

    • dim_campaignsdim_campaigns 
    • 120 campaigns | 26 columns
    • Campaign type, objective, platform, budget, spend, impressions, clicks, conversions, and ROAS

    • dim_productsdim_products
    • 500 products | 20 columns
    • Category, subcategory, brand, pricing, margins, stock levels, ratings, and supplier details
 ![image alt](https://github.com/ann-amboka/RFM-Analysis-Using-SQL-and-PowerBI/blob/46cc52165db095a8329370d234dfbe3b56ecc078/Data%20structures.png)



3. Executive Summary

Q4 2024 closed at $3,810,404, reflecting a 1% year-on-year growth over Q4 2023’s $3,773,289. While modest, this uptick is a positive signal; it marks a gradual recovery from a softer 2023 and confirms that revenue momentum is heading in the right direction into 2025.
More broadly, performance across the three years shows steady overall growth, indicating a stable and resilient revenue trajectory rather than volatile swings. This consistency
suggests the business has maintained underlying demand strength, even as short-term fluctuations occurred within specific quarters.
Sustaining and accelerating this growth will require continued focus on retaining high-value customer segments and optimizing campaign spend toward the channels and audiences that generate the strongest returns.

![image alt](https://github.com/ann-amboka/RFM-Analysis-Using-SQL-and-PowerBI/blob/f090b9859f031f7e1c8f3f99fb5df3fab3444f66/executive%20summary.png)



4. Insights Deep Dive

4.1  Segment Revenue & Value Distribution

The Champions segment demonstrates the highest frequency and monetary value across all customer groups, confirming their status as the primary revenue engine of the business. Champions transact more often and spend more per transaction, making them disproportionately important to overall performance.
Protecting and nurturing this segment through exclusive experiences, early access, and personalized engagement should be a standing business priority.

![image alt](https://github.com/ann-amboka/RFM-Analysis-Using-SQL-and-PowerBI/blob/4473fbd146a1bc6f18614913f3db42d53529c75c/Revenue%20Analysis.png)

4.2  Acquisition Channel Analysis

Social Media was the leading acquisition channel across all customer segments, generating the highest revenue overall. However, it also accounts for the largest share of At Risk customers, suggesting that while the channel attracts volume, it may not consistently attract high-intent buyers.
Recommended actions:
    
    • Review and refresh content strategy with a focus on purchase intent and clearer calls to action
    • Tighten keyword targeting and audience segmentation on paid social placements
    • Ensure ad creative and landing page messaging are fully aligned, same offer, same tone, consistent experience

    
![image alt]()

4.3  Campaign Type Performance

A total of 8 campaign types were executed across the analysis period. Six campaigns delivered strong performance metrics. Two campaigns, Influencer and Retargeting, recorded comparatively lower numbers but should not be discontinued.
Recommended actions:
    
    • Retain both underperforming campaign types, but invest in optimization before the next cycle
    • For Influencer campaigns: enforce content quality standards, establish clearer briefs, and prioritize micro-influencers with highly engaged niche audiences
    • For Retargeting: shift from broad promotions to segmented messaging with specific value propositions tailored to where the customer dropped off

4.4  Campaign Objectives

The business currently operates across 8 distinct campaign objectives, which creates tracking complexity and makes it difficult to measure strategic progress coherently. Consolidating these into three broader objective categories is recommended:
    
    • Revenue Objectives  Revenue Objectives  
    • Upsell/Cross-sell, Seasonal Promotion, Product Launch
    • Growth Objectives  Growth Objectives  
    • New Customer Acquisition, Lead Generation, Brand Awareness
    • Support Objectives  Support Objectives 
    • Customer Retention, Win-Back

This consolidation improves strategic clarity, simplifies reporting, and makes it easier to allocate budget against outcomes rather than activities.

![image alt](https://github.com/ann-amboka/RFM-Analysis-Using-SQL-and-PowerBI/blob/fd0e7c92cf66c43f41feeb3f708f5b83f90d005d/campaign%20objectives.png)

4.5  Product Performance by Customer Segment

High-value segments: Champions, Loyal Customers, and Potential Loyalists, show a strong preference for Fashion products, which also generate the highest total revenue across the customer base. Food & Beverage, while lower in overall revenue volume, records the highest Average Order Value (AOV), making it a strong margin contributor.
Fashion is the revenue engine. Food & Beverage is the margin optimiser.
The Baby & Kids category recorded the lowest performance across segments, but this represents an untapped opportunity. The segment is under-penetrated, not necessarily unviable, and responds well to targeted reactivation strategies such as lifecycle-triggered communications and bundle offers.

4.6  Payment Method Behaviour

Customers show a clear preference for digital payment methods and card options, which consistently record the highest transaction volumes. Cash on Delivery ranks last across all segments.
Rather than eliminating the cash option, which could alienate a segment of the customer base, the opportunity is to gradually build trust and incentivise migration toward digital payment methods. Digital transactions reduce friction, lower operational costs, and improve data capture for future personalisation.

4.7  Purchase Channel by Segment

The Mobile App is the top purchase channel across all customer segments, reflecting the mobile-first behaviour of the customer base. Website and WhatsApp Shop follow as secondary channels.
Recommended actions:
    
    • Use brand awareness and retargeting campaigns specifically to drive Mobile App downloads and repeat usage
    • Leverage the Website as the primary channel for order tracking and account management to reduce support load
    • Gradually integrate WhatsApp into both the app and website as a customer support and engagement layer. It is a trusted, low-friction communication channel in the target markets

4.8  Discount Sensitivity Analysis

A significant finding across all customer segments is that customers do not rely heavily on discounts to make purchasing decisions. Strong purchasing behaviour is observed at zero or low discount levels across all categories, which is a healthy signal for margin sustainability.
Recommended actions:
    
    • Limit or eliminate discount strategies for Champions, Loyal Customers, and Potential Loyalists; they do not need the incentive and discounting erodes margin unnecessarily
    • Reserve discounts as a strategic lever for Acquisition, Reactivation, and Retention, specifically targeting At Risk, Hibernating, and Lost segments
    • Introduce value-based incentives (loyalty points, exclusive access) for high-value segments instead of price reductions

4.9  Customer Satisfaction by Segment

Overall satisfaction is high across all customer segments, with strong Promoter scores observed in upper-tier segments. This is an encouraging signal and suggests the product and service experience is broadly meeting customer expectations.
The notable exception is the At Risk segment, which shows lower order volumes and signs of disengagement. Critically, this pattern does not appear to be driven primarily by dissatisfaction; satisfaction scores remain relatively stable even in this group. The likely drivers are product relevance gaps, pricing perception, and declining engagement rather than a poor experience.
Recommended actions:
    
    • Conduct targeted feedback surveys and behavioural analysis on the At Risk segment to identify specific disengagement triggers
    • Implement personalised retention strategies that address relevance and value rather than defaulting to discounts
    • Monitor satisfaction scores across segments as a leading indicator of churn risk, not just a lagging satisfaction metric

![image alt](https://github.com/ann-amboka/RFM-Analysis-Using-SQL-and-PowerBI/blob/22a29bd6a6329156b2cfd9d4cd4b84edb6e7fb39/overall%20satisfaction%20score.png)

5. Recommendations

The following priority actions are recommended based on the analysis findings:

Protect & Grow High-Value Segments
    
    • Establish a Champions retention programme with personalised outreach, early product access, and loyalty rewards that do not rely on discounts
    • Identify Potential Loyalists showing upward RFM score trends and accelerate their progression through targeted frequency-driving campaigns
Address Underperforming Areas
    • Develop a dedicated reactivation strategy for the Baby & Kids category, lifecycle-triggered emails, bundle offers, and seasonal campaigns aligned to parenting milestones
    • Optimise Influencer and Retargeting campaigns before the next campaign cycle with tighter briefs, segmented audiences, and value-led messaging

Streamline Campaign Strategy
    
    • Consolidate 8 campaign objectives into 3 grouped categories (Revenue, Growth, Support) to improve tracking clarity and strategic alignment
    • Review Social Media channel strategy to reduce At Risk customer acquisition and improve lead quality through intent-based targeting

Drive Digital Adoption & Channel Efficiency
    
    • Incentivise migration from Cash on Delivery to digital payment methods through trust-building messaging and small first-time digital payment rewards
    • Prioritise Mobile App as the primary engagement channel and use retargeting campaigns to drive downloads and repeat sessions
    • Integrate WhatsApp as a customer support and engagement layer within the app and website

Revenue Growth & Margin Protection
    
    • Reserve discounts exclusively for reactivation and acquisition of lower-tier segments — protect margin on Champions and Loyal Customers
    • Leverage Food & Beverage’s high AOV for upsell campaigns targeting mid-tier segments to lift average transaction value
