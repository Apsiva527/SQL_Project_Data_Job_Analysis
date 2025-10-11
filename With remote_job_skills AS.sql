With remote_job_skills AS 
(SELECT skill_id, count(*) AS skill_count
FROM skills_job_dim As skills_to_job
inner join job_postings_fact as job_postings ON job_postings.job_id = skills_to_job.job_id
where job_postings.job_work_from_home = True
AND job_postings.job_title_short = 'Data Analyst'
Group by skill_id)
SELECT skills.skill_id,skills as skill_name,skill_count from remote_job_skills
INNER JOIN skills_dim as skills ON skills.skill_id = remote_job_skills.skill_id
Order by skill_count DESC
LIMIT 5;
