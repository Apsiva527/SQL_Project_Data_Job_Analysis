--Using Union and Union all

create table january_job as (SELECT * from job_postings_fact 
where Extract(month from job_posted_date) = 1)

select * from january_job

create table february_job as (SELECT * from job_postings_fact 
where Extract(month from job_posted_date) = 2)

select * from february_job

create table march_job as (SELECT * from job_postings_fact 
where Extract(month from job_posted_date) = 3)

select * from march_job

select job_title_short,company_id,job_location from january_job
Union
select job_title_short,company_id,job_location from february_job
Union
select job_title_short,company_id,job_location from march_job

select job_title_short,company_id,job_location from january_job
Union ALL
select job_title_short,company_id,job_location from february_job
Union ALL
select job_title_short,company_id,job_location from march_job

/*
Find job postings form the first quater that have a salary greater than $70K
ombine job posting tables from the first quarter of 2023(Jan-Mar)
Gets job postings with an average yearly salary >$70,000

*/

select 
quater1_job_posting.job_title_short,
quater1_job_posting.job_location,
quater1_job_posting.job_via,
quater1_job_posting.job_posted_date::DATE,
quater1_job_posting.salary_year_avg
 from 
(
select * from january_job
UNION ALL
select * from february_job
UNION ALL
select * from march_job) as quater1_job_posting
where 
quater1_job_posting.salary_year_avg > 70000 and
quater1_job_posting.job_title_short = 'Data Analyst'
Order by salary_year_avg desc

--same without the tablename before column
______________
select 
job_title_short,
job_location,
job_via,
job_posted_date::DATE,
salary_year_avg
 from 
(
select * from january_job
UNION ALL
select * from february_job
UNION ALL
select * from march_job) as quater1_job_posting
where 
salary_year_avg > 70000 and
job_title_short = 'Data Analyst'
Order by salary_year_avg desc
