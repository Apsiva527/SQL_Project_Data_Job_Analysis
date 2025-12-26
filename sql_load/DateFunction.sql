--Date function

select * from company_dim;
select * from job_postings_fact;
select * from skills_dim;

select * from skills_job_dim;

select 
job_title_short as Title,
job_location as Location, 
job_posted_date as date
FROM
job_postings_fact
Limit 5;

select 
job_title_short as Title,
job_location as Location, 
job_posted_date::Date as date
FROM
job_postings_fact
Limit 5;


select 
job_title_short as Title,
job_location as Location, 
job_posted_date as date_time
FROM
job_postings_fact
Limit 5;

select 
job_title_short as Title,
job_location as Location, 
job_posted_date AT Time Zone 'UTC' AT Time Zone 'EST'
FROM
job_postings_fact
Limit 5;

select 
job_title_short as Title,
job_location as Location, 
job_posted_date AT Time Zone 'UTC' AT Time Zone 'EST',
Extract(MONTH FROM job_posted_date) AS Date_Month
FROM
job_postings_fact
Limit 5;