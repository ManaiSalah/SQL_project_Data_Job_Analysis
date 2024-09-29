
   --SUBQUERIES
    SELECT *
    FROM (--subquery starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(Month from job_posted_date) = 1
    )AS january_jobs;
    --Subquery ends here 

--CTE'S
 WITH january_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(Month from job_posted_date) = 1
    )
SELECT* FROM january_jobs


--Subqueries excercise
SELECT
    company_id,
    name as company_name
FROM company_dim
WHERE company_id IN (
SELECT 
    company_id
FROM 
    job_postings_fact
WHERE 
    job_no_degree_mention=true
    ORDER BY company_id 
)

--CTE excercise
/*find the companies that have the most job openings 
--Get the total number of  job postings per company id
--Return the total number of jobs with the company name 
*/ 

WITH company_job_count AS (

SELECT 
    company_id,
    Count(*) AS total_jobs
from job_postings_fact
GROUP BY company_id
)

SELECT 
    company_dim.name AScompany_name ,
    company_job_count.total_jobs
from company_dim
left join company_job_count on company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC