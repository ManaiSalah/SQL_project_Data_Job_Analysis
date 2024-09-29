# Introduction
This project explores data job market trends by analyzing job postings, focusing on key skills, average salaries, and demand for remote positions. The analysis helps to understand which skills are in high demand and offer lucrative opportunities.

SQL queries ? Check them out here:[project_sql folder](/Project_sql/)


### The questions i wanted to answer throught my sql queries were:

1. What are the top_paying data analyst jobs?
2. What skills are required for these top_paying jobs?
3. What skills are most in demand for data analysis?
4. Wich skills are associated with higher salaries ?
5. What are the most optimal skills to learn ?
# Tools I used

- **SQL** for querying and analysis
- **PostgreSQL** for data storage and manipulation
- **Git & Github**


# The Analysis

### 1. Top paying Data Analyst Jobs 
This analysis highlights the top-paying data analyst jobs, with the highest salary at Mantys reaching $650,000. Director and senior analyst roles, such as at Meta and AT&T, offer competitive salaries ranging from $250,000 to $336,500. Even standard data analyst roles from companies like Pinterest and UCLA exceed $200,000. The focus was to show that top-tier companies are offering substantial salaries, especially for remote and hybrid roles, reflecting the growing demand for flexibility and leadership in data analytics.
~~~sql
SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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
~~~

### 2. Top Paying Job Skills: Reveals which skills are linked to the highest-paying jobs.

### 3. Top Demanded Skills: Lists the most in-demand skills for data analyst roles.

~~~~sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE job_title_short='Data Analyst' and job_work_from_home=TRUE
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5 
~~~~

### 4. Top Paying Skills: Highlights the highest-paying skills for data professionals.

| **Skills**    | **Average Salary ($)** |
|---------------|------------------------|
| PySpark       | 208,172                |
| Bitbucket     | 189,155                |
| Couchbase     | 160,515                |
| Watson        | 160,515                |
| DataRobot     | 155,486                |


### 5. Optimal Skills: Combines demand and salary data to pinpoint high-demand and high-paying skills.


## 💡 What I Learned
THroughout this adventure ,I've turbocharged my sql toolkit with some serious firepower:
- **Complex query Crafting:** Mastered the art of advanced SQL ,merging tables like a pro and using clause .
- **Data Aggregation:** Got cozy with GROUP BY and turned aggregation function like Count() and AVG() into data_summarizing sidekicks .
- **Analytical Wizardry:**Leveled up my real_word puzzle_solving skills turning questions into actionable insightful SQL queries.

## 🏁 Conclusion
This project offers valuable insights into the data job market, helping professionals make **informed decisions** about which skills to learn and which job opportunities to pursue. **SQL** proved to be an effective tool for mining job data and drawing actionable conclusions.





# What I Learned

# Conclusion 
