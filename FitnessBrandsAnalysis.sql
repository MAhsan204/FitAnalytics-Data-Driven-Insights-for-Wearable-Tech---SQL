USE Fitnessband_Products;

SELECT distinct(rating) FROM Fitness_trackers;

SELECT Brand_Name,Model_Name,Rating_Out_of_5 
FROM Fitness_trackers 
WHERE Rating_Out_of_5>=4.5 
order by Rating_Out_of_5 desc;

SELECT TOP 10 brand_name,model_name,selling_price,average_battery_life 
FROM Fitness_trackers
WHERE average_battery_life>10
order by Selling_Price;

SELECT distinct(device_type) FROM Fitness_trackers;

SELECT brand_name,COUNT(model_name) AS total_device,AVG(selling_price) AS avg_selling_price 
FROM Fitness_trackers
GROUP BY brand_name
HAVING AVG(selling_price)>3000;

SELECT brand_name,model_name,selling_price
FROM Fitness_trackers
WHERE selling_price>(SELECT AVG(selling_price) 
					 FROM Fitness_trackers);		

SELECT brand_name,model_name,rating
FROM Fitness_trackers
WHERE rating>(SELECT AVG(rating) 
			  FROM Fitness_trackers)
order by rating desc;

SELECT brand_name 
FROM Fitness_trackers
WHERE average_battery_life>(SELECT MAX(average_battery_life) 
							FROM Fitness_trackers
							WHERE Brand_Name = 'Garmin'
							group by Brand_Name);

SELECT device_type, COUNT(device_type) AS total_device, AVG(rating) AS avg_rating
FROM Fitness_trackers
GROUP BY device_type
order by AVG(rating) desc;

SELECT brand_name,model_name,selling_price 
FROM Fitness_trackers 
WHERE selling_price BETWEEN 1500 and 2500 
and color= 'Black';

SELECT brand_name,model_name,
CASE 
	WHEN rating BETWEEN 1 and 2.5 THEN 'Low'
	WHEN rating BETWEEN 2.5 and 4 THEN 'Medium'
	WHEN rating BETWEEN 4 and 5 THEN 'High'
	ELSE'Null'
END AS Category
FROM 
    Fitness_trackers;

SELECT display , COUNT(*) AS count_of_each_display
FROM Fitness_trackers
GROUP BY display;

SELECT FT.brand_name,FT.model_name,FTU.selling_price
FROM Fitness_trackers AS FT
INNER JOIN Fitness_trackers_updated AS FTU
ON FT.Model_Name=FTU.Model_Name;

SELECT *
FROM Fitness_trackers AS FT
LEFT JOIN Fitness_trackers_updated AS FTU
ON FT.Model_Name=FTU.Model_Name;

SELECT brand_name,rating
FROM Fitness_trackers
WHERE brand_name LIKE 's%' and rating>(SELECT AVG(rating) 
									 FROM Fitness_trackers 
									 WHERE brand_name = 'Fitbit');

SELECT brand_name, model_name, reviews
FROM Fitness_trackers
WHERE reviews IS NULL;

SELECT * 
FROM Fitness_trackers
WHERE rating IS NULL;
UPDATE Fitness_trackers
SET rating = 3.0
WHERE rating IS NULL;

SELECT brand_name, model_name, original_price
FROM Fitness_trackers
WHERE selling_price > (90*original_price/100);


SELECT brand_name,original_price-selling_price
FROM Fitness_trackers
order by original_price-selling_price desc; 

SELECT * FROM Fitness_trackers
order by selling_price
OFFSET 556 ROWS
FETCH NEXT 10 ROWS ONLY;

SELECT * 
FROM Fitness_trackers 
WHERE strap_material != 'Plastic' 
and average_battery_life<(SELECT AVG(average_battery_life) FROM Fitness_trackers);

SELECT TOP 1 brand_name,COUNT(brand_name)
FROM Fitness_trackers
GROUP BY brand_name
ORdER BY COUNT(brand_name)desc;

USE Fitnessband_Products;
SELECT brand_name,model_name,selling_price
FROM Fitness_trackers
WHERE device_type = 'Smartwatch' and rating >= 4.0 and selling_price>30000;

SELECT FT.selling_price, FTU.Selling_Price
FROM Fitness_trackers AS FT
INNER JOIN Fitness_trackers_updated AS FTU
ON FT.model_name=FTU.Model_Name
WHERE FT.selling_price<>FTU.selling_price;

SELECT *
FROM Fitness_trackers
WHERE average_battery_life>(SELECT AVG(average_battery_life) FROM Fitness_trackers);

SELECT TOP 1 strap_material, COUNT(strap_material)
FROM Fitness_trackers
GROUP BY strap_material
ORdER BY COUNT(strap_material) dESC;

SELECT distinct(color) 
FROM Fitness_trackers
WHERE brand_name = 'Fitbit';

SELECT TOP 1 brand_name,COUNT(brand_name)
FROM Fitness_trackers
WHERE display LIKE '%AMOLED%'
GROUP BY brand_name
ORdER BY COUNT(brand_name) dESC;

SELECT * 
FROM Fitness_trackers 
WHERE (selling_price>4000 OR rating<3.5) ANd color = 'Black';

SELECT distinct(selling_price) FROM Fitness_trackers
order by selling_price desc;

SELECT *,
CASE
	WHEN selling_price BETWEEN 0 ANd 41700 THEN 'Budget'
	WHEN selling_price BETWEEN 41701 ANd 83400 THEN 'Mid_Range'
	WHEN selling_price BETWEEN 83401 ANd 125100 THEN 'Budget'
END AS Category
FROM Fitness_trackers

SELECT * 
FROM Fitness_trackers AS FT
RIGHT JOIN Fitness_trackers_updated AS FTU
ON FT.model_name=FTU.Model_Name;

SELECT brand_name, average_battery_life, model_name
FROM Fitness_trackers
WHERE average_battery_life = (SELECT MAX(average_battery_life) FROM Fitness_trackers);

USE Fitnessband_Products;
SELECT brand_name, model_name
FROM Fitness_trackers
WHERE selling_price > original_price;


















