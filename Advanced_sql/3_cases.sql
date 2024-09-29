--Creating a Case Expression Based on job_location Column 


SELECT  
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location='Anywhere' THEN 'Remote'
        WHEN job_location='New York'THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
from job_postings_fact
WHERE job_title_short='Data Analyst'
GROUP BY location_category
 