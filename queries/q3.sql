SELECT chefs.firstName, chefs.lastName, COUNT(chefs_recipes.chefId) AS recipeCount
FROM chefs
JOIN chefs_recipes ON chefs.id = chefs_recipes.chefId
WHERE (strftime('%Y', 'now') - strftime('%Y', chefs.dateOfBirth)) < 30
GROUP BY chefs.id
ORDER BY recipeCount DESC
