
--Subquery and CTE
select * from 
(SELECT * from job_postings_fact 
where Extract(month from job_posted_date) = 1)
As january_job

With january_job as (SELECT * from job_postings_fact 
where Extract(month from job_posted_date) = 1)
select * from january_job;

select 
company_id, 
job_no_degree_mention
from job_postings_fact 
where job_no_degree_mention = true
--use above query as subquery to fetch company name assoaciated 
select company_id, name as compnay_name 
from company_dim 
where company_id IN (select 
company_id
from job_postings_fact 
where job_no_degree_mention = true
Order by company_id)

select * from company_dim limit 3

/*
Find the companies that have the most job openings.
Get the total number of job postings per company_id(job_posting_fact)
Return the total number of the jobs with the company name(company_dim)

*/
With Company_job_count as (
select company_id, count(*) 
from job_postings_fact
Group by company_id)
select name from Company_dim 
Left join  Company_job_count on Company_job_count.company_id = company_dim.company_id

With Company_job_count as (
select company_id, count(*) as total_jobs
from job_postings_fact
Group by company_id)
select company_dim.name as company_name, 
Company_job_count.total_jobs from Company_dim 
Left join  Company_job_count on Company_job_count.company_id = company_dim.company_id
order by total_jobs desc;


/* Find the count of the number of remote job postings per skill
Display the top 5 skills by their demand in remote jobs
Include skill id name and count of the posting requiring the skill
*/

select job_postings.job_id,
skill_id,
job_postings.job_work_from_home
from skills_job_dim as skills_to_job
Inner Join job_postings_fact as job_postings on job_postings.job_id = skills_to_job.job_id
where job_postings.job_work_from_home = True

*********

With Remote_job_skills As(
select 
skill_id,
count(*) as Skill_count
from
skills_job_dim as skills_to_job
Inner Join
job_postings_fact as job_postings on job_postings.job_id = skills_to_job.job_id
where 
job_postings.job_work_from_home = True and 
job_postings.job_title_short = 'Data Analyst'
Group By 
skill_id
)
Select 
skills.skill_id,
skills as skill_name,
skill_count
from Remote_job_skills
Inner Join skills_dim as skills on skills.skill_id = Remote_job_skills.skill_id
Order by
skill_count DESC Limit 5;