/*
Answer What are the top skills based on salary?
-look at the average salary associated with each skill for Data Analyst positions 
-Focuses on roles with specified salaries ,regardless of location 
*/



SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS Average_salary
    
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE job_title_short='Data Analyst' 
AND salary_year_avg IS NOT NULL
AND job_work_from_home=TRUE
GROUP BY skills
ORDER BY Average_salary DESC
LIMIT 25

/*
Key Observations:
Big Data and AI tools (like PySpark, Couchbase, DataRobot) 
lead the salary pack, as companies invest more in these areas.

Cloud and DevOps tools are highly valued, with Bitbucket, GitLab, 
and Kubernetes offering strong compensation, showing the increasing shift to cloud-native, automated infrastructures.

Data science and programming skills (Pandas, Jupyter, Numpy) 
remain lucrative, supporting the massive growth in data-driven 
decision-making.

Overall, roles involving a combination of big data processing, 
cloud computing, machine learning, and AI-related tools 
are some of the highest-paying in the tech industry.
/*