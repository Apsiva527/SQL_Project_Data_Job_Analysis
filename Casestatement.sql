/*
Label new column as follows:
Anywhere jobs as 'Remote'
'New York, NY jobs as 'Local'
Otherwise'Onsite'
test
*/
select 
count(job_id) as number_of_jobs,
--job_title_short,
--job_location,
CASE
    WHEN job_location = 'Anywhere' Then 'Remote'
    WHEN job_location = 'New York, NY' Then 'Local'
    Else 'Onsite'
End AS location_category
From job_postings_fact
where job_title_short = 'Data Analyst'
Group by location_category;