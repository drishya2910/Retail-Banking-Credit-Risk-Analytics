-- SQL scripts will be added here.
SELECT
    COUNT(*)                                          AS total_customers,
    SUM(CASE WHEN annual_income IS NULL THEN 1 END)   AS missing_income,
    SUM(CASE WHEN credit_score  IS NULL THEN 1 END)   AS missing_credit_score,
    SUM(CASE WHEN age           IS NULL THEN 1 END)   AS missing_age
FROM customers;

SELECT AVG(annual_income) AS true_median
FROM (
    SELECT annual_income,
           ROW_NUMBER() OVER (ORDER BY annual_income) AS rn,
           COUNT(*) OVER () AS total_count
    FROM customers
    WHERE annual_income IS NOT NULL
) AS sub
WHERE rn IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));

SET SQL_SAFE_UPDATES = 0;

UPDATE accounts
SET balance_flag = CASE 
    WHEN current_balance < 0 THEN 'Negative' 
    ELSE 'Normal' 
END;

select * 
from accounts;

UPDATE transactions 
SET transaction_Date = STR_TO_DATE(transaction_Date, '%d-%m-%Y');

select
  Loan_status,
count(*)   as account_count,
ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_total,
ROUND(AVG(current_balance), 2)                    AS avg_balance,
ROUND(AVG(credit_risk_rating), 2)                 AS avg_risk_rating
from accounts
group by Loan_status
order by account_count desc;

select 
credit_risk_rating,
Count(*) AS accounts,Loan_status,
round(avg(current_balance), 2)  as avg_balance
from accounts
GROUP BY credit_risk_rating, loan_status
ORDER BY credit_risk_rating, loan_status;

 select
 a.account_id,
    a.customer_id,
    a.account_type,
    a.current_balance,
    a.credit_risk_rating,
    a.loan_status,
    c.credit_score,
    c.annual_income,
    c.city
FROM accounts a
JOIN customers c ON a.customer_id = c.customer_id
WHERE a.credit_risk_rating >= 8
   OR a.loan_status IN ('Delinquent', 'Charged-off')
ORDER BY a.credit_risk_rating DESC, a.loan_status;

select 
round(
sum(case when loan_status in('Delinquent','Charged-off') then 1.0 else 0 end)
/ count(*) * 100,2
) AS npa_rate_pct,
round(
sum(case when loan_status in('Delinquent','Charged-off') then current_balance else 0 end), 2
) AS npa_balance_exposure,
round(sum(current_balance),2)    AS Total_Portfolio_balance
from accounts;

select
c.employment_status,
count(distinct c.customer_id)  AS customers,
round(AVG(c.credit_score),1)   AS Avg_credit_score,
round(AVG(c.annual_income),2)   AS Avg_income,
sum(CASE WHEN a.loan_status = 'Delinquent'then 1 else 0 end) as Delinquent_accounts,
sum(CASE WHEN a.loan_status = 'Charged-off'then 1 else 0 end) as charged_off_accounts
from customers c
Left join accounts a on c.Customer_ID = a.Customer_ID
group  by c.employment_status
order by avg_credit_score desc;

select
c.city,
count(distinct c.customer_id) AS customers,
round(avg(c.credit_score),1) as avg_credit_score,
ROUND(AVG(c.annual_income), 2) AS avg_income,
round(avg(a.credit_risk_rating),2) AS avg_risk_rating,
    SUM(CASE WHEN a.loan_status = 'Charged-off' THEN 1 ELSE 0 END) AS charged_off
FROM customers c
LEFT JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.city
ORDER BY avg_risk_rating DESC;

select
    case 
     when age between 22 and 30 then '22-30(young)'
     when age between 31 and 45 then '31-45(Mid career)'
     when age between 46 and 60 then '46-60(Senior)'
     Else '60+ (Retired)'
     end  AS age_band,
     count(*) as customers,
     round(avg(credit_score),1) as avg_credit_score,
     round(avg(annual_income),2) as avg_income
     from customers
     group by age_band
     order by min(age);
     
     select
     case 
     when credit_score >= 750 then 'excellent (750+)'
     when credit_score >= 700 then 'Good (700-749)'
     when credit_score >= 650 then 'Fair (650-699)'
     when credit_score >= 600 then 'Poor (600-649)'
     else 'very poor (<600)'
     end as credit_tier,
     count(*) as customers,
     round(avg(annual_income),2) as avg_income
     from customers
     group by credit_tier
     order by min(credit_score) desc;
     
select
     category,
     count(*) as txn_count,
     sum(case when Transaction_Type = 'credit'then 1 else 0 end) as credits,
     sum(case when Transaction_Type = 'debit' then 1 else 0 end) as debits
     from transactions
     group by Category
     order by txn_count desc;
     
     SELECT
    DATE_FORMAT(transaction_date, '%Y-%m')            AS month,
    COUNT(*)                                          AS txn_count,
    SUM(transaction_type = 'Credit')                  AS credits,
    SUM(transaction_type = 'Debit')                   AS debits
