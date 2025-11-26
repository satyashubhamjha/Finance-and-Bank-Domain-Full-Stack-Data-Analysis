create database project2
use project2
select * from bank_loan_data
--total lone applications
select count(id) as total_loan_application from bank_loan_data 
--total lone application in MONTHS 
select count(id) as total_loan_application_in_months from bank_loan_data 
where month(issue_date)=12 and year(issue_date)=2021
--total lone application in prev. month
select count(id) as total_loan_application_in_prev_month  from bank_loan_data 
where month(issue_date)=11 and year(issue_date)=2021
--(MTD-PMTD)/PMTD
select
cast((
(
select count(id) as total_loan_application_in_months from bank_loan_data 
where month(issue_date)=12 and year(issue_date)=2021
)
-
(
select
count(id) as total_loan_application_in_prev_month  from bank_loan_data 
where month(issue_date)=11 and year(issue_date)=2021)
)*100
/
(select count(id) as total_loan_application_in_prev_month  from bank_loan_data 
where month(issue_date)=11 and year(issue_date)=2021) as decimal(10,2)) as growth_rate
--total_funded amount
select sum(loan_amount) as total_funded_amount from bank_loan_data
----total_funded amount in a particular months 
select sum(loan_amount) as total_funded_amount_in_months from bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021
----total_funded amount in a previous months 
select sum(loan_amount) as total_funded_amount_in_prev_months from bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021
--total amount received
select sum(total_payment) as total_amount_received from bank_loan_data 
--total profit
select
(
select sum(total_payment) as total_amount_received from bank_loan_data
)
-
(
select sum(loan_amount) as total_funded_amount from bank_loan_data
) as total_profit
----total amount received in a months
select sum(total_payment) as total_amount_received_in_months from bank_loan_data 
where month(issue_date)=12 and year(issue_date)=2021
-- total amount received in a previous months
select sum(total_payment) as total_amount_received_in_months from bank_loan_data 
where month(issue_date)=11 and year(issue_date)=2021
--average interest rate
select round(avg(int_rate)*100,2) as av_interest_rate from bank_loan_data
--avg interest rate in particular months
select round(avg(int_rate)*100,2) as av_interest_rate from bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021
----avg interest rate in previous months
select round(avg(int_rate)*100,2) as av_interest_rate from bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021
--average debt-to-income ratio(DTI).
Select round(avg(dti)*100,2) as average_dti from bank_loan_data
----average debt-to-income ratio(DTI) for particular months
Select round(avg(dti)*100,2) as average_dti_for_particular_months from bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021
----average debt-to-income ratio(DTI) for previous months
Select round(avg(dti)*100,2) as average_dti_for_previous_months from bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021
--good loan 
select
     (count(case when loan_status='fully paid' or loan_status='current' then id end))*100
     /
     count(id) as good_lone_percentag
from bank_loan_data
--good loan application
select count(id) as good_loan_application
from bank_loan_data
where loan_status='fully paid' or loan_status='current' 
--good loan ammount
select
    sum(loan_amount) as good_loan_funded_amount from bank_loan_data
where loan_status='fully paid' or loan_status='current'
--good loan total received amount
select
    sum(total_payment) as good_loan_total_payment from bank_loan_data
where loan_status='fully paid' or loan_status='current'
--bad loan
select
     (count(case when loan_status='charged off'then id end))*100.0
     /
     count(id) as bad_loan_percentag
from bank_loan_data
--bad loan application
select count(id) as bad_loan_application
from bank_loan_data
where loan_status='charged off' 
--bad loan ammount
select
    sum(loan_amount) as bad_loan_funded_amount from bank_loan_data
where loan_status='charged off'
--bad loan total received amount
select
    sum(total_payment) as bad_loan_total_payment from bank_loan_data
where loan_status='charged off'
--LOAN STATUS GRID VIEW
select
    loan_status,
    count(id) as total_loan_applications,
    sum(total_payment) as total_received_amount,
    sum(loan_amount) as total_funded_amount,
    avg(int_rate)*100.0 as average_intersest_rate,
    avg(dti)*100 as DTI
from bank_loan_data 
group by loan_status
--loan status grid view for particular months
select
    loan_status,
    count(id) as total_loan_applications,
    sum(total_payment) as total_received_amount,
    sum(loan_amount) as total_funded_amount,
    avg(int_rate)*100.0 as average_intersest_rate,
    avg(dti)*100 as DTI
from bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021
group by loan_status













