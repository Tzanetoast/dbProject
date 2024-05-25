SELECT 
    episode_recipes.episodeYear,
    AVG(recipes.carbohydratesPerPortion) AS avg_carbohydrates
FROM 
    episode_recipes
JOIN 
    recipes ON episode_recipes.recipeName = recipes.name
GROUP BY 
    episode_recipes.episodeYear
ORDER BY 
    episode_recipes.episodeYear;


-- etoimo