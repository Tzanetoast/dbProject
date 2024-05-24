CREATE VIEW view_1 AS
SELECT 
    episode_recipes.recipeName,
    episode_recipes.recipeNationalCuisine,
    episode_recipes.chefAssignedToRecipeId,
    recipe_score.score
FROM 
    recipe_score 
JOIN 
    episode_recipes ON recipe_score.episodeYear = episode_recipes.episodeYear 
                    AND recipe_score.episodeNumber = episode_recipes.episodeNumber 
                    AND recipe_score.recipeNumber = episode_recipes.recipeNumber;


CREATE VIEW view_2 AS
SELECT 
    view_1.recipeName,
    view_1.recipeNationalCuisine,
    chefs.firstName,
    chefs.lastName,
    view_1.score
FROM 
    view_1
JOIN 
    chefs ON id = view_1.chefAssignedToRecipeId;


SELECT 
    firstName || ' ' || lastName AS chefName,
    recipeNationalCuisine,
    AVG(score) AS averageScore
FROM 
    view_2
GROUP BY 
    chefName, recipeNationalCuisine
ORDER BY 
    chefName, recipeNationalCuisine;

DROP VIEW view_1;
DROP VIEW view_2;