create schema cars;
use cars;
-- READ DATA --
select *from car_dekho

-- EXPLORATORY DATA ANALAYSIS --

-- 1.What is the average selling price of cars?
select AVG(selling_price) as average_price from car_dekho;
#Answer - 651614.1386

-- 2. How many unique car models are present in data?
select count(distinct(name)) as unique_cars from car_dekho;
#Answer - 1981

-- 3. What is the distribution of cars by fuel type?
select fuel, count(*) as car_count
from car_dekho
group by fuel;

/*Petrol	3534
Diesel	4304
Electric	1
CNG	53
LPG	35*/

-- 4. How many cars are sold by each seller type?
select seller_type, count(*) as car_count
from car_dekho
group by seller_type

/*
Individual	6578
Dealer	1113
Trustmark Dealer	236*/

-- 5. Which transmission type is the most common among the cars?
select transmission, count(*) 
from car_dekho
group by transmission
order by transmission desc
limit 1;
#Answer -  Manual	6866

-- BASIC ANALYSIS --
-- 1. Identify trends in car prices over the years.
select year, avg(selling_price) as average_price
from car_dekho
group by year
order by year

#Answer
/*
1994	72000.0000
1995	55000.0000
1996	41000.0000
1997	86111.0000
1998	57888.8889
1999	76928.5714
2000	76682.1250
2001	46500.0000
2002	103789.4211
2003	101572.9189
2004	109408.9216
2005	143756.5658
2006	170462.2353
2007	179106.5491
2008	205559.7811
2009	228809.4762
2010	274010.6320
2011	322096.4491
2012	353143.2802
2013	460664.6213
2014	516675.7419
2015	596770.2697
2016	700317.7243
2017	890193.0376
2018	958183.5980
2019	1776986.2504
2020	885270.2297
2021	1208857.1429
2022	1143000.0000
2023	1895833.3333*/

-- 2. Segment the data based on car features (e.g., fuel type, transmission type) and analyze each segment's average selling price.
select fuel, transmission, avg(selling_price) as avg_price from car_dekho
group by fuel, transmission

#Answer
/* 
Petrol	 Manual	661545.4545
Diesel	 Automatic	3341666.6667
Electric	 Automatic	2650000.0000
Petrol	 Automatic	1904000.0000
Diesel	 Manual	1087000.0000
Diesel	Automatic	2545533.8214
Petrol	Manual	351322.3261
Diesel	Manual	556280.7996
Petrol	Automatic	1190471.4951
CNG	Manual	313415.0377
LPG	Manual	210885.7143*/

-- 3. Determine the average selling price of cars based on the number of seats they have.
select seats, avg(selling_price) as avg_price
from car_dekho
group by seats
order by seats desc;
#Answer 
/* 
14	235000.0000
10	344105.1053
9	500074.9375
8	583711.8263
7	812923.1848
6	581596.7742
5	632473.1634
4	486764.6617
2	700500.0000 */

-- MARKET TREND ANALYSIS
-- Given the dataset spanning multiple years, analyze the trend in the distribution of car sales by fuel type over the past five years. Identify any significant shifts in consumer preferences and provide insights into potential market trends for future business planning.
select year, fuel, count(*) as car_count
from car_dekho
where year >= extract(year from current_date())-5
group by year, fuel
order by year, fuel;
#Answer - 
/* 
2021	Petrol	5
2022	Diesel	2
2022	Petrol	5
2023	Diesel	1
2023	Electric	1
2023	Petrol	4
*/