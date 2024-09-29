--Extracting the date only from job_posted date using ::DATE function

SELECT 
    job_title_short AS title,
    job_location as location,
    job_posted_date::DATE AS date 
FROM job_postings_fact;


--Using AT timezone to show the time zone for each Date 
SELECT 
    job_title_short AS title,
    job_location as location,
    job_posted_date AT TIME zone 'UTC' AT TIME zone 'EST' 
FROM job_postings_fact
limit 5;

--Using the extract function to extract the month and the year seperatly from the date 
SELECT 
    job_title_short AS title,
    job_location as location,
    EXTRACT (MONTH FROM job_posted_date) AS Month  
FROM job_postings_fact
limit 5;

SELECT 
    job_title_short AS title,
    job_location as location,
    EXTRACT (MONTH FROM job_posted_date) AS Month,
     EXTRACT (YEAR FROM job_posted_date) AS Year   
FROM job_postings_fact
limit 5;