FROM transactions
WHERE transaction_date IS NOT NULL
GROUP BY month
ORDER BY month;
	
 select
 t.account_id,
 a.account_type,
 a.loan_status,
 count(*) as txn_count,
 sum(case when t.Transaction_type = 'debit' then 1 else 0 end) as debit
 from transactions t
 join accounts a on t.Account_ID = a.Account_ID
 group by t.Account_ID, a.Account_Type, a.Loan_Status
 order by txn_count desc
limit 20; 
 
SELECT
    t.customer_id,
    COUNT(*)                                          AS late_fee_count,
    a.loan_status,
    c.credit_score
FROM transactions t
JOIN accounts  a ON t.account_id  = a.account_id
JOIN customers c ON t.customer_id = c.customer_id
WHERE t.category = 'Late Fee'
GROUP BY t.customer_id, a.loan_status, c.credit_score
ORDER BY late_fee_count DESC;

SELECT
    COUNT(DISTINCT a.account_id) AS total_accounts,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(DISTINCT t.transaction_id) AS total_transactions,
    ROUND(AVG(c.credit_score), 1) AS avg_credit_score,
    ROUND(AVG(a.credit_risk_rating), 2) AS avg_risk_rating,
    ROUND(AVG(c.annual_income), 2) AS avg_annual_income,
    ROUND(SUM(a.current_balance), 2) AS total_portfolio_balance,
    ROUND(
        (SUM(a.loan_status IN ('Delinquent', 'Charged-off')) / COUNT(DISTINCT a.account_id)) * 100, 
        2
    ) AS npa_rate_pct
FROM accounts a
LEFT JOIN customers c ON a.customer_id = c.customer_id
LEFT JOIN transactions t ON a.account_id = t.account_id;

SELECT
    a.credit_risk_rating,
    ROUND(AVG(c.credit_score), 1)                     AS avg_credit_score,
    ROUND(AVG(c.annual_income), 2)                    AS avg_income,
    COUNT(*)                                          AS accounts
FROM accounts a
JOIN customers c ON a.customer_id = c.customer_id
GROUP BY a.credit_risk_rating
ORDER BY a.credit_risk_rating;

SELECT
    account_id,
    open_date,
    loan_status,
    current_balance,
    SUM(IF(loan_status IN ('Delinquent', 'Charged-off'), current_balance, 0)) 
        OVER (ORDER BY open_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_npa_exposure
FROM accounts
ORDER BY open_date;

select 
customer_id,
count(*) as total_accounts,
 SUM(CASE WHEN loan_status = 'Delinquent'  THEN 1 ELSE 0 END) AS delinquent,
    SUM(CASE WHEN loan_status = 'Charged-off' THEN 1 ELSE 0 END) AS charged_off
FROM accounts
GROUP BY customer_id
HAVING SUM(CASE WHEN loan_status = 'Delinquent'  THEN 1 ELSE 0 END) > 0
   AND SUM(CASE WHEN loan_status = 'Charged-off' THEN 1 ELSE 0 END) > 0;
   
   CREATE OR REPLACE VIEW vw_banking_master AS
SELECT
    a.account_id,
    a.customer_id,
    a.account_type,
    a.open_date,
    a.current_balance,
    a.credit_risk_rating,
    a.loan_status,
    c.age,
    c.city,
    c.employment_status,
    c.annual_income,
    c.credit_score,
    CASE
        WHEN c.credit_score >= 750 THEN 'Excellent'
        WHEN c.credit_score >= 700 THEN 'Good'
        WHEN c.credit_score >= 650 THEN 'Fair'
        WHEN c.credit_score >= 600 THEN 'Poor'
        ELSE 'Very Poor'
    END AS credit_tier,
    CASE
        WHEN c.age BETWEEN 22 AND 30 THEN '22–30'
        WHEN c.age BETWEEN 31 AND 45 THEN '31–45'
        WHEN c.age BETWEEN 46 AND 60 THEN '46–60'
        ELSE '60+'
    END AS age_band,
    CASE WHEN a.current_balance < 0 THEN 'Negative' ELSE 'Normal' END AS balance_flag
FROM accounts a
LEFT JOIN customers c ON a.customer_id = c.customer_id;

CREATE OR REPLACE VIEW vw_txn_summary AS
SELECT
    t.transaction_id,
    t.account_id,
    t.customer_id,
    t.transaction_date,
    t.category,
    t.transaction_type,
    a.loan_status,
    a.credit_risk_rating,
    c.city,
    c.credit_score
FROM transactions t
LEFT JOIN accounts  a ON t.account_id  = a.account_id
LEFT JOIN customers c ON t.customer_id = c.customer_id;

