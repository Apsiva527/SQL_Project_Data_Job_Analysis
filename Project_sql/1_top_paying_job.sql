/*About the SQL_Project
Goal 
1.You are an aspiring data nerd looking to analysze the top paying roles and skills
2. You will create sql queries to explore this large dataset specific to you
3. For those job searching or looking  for a promotopn, you cannot only use this project to show case experience BUT also to extract what roles/skilss you should target
*/

/*

Question: what are the top-paying data analyst jobs?
Identify the top 10 highest -paying Data Analyst roles that are avaialble remotely.
Focuses on job postings with specified salaries(remove nulls).
why?highlight the top paying opprotunites for data analyst, offering insights into employee

*/
SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,name AS company_name
    FROM
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
    ORDER BY
    salary_year_avg DESC
LIMIT 10;