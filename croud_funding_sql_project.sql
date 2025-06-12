show databases;

use croud_funding;

show tables;
select * from crowdfunding_category;
select * from crowdfunding_location;

-- 1. Convert the Date fields to Natural Time ( Currently the dates are in Epoch time Read the attached Artical for Reference on Epoch Time 
             -- https://www.epochconverter.com/ )

select * from projects 
order by projectid asc;

-- created_at convert into normal date
SELECT created_at,date(FROM_UNIXTIME(created_at)) as created_at_converinto_date from projects;

-- deadline_at convert into normal date
SELECT deadline, date(FROM_UNIXTIME(deadline)) as deadline_converinto_date from projects;

-- updated_at convert into normal date
SELECT updated_at,date(FROM_UNIXTIME(updated_at)) as updated_at_converinto_date from projects;

-- state_changed_at convert into normal date
SELECT state_changed_at,date(FROM_UNIXTIME(state_changed_at)) as state_changed_at_converinto_date from projects;

-- launched_at convert into normal date
SELECT launched_at,date(FROM_UNIXTIME(launched_at )) as launched_at_converinto_date from projects;

select * from projects;

-- drop view if alredy exisits
drop view if exists project_table;

-- create view as project table
create view project_table as
select projectid, state , name ,country , creator_id , location_id ,category_id , created_at,
-- created_at convert into normal date
date(FROM_UNIXTIME(created_at)) as created_at_converinto_date,
-- deadline_at convert into normal date
 date(FROM_UNIXTIME(deadline)) as deadline_converinto_date,
 -- updated_at convert into normal date
 date(FROM_UNIXTIME(updated_at)) as updated_at_converinto_date,
 -- state_changed_at convert into normal date
 date(FROM_UNIXTIME(state_changed_at)) as state_changed_at_converinto_date,
 -- launched_at convert into normal date
 date(FROM_UNIXTIME(launched_at )) as launched_at_converinto_date,
 -- find avagare of project during days
FROM_UNIXTIME(deadline)- FROM_UNIXTIME(created_at) as average_days,
 goal * static_usd_rate as goal_convert_into_static_usd_amount
 from projects
 order by projectid asc;
 
 -- select view project_table
 select * from project_table;
 
 
-- drop view 
drop view if exists epoch_time_chnage_into_normal_time;
drop view epoch_time_change_into_normal_time;

-- create view for all epoch time change into normal time

create view epoch_time_change_into_normal_time as
select distinct
-- created_at convert into normal date
date(FROM_UNIXTIME(created_at)) as created_at_converinto_date,
-- deadline_at convert into normal date
 date(FROM_UNIXTIME(deadline)) as deadline_converinto_date,
 -- updated_at convert into normal date
 date(FROM_UNIXTIME(updated_at)) as updated_at_converinto_date,
 -- state_changed_at convert into normal date
 FROM_UNIXTIME(state_changed_at) as state_changed_at_converinto_date,
 -- launched_at convert into normal date
 date(FROM_UNIXTIME(launched_at )) as launched_at_converinto_date
 from projects
 order by created_at_converinto_date asc;
 
 -- select view epoch_time_change_into_normal_time 
 
 select * from epoch_time_change_into_normal_time;
 
 -- 2. Build a Calendar Table using the Date Column Created Date ( Which has Dates from Minimum Dates and Maximum Dates)
 --  Add all the below Columns in the Calendar Table using the Formulas.
   /*
   A.Year
   B.Monthno
   C.Monthfullname
   D.Quarter(Q1,Q2,Q3,Q4)
   E. YearMonth ( YYYY-MMM)
   F. Weekdayno
   G.Weekdayname
   H.FinancialMOnth ( April = FM1, May= FM2  …. March = FM12)
   I. Financial Quarter ( Quarters based on Financial Month FQ-1 . FQ-2..)
			*/
-- create calender table
-- created_at convert into normal date
# date convertion
select distinct DATE((FROM_UNIXTIME(created_at))) as dates,
# year
year(FROM_UNIXTIME(created_at)) as year,
# month_name
month(FROM_UNIXTIME(created_at)) as month_number,
# month_name
monthname(FROM_UNIXTIME(created_at)) as month_name,
# quarter_number
quarter(FROM_UNIXTIME(created_at)) as Quarter_number,
# year_month convertion
concat(year(from_unixtime(created_at))," - ",monthname(FROM_UNIXTIME(created_at))) as year__month,
# week_day_status
dayofweek(FROM_UNIXTIME(created_at)) as weekday_status,
# day_name
dayname(FROM_UNIXTIME(created_at)) as day_name,
-- fisical_quarter
if(quarter((FROM_UNIXTIME(created_at)))=quarter((FROM_UNIXTIME(created_at))),concat("fiscal_quater", "-",quarter((FROM_UNIXTIME(created_at))))," ") as fisical_queater,
-- fisical_month
if(month((FROM_UNIXTIME(created_at)))=month((FROM_UNIXTIME(created_at))),concat("fiscal_month", "-",month((FROM_UNIXTIME(created_at))))," ") as fisical_month
from projects
order by dates asc;

-- 4. Convert the Goal amount into USD using the Static USD Rate.

select  projectid, goal,static_usd_rate ,goal * static_usd_rate as goal_convert_into_static_usd_amount from projects;

-- 5. Projects Overview KPI :
select * from projects;
 
 # Total Number of Projects based on outcome 
 select count(projectid) as total_number_projects from projects;
 
# Total Number of Projects based on Locations
select count(location_id) as total_number_on_location from projects;

#  Total Number of Projects based on  Category
select count(distinct category_id) as total_number_on_category from projects;

# Total Number of Projects created by Year , Quarter , Month

-- total projects by year
select year(FROM_UNIXTIME(created_at))as year,
count(projectid) as total_number_projects from projects
group by year
order by year asc;
 
 -- total projects by month
select month(FROM_UNIXTIME(created_at))as month,
count(projectid) as total_number_projects from projects
group by month
order by month asc;

 -- total projects by quarter
select Quarter(FROM_UNIXTIME(created_at))as Quarter,
count(projectid) as total_number_projects from projects
 group by quarter
 order by quarter;
 
-- 6.  Successful Projects
select * from projects;
select distinct state from projects;

select concat(round(count(backers_count),2)," k") from projects;

# Amount Raised 
select state , concat("$"," ",round(sum(goal * static_usd_rate)/1000000000,2)," M") as successful_total_amount_raised from projects
where state="successful";

# Number of Backers
-- total backers count
select count(backers_count) as total_backers from projects;

-- total backers count by successful projects
select state,count(backers_count) as total_backers_count_by_successful from projects
where state="successful";

# Avg NUmber of Days for successful projects

select round(avg(datediff( date(from_unixtime(deadline)),date(from_unixtime(created_at)))),0) as average_day_of_during_project from projects;

-- 7 . Top Successful Projects :

select id, state, crowdfunding_category.name
from projects
left join crowdfunding_category 
on projects.category_id = crowdfunding_category.id
where state='successful';

# Based on Number of Backers

select count(backers_count) as successful_projects_based_on_number_of_backers from projects
where state="successful";
-- but state is not display in result set

# Based on Amount Raised.

select
concat(round(sum(goal * static_usd_rate)/1000000000,2)," M") as successful_projects_Based_on_Amount_Raised
from projects
where state="successful";
-- but state is not display in result set

# Percentage of Successful Projects overall
select state ,
concat(round((sum(goal * static_usd_rate)/
(select sum(goal * static_usd_rate) from projects)),2)*100 ," %")as
percentage_of_successful_projects_overall from projects
group by state;
-- use sub quarie, concat,round and sum functions

# Percentage of Successful Projects  by Category

select 
crowdfunding_category.name as category , 
count(state) as successful_projects_based_on_category
from crowdfunding_category
left join projects
on crowdfunding_category.id=projects.category_id
where state="successful"
group by category;


# Percentage of Successful Projects by Year , Month etc..

-- Percentage of Successful Projects by Year 

select year(FROM_UNIXTIME(created_at))as year,
concat(round(count(case
when state="successful"
then 1
end)/ count(projectid)*100,2)," %") as "success_percentage"
from projects
group by year
order by year asc;
 
-- Percentage of Successful Projects by Month
 
select month(FROM_UNIXTIME(created_at))as month,
concat(round(count(case
when state="successful"
then 1
end)/ count(projectid)*100,2)," %") as "success_percentage"
from projects
group by month
order by month asc;


# Percentage of Successful projects by Goal Range ( decide the range as per your need )
select state, sum(goal * static_usd_rate) as goal,
case
when ( sum(goal * static_usd_rate)<0 and sum(goal * static_usd_rate)<1000) then "0 - 1000"
when (sum(goal *static_usd_rate)<1001 and sum(goal * static_usd_rate)<2000) then "1001 - 2000"
when (sum(goal *static_usd_rate) < 2001 and sum(goal * static_usd_rate)<3000) then "2001 - 3000"
when (sum(goal * static_usd_rate) < 3001 and sum(goal * static_usd_rate)<4000) then "3001 - 4000"
when (sum(goal * static_usd_rate) < 2001 and sum(goal * static_usd_rate)<3000) then "4001 - 5000"
else "above 5000"
end as goal_range from projects
group by state;


