CREATE VIEW national_cuisine_participations AS
SELECT 
    episode_recipes.recipeNationalCuisine,
    episode_recipes.episodeYear,
    COUNT(*) AS participation_count
FROM 
    episode_recipes
GROUP BY 
    episode_recipes.recipeNationalCuisine, 
    episode_recipes.episodeYear
HAVING 
    COUNT(*) >= 3;

CREATE VIEW national_cuisine_consecutive_years AS
SELECT 
    t1.recipeNationalCuisine,
    t1.episodeYear AS year1,
    t1.participation_count AS count1,
    t2.episodeYear AS year2,
    t2.participation_count AS count2
FROM 
    national_cuisine_participations t1
JOIN 
    national_cuisine_participations t2 ON t1.recipeNationalCuisine = t2.recipeNationalCuisine
WHERE 
    t1.episodeYear + 1 = t2.episodeYear 
    AND t1.participation_count = t2.participation_count;

SELECT 
    recipeNationalCuisine, 
    year1, 
    count1, 
    year2, 
    count2
FROM 
    national_cuisine_consecutive_years;

DROP VIEW IF EXISTS national_cuisine_participations;
DROP VIEW IF EXISTS national_cuisine_consecutive_years;


-- ETOIMO