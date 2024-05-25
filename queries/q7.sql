SELECT chefAssignedToRecipeId, COUNT(*) AS episode_count
FROM episode_recipes
GROUP BY chefAssignedToRecipeId
HAVING COUNT(*) <= (
    SELECT MAX(episode_count) - 5
    FROM (
        SELECT chefAssignedToRecipeId, COUNT(*) AS episode_count
        FROM episode_recipes
        GROUP BY chefAssignedToRecipeId
    ) AS chef_participations
);

