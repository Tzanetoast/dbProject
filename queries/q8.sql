SELECT 
    episodeYear,
    episodeNumber,
    COUNT(*) AS number_of_tools_in_that_episode
FROM (
    SELECT 
        episode_recipes.episodeYear,
        episode_recipes.episodeNumber
    FROM 
        episode_recipes
    JOIN 
        recipes_tools ON recipes_tools.recipeName = episode_recipes.recipeName
)
GROUP BY 
    episodeYear, 
    episodeNumber
ORDER BY 
    number_of_tools_in_that_episode DESC
LIMIT 1;


-- etoimo