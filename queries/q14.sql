CREATE VIEW appeared_food_groups AS
SELECT DISTINCT 
    ingredients.foodGroup
FROM 
    episode_recipes
JOIN 
    recipes_ingredients ON episode_recipes.recipeName = recipes_ingredients.recipeName
JOIN 
    ingredients ON recipes_ingredients.ingredientName = ingredients.name;


CREATE VIEW never_appeared_food_groups AS
SELECT 
    foodGroups.name AS foodGroup
FROM 
    foodGroups
LEFT JOIN 
    appeared_food_groups ON foodGroups.name = appeared_food_groups.foodGroup
WHERE 
    appeared_food_groups.foodGroup IS NULL;


DROP VIEW appeared_food_groups;
DROP VIEW never_appeared_food_groups;

-- etoimo