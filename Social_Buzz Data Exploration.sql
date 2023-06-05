--joining tables using inner join

select r.Content_ID, r.Type, r.Datetime ,c.Content_Type, c.Category, rt.Sentiment, rt.Score
from Reactions r
join Content c
on r.Content_ID = c.Content_ID
join Reaction_Types rt
on r.Type = rt.Type

--create a temp table

drop table if exists #React
select r.Content_ID, r.Type, r.Datetime ,c.Content_Type, c.Category, rt.Sentiment, rt.Score
into #React
from Reactions r
join Content c
on r.Content_ID = c.Content_ID
join Reaction_Types rt
on r.Type = rt.Type

select * from #React

-- total sum Score per category

select Category, sum(Score) as Top_Score 
from #React
group by Category


-- Top 5 Scores per Category

select TOP 5 Category, sum(Score) as Top_Score 
from #React
group by Category
order by Top_Score desc


-- Month with the highest post

select top 1 Datepart(Month, Datetime) as Month, Count(*) as Count_React
from #React
group by Datepart(Month, Datetime)
order by Count_React desc

-- total count Content_Type per category

select Category, Content_Type,  Count(Content_Type) as Total_Count_Content_Type
from #React
group by Category, Content_Type
order by Category asc

