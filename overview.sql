use project2
select * from bank_loan_data
--monthly trends by issuing date
select 
    month(issue_date)  as months_number,
    datename(month,issue_date) as months_name,
    count(id) as total_loan_application,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_received_amount
from bank_loan_data
group by   month(issue_date), datename(month,issue_date)
order by month(issue_date)
--regional analysis bt state
select 
    address_state as state,
    count(id) as total_loan_application,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_received_amount
from bank_loan_data
group by  address_state
order by sum(loan_amount)  desc
--loan term analysis
select 
    term as total_term,
    count(id) as total_loan_application,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_received_amount
from bank_loan_data
group by  term
order by sum(loan_amount)  desc
--employee length analysis
select 
    emp_length as total_duration_of_job,
    count(id) as total_loan_application,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_received_amount
from bank_loan_data
group by emp_length
order by emp_length
--order by count
select 
    emp_length as total_duration_of_job,
    count(id) as total_loan_application,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_received_amount
from bank_loan_data
group by emp_length
order by count(id)desc
--loan perpose
select 
    purpose as main_perpose,
    count(id) as total_loan_application,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_received_amount
from bank_loan_data
group by purpose
order by count(id)desc
--home ownership
select 
    home_ownership as home_ownership,
    count(id) as total_loan_application,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_received_amount
from bank_loan_data
group by home_ownership
order by count(id)desc



