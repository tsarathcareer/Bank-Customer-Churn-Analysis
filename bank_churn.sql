create database bank_customer_churn;
use bank_customer_churn;

select * from bank_churn;
select * from bank_churn_data_dictionary;

-- customer churn analysis

-- exited customers
select count(*) as exited_customers from bank_churn where exited = 1;

-- What % of customers are leaving?
select round(sum(exited)*100/count(*)) as exited_customer_percent from bank_churn;
-- or
select round(avg(exited)*100) as exited_customer_percent from bank_churn;		-- 20%

-- Which regions are bleeding customers?
select * from bank_churn;
select geography,count(*) as total_customer,
sum(exited) as churn_customers,
round(avg(exited)*100) as churn_percent
from bank_churn group by geography
order by churn_percent desc;				-- Germany

-- Is churn behavior different by gender?
select gender,count(*) as total_customer,
sum(exited) as churn_customers,
round(avg(exited)*100) as churn_percent
from bank_churn group by gender
order by churn_percent desc;			-- female have high churn compare to male

-- Which age groups are most likely to churn?
select 
case 
when age < 30 then 'Young (under 30)'
when age between 30 and 45 then 'General adults (30-45)'
when age between 46 and 60 then 'aged adults (46-60)'
else 'Senior citizens (60+)'
end as age_group,
count(*) as total_customer,
sum(exited) as churn_customers,
round(avg(exited)*100) as churn_percent
from bank_churn
group by age_group
order by churn_percent desc;		-- Age 46-60 having highest churn percent of 51%

-- Are low or high credit score customers leaving more?
select * from bank_churn;
select 
case 
when creditscore < 500 then 'Low'
when creditscore between 500 and 700 then 'Medium'
else 'High'
end as creditscore_group,
count(*) as total_customer,
sum(exited) as churn_customers,
round(avg(exited)*100) as churn_percent
from bank_churn
group by creditscore_group
order by churn_percent desc;	-- Low credit score customers having highest churn of 24%

-- Do new or long-term customers churn more?
select * from bank_churn;
select tenure,
count(*) as total_customer,
sum(exited) as churn_customers,
round(avg(exited)*100) as churn_percent
from bank_churn
group by tenure
order by churn_percent desc;		-- Newly customers having highest churn of 23%

-- Are high-balance customers leaving?
select 
case
when balance = 0 then 'Zero balance'
when balance < 50000 then 'Low balance'
when balance between 50000 and 150000 then 'Medium balance'
else 'High balance'
end as balance_criteria,
count(*) as total_customer,
sum(exited) as churn_customers,
round(avg(exited)*100) as churn_percent
from bank_churn
group by balance_criteria
order by churn_percent desc;		-- Low balance - 35% highest

-- Do customers with more products stay longer?
select NumOfProducts,
count(*) as total_customer,
sum(exited) as churn_customers,
round(avg(exited)*100) as churn_percent
from bank_churn
group by numofproducts
order by churn_percent desc;		-- more than 3 product having high churn rate
									-- 100% churn rate for having 4 products

-- Does engagement reduce churn?
select IsActiveMember,
count(*) as total_customer,
sum(exited) as churn_customers,
round(avg(exited)*100) as churn_percent
from bank_churn
group by IsActiveMember
order by churn_percent desc;		-- inactive memmbers are leaving more having 27%

-- Does having a credit card reduce churn?
select HasCrCard,
count(*) as total_customer,
sum(exited) as churn_customers,
round(avg(exited)*100) as churn_percent
from bank_churn
group by HasCrCard
order by churn_percent desc;		-- No big difference (1% difference)

-- Are high earners more likely to leave?
select 
case
when estimatedsalary < 50000 then 'Low'
when estimatedsalary between 50000 and 100000 then 'Medium'
else 'High'
end as salary_category,
count(*) as total_customer,
sum(exited) as churn_customers,
round(avg(exited)*100) as churn_percent
from bank_churn
group by salary_category
order by churn_percent desc;		-- No big difference (1% more for high compare to medium and low)

-- Who are the highest-risk customers?
select geography,IsActiveMember,NumOfProducts, 
round(avg(exited)*100) as churn_percent
from bank_churn
group by geography,IsActiveMember,NumOfProducts
order by churn_percent desc;		-- more product holders having 100% churn rate

select * from bank_churn;

-- consolitated
select
geography,IsActiveMember,NumOfProducts,
case
when age < 30 then 'Young (under 30)'
when age between 30 and 45 then 'General adults (30-45)'
when age between 46 and 60 then 'aged adults (46-60)'
else 'Senior citizens (60+)'
end as age_group,
case
when balance = 0 then 'Zero balance'
when balance < 50000 then 'Low balance'
when balance between 50000 and 150000 then 'Medium balance'
else 'High balance'
end as balance_criteria,
case 
when creditscore < 500 then 'Low'
when creditscore between 500 and 700 then 'Medium'
else 'High'
end as creditscore_group,
count(*) as total_customer,
sum(exited) as churn_customers,
round(avg(exited)*100) as churn_percent
from bank_churn
group by geography,IsActiveMember,NumOfProducts,age_group,balance_criteria,creditscore_group
order by churn_percent desc;

/* 
Suboptimal client engagement is resulting in customer churn. 
The inability to retain high-ticket clients poses a critical risk to top-line revenue.
*/