
/*
Questions : What skills are required for the top_paying data analyst jobs ?
-Use the top 10 highest paying Data Analyst jobs from first query 
-Add the specific skills required for these roles 
-Why ? It provides a detailed look at wich high paying jobs demand certain skills
*/


With top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        company_dim.name AS company_name
    FROM 
        job_postings_fact 
    LEFT JOIN  company_dim  on job_postings_fact.company_id=company_dim.company_id  
    WHERE 
        job_title_short='Data Analyst'
    AND 
        job_location='Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10

)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim on top_paying_jobs.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC

/*Here's the breakdown of the most demanded for data analysis in 2023 bases on 
job postings :
SQL 
Python
Tableau 
Others: R Snowflake....
*/