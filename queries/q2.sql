-- national_cuisine <- x
-- year <- y

SELECT 
    chefs.firstName, chefs.lastName
FROM 
    chefs_nationalCuisines
JOIN 
    chefs ON chefs_nationalCuisines.chefId = chefs.id
WHERE 
    chefs_nationalCuisines.nationalCuisineName = x


SELECT DISTINCT 
    chefs.firstName, chefs.lastName
FROM 
    episode_recipes
JOIN 
    chefs ON chefs.id = episode_recipes.chefAssignedToRecipeId
WHERE 
    episode_recipes.episodeYear = y AND episode_recipes.recipeNationalCuisine = x
