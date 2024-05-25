DROP VIEW IF EXISTS recipe_meal_type_pairs;
DROP VIEW IF EXISTS top_3_meal_type_pairs;

CREATE VIEW recipe_meal_type_pairs AS
SELECT 
    r1.mealTypeName AS mealType1,
    r2.mealTypeName AS mealType2
FROM 
    recipes_mealTypes r1
JOIN 
    recipes_mealTypes r2 ON r1.recipeName = r2.recipeName AND r1.mealTypeName < r2.mealTypeName
WHERE
    r1.recipeName IN (SELECT recipeName FROM episode_recipes);


CREATE VIEW top_3_meal_type_pairs AS
SELECT 
    mealType1, 
    mealType2, 
    COUNT(*) AS count
FROM 
    recipe_meal_type_pairs
GROUP BY 
    mealType1, mealType2
ORDER BY 
    count DESC
LIMIT 3;

SELECT * FROM top_3_meal_type_pairs;


DROP VIEW IF EXISTS recipe_meal_type_pairs;
DROP VIEW IF EXISTS top_3_meal_type_pairs;