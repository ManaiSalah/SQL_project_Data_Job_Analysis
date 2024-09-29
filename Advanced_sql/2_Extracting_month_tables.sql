-- Create table for January jobs
CREATE TABLE January_jobs AS
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(Month from job_posted_date) = 1;

-- Create table for February jobs
CREATE TABLE February_jobs AS
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(Month from job_posted_date) = 2;

-- Create table for March jobs
CREATE TABLE March_jobs AS
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(Month from job_posted_date) = 3;