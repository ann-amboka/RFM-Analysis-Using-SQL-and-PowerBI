--create a database for our data and analysis--
USE MASTER
GO
CREATE DATABASE RFM
GO
USE RFM
;
--Create the tables for our data for all 6 datasets, data definition as well--
--My data is messy, so first cast everything to nvarchar, then data manipulation after import--


CREATE TABLE Transactions (
    transaction_id          NVARCHAR(10)     NOT NULL,
    order_id                NVARCHAR(10)     NOT NULL,
    customer_id             NVARCHAR(10)     NOT NULL,
    product_id              NVARCHAR(9)      NOT NULL,
    campaign_id             NVARCHAR(11)     NOT NULL,
    transaction_date        DATE             NOT NULL,
    transaction_datetime    DATETIME2        NOT NULL,
    order_status            NVARCHAR(9)      NOT NULL,
    quantity                TINYINT          NOT NULL,
    unit_price_usd          DECIMAL(10,2)    NOT NULL,
    unit_cost_usd           DECIMAL(10,2)    NOT NULL,
    gross_amount_usd        DECIMAL(12,2)    NOT NULL,
    discount_pct            TINYINT          NOT NULL,
    discount_amount_usd     DECIMAL(12,2)    NOT NULL,
    net_amount_usd          DECIMAL(12,2)    NOT NULL,
    tax_rate_pct            TINYINT          NOT NULL,
    tax_amount_usd          DECIMAL(10,2)    NOT NULL,
    shipping_fee_usd        DECIMAL(8,2)     NOT NULL,
    total_amount_usd        DECIMAL(12,2)    NOT NULL,
    cogs_usd                DECIMAL(12,2)    NOT NULL,
    gross_profit_usd        DECIMAL(12,2)    NOT NULL,
    gross_margin_pct        DECIMAL(6,1)     NOT NULL,
    payment_method          NVARCHAR(16)     NOT NULL,
    purchase_channel        NVARCHAR(15)     NOT NULL,
    device_type             NVARCHAR(7)      NOT NULL,
    coupon_code             NVARCHAR(13)     NOT NULL,
    is_first_purchase       BIT              NOT NULL,
    is_repeat_purchase      BIT              NOT NULL,
    delivery_days           TINYINT          NOT NULL,
    customer_satisfaction_score  TINYINT     NULL,
    return_reason           NVARCHAR(16)     NOT NULL,
    is_loss_leader          BIT              NOT NULL
);
;
CREATE TABLE Campaigns (
    campaign_id                 NVARCHAR(8)      NOT NULL,
    campaign_name               NVARCHAR(100)    NOT NULL,
    campaign_type               NVARCHAR(17)     NOT NULL,
    campaign_objective          NVARCHAR(24)     NOT NULL,
    platform                    NVARCHAR(30)     NOT NULL,
    target_segment              NVARCHAR(15)     NOT NULL,
    target_country              NVARCHAR(12)     NOT NULL,
    start_date                  DATE             NOT NULL,
    end_date                    DATE             NOT NULL,
    duration_days               SMALLINT         NOT NULL,
    budget_usd                  DECIMAL(12,2)    NOT NULL,
    actual_spend_usd            DECIMAL(12,2)    NOT NULL,
    budget_utilization_pct      DECIMAL(5,1)     NOT NULL,
    impressions                 INT              NOT NULL,
    clicks                      INT              NOT NULL,
    click_through_rate_pct      DECIMAL(6,2)     NOT NULL,
    conversions                 INT              NOT NULL,
    conversion_rate_pct         DECIMAL(6,2)     NOT NULL,
    revenue_generated_usd       DECIMAL(14,2)    NOT NULL,
    roas                        DECIMAL(8,2)     NOT NULL,
    cost_per_click_usd          DECIMAL(8,2)     NOT NULL,
    cost_per_conversion_usd     DECIMAL(10,2)    NOT NULL,
    status                      NVARCHAR(9)      NOT NULL,
    ab_test_variant             NVARCHAR(9)      NOT NULL,
    utm_source                  NVARCHAR(30)     NOT NULL,
    utm_medium                  NVARCHAR(17)     NOT NULL
);

CREATE TABLE Customers (
    customer_id                 NVARCHAR(10)     NOT NULL,
    first_name                  NVARCHAR(9)      NOT NULL,
    last_name                   NVARCHAR(9)      NOT NULL,
    gender                      NVARCHAR(17)     NOT NULL,
    age_group                   NVARCHAR(5)      NOT NULL,
    country                     NVARCHAR(14)     NOT NULL,
    city                        NVARCHAR(16)     NOT NULL,
    email                       NVARCHAR(50)     NOT NULL,
    phone_number                BIGINT           NOT NULL,
    acquisition_channel         NVARCHAR(14)     NOT NULL,
    registration_date           DATE             NOT NULL,
    loyalty_tier                NVARCHAR(8)      NOT NULL,
    email_opt_in                BIT              NOT NULL,
    sms_opt_in                  BIT              NOT NULL,
    customer_segment            NVARCHAR(19)     NOT NULL,
    lifetime_value_usd          DECIMAL(12,2)    NOT NULL,
    preferred_device            NVARCHAR(7)      NOT NULL,
    preferred_payment_method    NVARCHAR(16)     NOT NULL
);

CREATE TABLE Products (
    product_id          NVARCHAR(9)      NOT NULL,
    product_name        NVARCHAR(60)     NOT NULL,
    category            NVARCHAR(22)     NOT NULL,
    subcategory         NVARCHAR(22)     NOT NULL,
    brand               NVARCHAR(14)     NOT NULL,
    sku                 NVARCHAR(9)      NOT NULL,
    unit_cost_usd       DECIMAL(10,2)    NOT NULL,
    unit_price_usd      DECIMAL(10,2)    NOT NULL,
    gross_margin_pct    DECIMAL(6,1)     NOT NULL,
    weight_kg           DECIMAL(6,2)     NOT NULL,
    is_digital          BIT              NOT NULL,
    is_perishable       BIT              NOT NULL,
    stock_quantity      INT              NOT NULL,
    reorder_level       SMALLINT         NOT NULL,
    supplier_country    NVARCHAR(12)     NOT NULL,
    launch_date         DATE             NOT NULL,
    is_active           BIT              NOT NULL,
    rating_avg          DECIMAL(3,1)     NOT NULL,
    review_count        INT              NOT NULL,
    tags                NVARCHAR(100)    NOT NULL
);

BULK INSERT Transactions
FROM 'C:\Users\HP\Dropbox\My PC (DESKTOP-BT38IV3)\Desktop\RFM DATASET\fact_transactions.csv'
WITH
	(FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
)
;
drop table Campaigns
BULK INSERT Campaigns
FROM 'C:\Users\HP\Dropbox\My PC (DESKTOP-BT38IV3)\Desktop\RFM DATASET\dim_campaigns_pipe.csv'
WITH
	(FIRSTROW=2,
	FIELDTERMINATOR='|',
	ROWTERMINATOR = '\n',
	TABLOCK
)
;
BULK INSERT Customers
FROM 'C:\Users\HP\Dropbox\My PC (DESKTOP-BT38IV3)\Desktop\RFM DATASET\dim_customers.csv'
WITH
	(FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
)
;
BULK INSERT Products
FROM 'C:\Users\HP\Dropbox\My PC (DESKTOP-BT38IV3)\Desktop\RFM DATASET\dim_products.csv'
WITH
	(FIRSTROW=2,
	FIELDTERMINATOR=',',
	CODEPAGE = '65001',
	TABLOCK
);

