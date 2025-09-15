 Create Database Zomato

 -- 1. Create Restaurant Table
CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY,
    RestaurantName VARCHAR(100),
    Cuisine VARCHAR(50),
    Rating DECIMAL(3,2)
);

-- 2. Insert Sample Data
INSERT INTO Restaurants (RestaurantID, RestaurantName, Cuisine, Rating) VALUES
(1, 'Spice Villa', 'Indian', 4.8),
(2, 'Sushi World', 'Japanese', 4.2),
(3, 'Pizza Point', 'Italian', 3.5),
(4, 'Burger Hub', 'Fast Food', 2.8),
(5, 'Green Leaf', 'Salad', 3.9);

-- 3. Categorize Ratings into Excellent / Good / Average / Bad
ALTER TABLE Restaurants
ADD RatingCategory VARCHAR(20);

UPDATE Restaurants
SET RatingCategory = CASE
    WHEN Rating >= 4.5 THEN 'Excellent'
    WHEN Rating >= 4.0 THEN 'Good'
    WHEN Rating >= 3.0 THEN 'Average'
    ELSE 'Bad'
END;

-- 4. Query Top Rated Restaurants
SELECT RestaurantName, Cuisine, Rating, RatingCategory
FROM Restaurants
WHERE RatingCategory = 'Excellent'
ORDER BY Rating DESC;

-- 5. Example of SQL User-Defined Function for String Manipulation
-- Function to return first 3 characters of restaurant name
CREATE FUNCTION dbo.GetShortName(@RestName VARCHAR(100))
RETURNS VARCHAR(3)
AS
BEGIN
    RETURN LEFT(@RestName,3)
END;

-- 6. Test UDF
SELECT RestaurantName, dbo.GetShortName(RestaurantName) AS ShortName
FROM Restaurants;