CREATE TRIGGER set_categoryBasedOnBasicIngredient_after_insert
AFTER INSERT ON recipes
FOR EACH ROW
BEGIN
    UPDATE recipes
    SET categoryBasedOnBasicIngredient = (
        CASE 
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Fish and Products' THEN 'Seafood'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Various Plant-Based Foods' THEN 'Vegeterian'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Preserved Foods' THEN 'Category for recipes whos basic ingredient belongs in the food group Preserved Foods'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Meat and Products' THEN 'Category for recipes whos basic ingredient belongs in the food group Meat and Products'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Dairy, Eggs, and Products' THEN 'Category for recipes whos basic ingredient belongs in the food group Dairy, Eggs, and Products'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Coffee, Tea, and Related Products' THEN 'Category for recipes whos basic ingredient belongs in the food group Coffee, Tea, and Related Products'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Cereals and Products' THEN 'Category for recipes whos basic ingredient belongs in the food group Cereals and Products'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Fats and Oils' THEN 'Category for recipes whos basic ingredient belongs in the food group Fats and Oils'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Spices and Essential Oils' THEN 'Category for recipes whos basic ingredient belongs in the food group Spices and Essential Oils'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Sweeteners' THEN 'Category for recipes whos basic ingredient belongs in the food group Sweeteners'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Various Beverages' THEN 'Category for recipes whos basic ingredient belongs in the food group Various Beverages'
            ELSE '!!!  there is something wrong with the basicIngredient of this recipe'
        END
    )
    WHERE name = NEW.name;
END;

CREATE TRIGGER set_categoryBasedOnBasicIngredient_after_update
AFTER UPDATE ON recipes
FOR EACH ROW
BEGIN
    UPDATE recipes
    SET categoryBasedOnBasicIngredient = (
        CASE 
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Fish and Products' THEN 'Seafood'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Various Plant-Based Foods' THEN 'Vegeterian'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Preserved Foods' THEN 'Category for recipes whos basic ingredient belongs in the food group Preserved Foods'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Meat and Products' THEN 'Category for recipes whos basic ingredient belongs in the food group Meat and Products'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Dairy, Eggs, and Products' THEN 'Category for recipes whos basic ingredient belongs in the food group Dairy, Eggs, and Products'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Coffee, Tea, and Related Products' THEN 'Category for recipes whos basic ingredient belongs in the food group Coffee, Tea, and Related Products'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Cereals and Products' THEN 'Category for recipes whos basic ingredient belongs in the food group Cereals and Products'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Fats and Oils' THEN 'Category for recipes whos basic ingredient belongs in the food group Fats and Oils'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Spices and Essential Oils' THEN 'Category for recipes whos basic ingredient belongs in the food group Spices and Essential Oils'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Sweeteners' THEN 'Category for recipes whos basic ingredient belongs in the food group Sweeteners'
            WHEN (SELECT foodGroup FROM ingredients WHERE name = NEW.basicIngredient) = 'Various Beverages' THEN 'Category for recipes whos basic ingredient belongs in the food group Various Beverages'
            ELSE '!!!  there is something wrong with the basicIngredient of this recipe'
        END
    )
    WHERE name = NEW.name;
END;

    
CREATE TRIGGER set_nutritional_information_per_portion_after_insert
AFTER INSERT ON recipes
FOR EACH ROW
BEGIN
    UPDATE recipes
    SET caloriesPerPortion = (
            SELECT SUM(table_1.quantity * ingredients.caloriesPerUnitOfMeasure)
            FROM (
                SELECT *
                FROM recipes_ingredients
                WHERE recipeName = NEW.name
            ) AS table_1
            INNER JOIN ingredients ON table_1.ingredientName = ingredients.name
        ) / NEW.portions,
        proteinsPerPortion = (
            SELECT SUM(table_1.quantity * ingredients.proteinsPerUnitOfMeasure)
            FROM (
                SELECT *
                FROM recipes_ingredients
                WHERE recipeName = NEW.name
            ) AS table_1
            INNER JOIN ingredients ON table_1.ingredientName = ingredients.name
        ) / NEW.portions,
        carbohydratesPerPortion = (
            SELECT SUM(table_1.quantity * ingredients.carbohydratesPerUnitOfMeasure)
            FROM (
                SELECT *
                FROM recipes_ingredients
                WHERE recipeName = NEW.name
            ) AS table_1
            INNER JOIN ingredients ON table_1.ingredientName = ingredients.name
        ) / NEW.portions,
        fatsPerPortion = (
            SELECT SUM(table_1.quantity * ingredients.fatsPerUnitOfMeasure)
            FROM (
                SELECT *
                FROM recipes_ingredients
                WHERE recipeName = NEW.name
            ) AS table_1
            INNER JOIN ingredients ON table_1.ingredientName = ingredients.name
        ) / NEW.portions,
        sugarsPerPortion = (
            SELECT SUM(table_1.quantity * ingredients.sugarsPerUnitOfMeasure)
            FROM (
                SELECT *
                FROM recipes_ingredients
                WHERE recipeName = NEW.name
            ) AS table_1
            INNER JOIN ingredients ON table_1.ingredientName = ingredients.name
        ) / NEW.portions
    WHERE name = NEW.name;
END;


CREATE TRIGGER set_nutritional_information_per_portion_after_update
AFTER UPDATE ON recipes
FOR EACH ROW
BEGIN
    UPDATE recipes
    SET caloriesPerPortion = (
            SELECT SUM(table_1.quantity * ingredients.caloriesPerUnitOfMeasure)
            FROM (
                SELECT *
                FROM recipes_ingredients
                WHERE recipeName = NEW.name
            ) AS table_1
            INNER JOIN ingredients ON table_1.ingredientName = ingredients.name
        ) / NEW.portions,
        proteinsPerPortion = (
            SELECT SUM(table_1.quantity * ingredients.proteinsPerUnitOfMeasure)
            FROM (
                SELECT *
                FROM recipes_ingredients
                WHERE recipeName = NEW.name
            ) AS table_1
            INNER JOIN ingredients ON table_1.ingredientName = ingredients.name
        ) / NEW.portions,
        carbohydratesPerPortion = (
            SELECT SUM(table_1.quantity * ingredients.carbohydratesPerUnitOfMeasure)
            FROM (
                SELECT *
                FROM recipes_ingredients
                WHERE recipeName = NEW.name
            ) AS table_1
            INNER JOIN ingredients ON table_1.ingredientName = ingredients.name
        ) / NEW.portions,
        fatsPerPortion = (
            SELECT SUM(table_1.quantity * ingredients.fatsPerUnitOfMeasure)
            FROM (
                SELECT *
                FROM recipes_ingredients
                WHERE recipeName = NEW.name
            ) AS table_1
            INNER JOIN ingredients ON table_1.ingredientName = ingredients.name
        ) / NEW.portions,
        sugarsPerPortion = (
            SELECT SUM(table_1.quantity * ingredients.sugarsPerUnitOfMeasure)
            FROM (
                SELECT *
                FROM recipes_ingredients
                WHERE recipeName = NEW.name
            ) AS table_1
            INNER JOIN ingredients ON table_1.ingredientName = ingredients.name
        ) / NEW.portions
    WHERE name = NEW.name;
END;


CREATE TRIGGER limit_recipe_usageTips
BEFORE INSERT ON recipes_usageTips
FOR EACH ROW
BEGIN
    -- Check the count of the recipeName in recipes_usageTips
    SELECT CASE
        WHEN (SELECT COUNT(*) FROM recipes_usageTips WHERE recipeName = NEW.recipeName) >= 3
        THEN
            RAISE(ABORT, 'Recipe limit reached')
    END;
END;



CREATE TRIGGER set_nutritional_information_per_portion_after_insert_recipes_ingredients
AFTER INSERT ON recipes_ingredients
FOR EACH ROW
BEGIN
    UPDATE recipes
    SET 
        caloriesPerPortion = (
            SELECT SUM(ri.quantity * ing.caloriesPerUnitOfMeasure)
            FROM recipes_ingredients ri
            INNER JOIN ingredients ing ON ri.ingredientName = ing.name
            WHERE ri.recipeName = NEW.recipeName
        ) / portions,
        proteinsPerPortion = (
            SELECT SUM(ri.quantity * ing.proteinsPerUnitOfMeasure)
            FROM recipes_ingredients ri
            INNER JOIN ingredients ing ON ri.ingredientName = ing.name
            WHERE ri.recipeName = NEW.recipeName
        ) / portions,
        carbohydratesPerPortion = (
            SELECT SUM(ri.quantity * ing.carbohydratesPerUnitOfMeasure)
            FROM recipes_ingredients ri
            INNER JOIN ingredients ing ON ri.ingredientName = ing.name
            WHERE ri.recipeName = NEW.recipeName
        ) / portions,
        fatsPerPortion = (
            SELECT SUM(ri.quantity * ing.fatsPerUnitOfMeasure)
            FROM recipes_ingredients ri
            INNER JOIN ingredients ing ON ri.ingredientName = ing.name
            WHERE ri.recipeName = NEW.recipeName
        ) / portions,
        sugarsPerPortion = (
            SELECT SUM(ri.quantity * ing.sugarsPerUnitOfMeasure)
            FROM recipes_ingredients ri
            INNER JOIN ingredients ing ON ri.ingredientName = ing.name
            WHERE ri.recipeName = NEW.recipeName
        ) / portions
    WHERE name = NEW.recipeName;
END;


CREATE TRIGGER set_nutritional_information_per_portion_after_update_recipes_ingredients
AFTER UPDATE ON recipes_ingredients
FOR EACH ROW
BEGIN
    UPDATE recipes
    SET 
        caloriesPerPortion = (
            SELECT SUM(ri.quantity * ing.caloriesPerUnitOfMeasure)
            FROM recipes_ingredients ri
            INNER JOIN ingredients ing ON ri.ingredientName = ing.name
            WHERE ri.recipeName = NEW.recipeName
        ) / portions,
        proteinsPerPortion = (
            SELECT SUM(ri.quantity * ing.proteinsPerUnitOfMeasure)
            FROM recipes_ingredients ri
            INNER JOIN ingredients ing ON ri.ingredientName = ing.name
            WHERE ri.recipeName = NEW.recipeName
        ) / portions,
        carbohydratesPerPortion = (
            SELECT SUM(ri.quantity * ing.carbohydratesPerUnitOfMeasure)
            FROM recipes_ingredients ri
            INNER JOIN ingredients ing ON ri.ingredientName = ing.name
            WHERE ri.recipeName = NEW.recipeName
        ) / portions,
        fatsPerPortion = (
            SELECT SUM(ri.quantity * ing.fatsPerUnitOfMeasure)
            FROM recipes_ingredients ri
            INNER JOIN ingredients ing ON ri.ingredientName = ing.name
            WHERE ri.recipeName = NEW.recipeName
        ) / portions,
        sugarsPerPortion = (
            SELECT SUM(ri.quantity * ing.sugarsPerUnitOfMeasure)
            FROM recipes_ingredients ri
            INNER JOIN ingredients ing ON ri.ingredientName = ing.name
            WHERE ri.recipeName = NEW.recipeName
        ) / portions
    WHERE name = NEW.recipeName;
END;

CREATE TRIGGER set_nutritional_information_per_portion_after_delete_recipes_ingredients
AFTER DELETE ON recipes_ingredients
FOR EACH ROW
BEGIN
    UPDATE recipes
    SET 
        caloriesPerPortion = (
            SELECT SUM(ri.quantity * ing.caloriesPerUnitOfMeasure)
            FROM recipes_ingredients ri
            INNER JOIN ingredients ing ON ri.ingredientName = ing.name
            WHERE ri.recipeName = OLD.recipeName
        ) / portions,
        proteinsPerPortion = (
            SELECT SUM(ri.quantity * ing.proteinsPerUnitOfMeasure)
            FROM recipes_ingredients ri
            INNER JOIN ingredients ing ON ri.ingredientName = ing.name
            WHERE ri.recipeName = OLD.recipeName
        ) / portions,
        carbohydratesPerPortion = (
            SELECT SUM(ri.quantity * ing.carbohydratesPerUnitOfMeasure)
            FROM recipes_ingredients ri
            INNER JOIN ingredients ing ON ri.ingredientName = ing.name
            WHERE ri.recipeName = OLD.recipeName
        ) / portions,
        fatsPerPortion = (
            SELECT SUM(ri.quantity * ing.fatsPerUnitOfMeasure)
            FROM recipes_ingredients ri
            INNER JOIN ingredients ing ON ri.ingredientName = ing.name
            WHERE ri.recipeName = OLD.recipeName
        ) / portions,
        sugarsPerPortion = (
            SELECT SUM(ri.quantity * ing.sugarsPerUnitOfMeasure)
            FROM recipes_ingredients ri
            INNER JOIN ingredients ing ON ri.ingredientName = ing.name
            WHERE ri.recipeName = OLD.recipeName
        ) / portions
    WHERE name = OLD.recipeName;
END;




CREATE TRIGGER check_nationalCuisine_consecutive_episodes
BEFORE INSERT ON episode_recipes
FOR EACH ROW
BEGIN
    -- Check for three consecutive episodes involving NEW.episodeNumber
    SELECT CASE
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes
             WHERE recipeNationalCuisine = NEW.recipeNationalCuisine
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber - 2 AND NEW.episodeNumber - 1) >= 2
        ) THEN
            RAISE(ABORT, 'National cuisine cannot appear in more than three consecutive episodes')
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes
             WHERE recipeNationalCuisine = NEW.recipeNationalCuisine
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber - 1 AND NEW.episodeNumber + 1) >= 2
        ) THEN
            RAISE(ABORT, 'National cuisine cannot appear in more than three consecutive episodes')
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes
             WHERE recipeNationalCuisine = NEW.recipeNationalCuisine
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber AND NEW.episodeNumber + 2) >= 2
        ) THEN
            RAISE(ABORT, 'National cuisine cannot appear in more than three consecutive episodes')
    END;
END;

CREATE TRIGGER check_nationalCuisine_consecutive_episodes_update
BEFORE UPDATE ON episode_recipes
FOR EACH ROW
BEGIN
    -- Check for three consecutive episodes involving NEW.episodeNumber
    SELECT CASE
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes
             WHERE recipeNationalCuisine = NEW.recipeNationalCuisine
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber - 2 AND NEW.episodeNumber - 1) >= 2
        ) THEN
            RAISE(ABORT, 'National cuisine cannot appear in more than three consecutive episodes')
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes
             WHERE recipeNationalCuisine = NEW.recipeNationalCuisine
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber - 1 AND NEW.episodeNumber + 1) >= 2
        ) THEN
            RAISE(ABORT, 'National cuisine cannot appear in more than three consecutive episodes')
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes
             WHERE recipeNationalCuisine = NEW.recipeNationalCuisine
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber AND NEW.episodeNumber + 2) >= 2
        ) THEN
            RAISE(ABORT, 'National cuisine cannot appear in more than three consecutive episodes')
    END;
END;

CREATE TRIGGER check_judge_consecutive_episodes
BEFORE INSERT ON episode_judges
FOR EACH ROW
BEGIN
    -- Check for three consecutive episodes involving NEW.episodeNumber
    SELECT CASE
        WHEN (
            (SELECT COUNT(*) FROM episode_judges 
             WHERE chefId = NEW.chefId
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber - 2 AND NEW.episodeNumber - 1) >= 2
        ) THEN
            RAISE(ABORT, 'Judge cannot appear in more than three consecutive episodes')
        WHEN (
            (SELECT COUNT(*) FROM episode_judges 
             WHERE chefId = NEW.chefId
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber - 1 AND NEW.episodeNumber + 1) >= 2
        ) THEN
            RAISE(ABORT, 'Judge cannot appear in more than three consecutive episodes')
        WHEN (
            (SELECT COUNT(*) FROM episode_judges 
             WHERE chefId = NEW.chefId
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber AND NEW.episodeNumber + 2) >= 2
        ) THEN
            RAISE(ABORT, 'Judge cannot appear in more than three consecutive episodes')
    END;
END;

CREATE TRIGGER check_judge_consecutive_episodes_update
BEFORE UPDATE ON episode_judges
FOR EACH ROW
BEGIN
    -- Check for three consecutive episodes involving NEW.episodeNumber
    SELECT CASE
        WHEN (
            (SELECT COUNT(*) FROM episode_judges 
             WHERE chefId = NEW.chefId
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber - 2 AND NEW.episodeNumber - 1) >= 2
        ) THEN
            RAISE(ABORT, 'Judge cannot appear in more than three consecutive episodes')
        WHEN (
            (SELECT COUNT(*) FROM episode_judges 
             WHERE chefId = NEW.chefId
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber - 1 AND NEW.episodeNumber + 1) >= 2
        ) THEN
            RAISE(ABORT, 'Judge cannot appear in more than three consecutive episodes')
        WHEN (
            (SELECT COUNT(*) FROM episode_judges 
             WHERE chefId = NEW.chefId
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber AND NEW.episodeNumber + 2) >= 2
        ) THEN
            RAISE(ABORT, 'Judge cannot appear in more than three consecutive episodes')
    END;
END;


CREATE TRIGGER check_chef_consecutive_episodes_insert
BEFORE INSERT ON episode_recipes
FOR EACH ROW
BEGIN
    -- Check for three consecutive episodes involving NEW.episodeNumber
    SELECT CASE
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes
             WHERE chefAssignedToRecipeId = NEW.chefAssignedToRecipeId
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber - 2 AND NEW.episodeNumber - 1) >= 2
        ) THEN
            RAISE(ABORT, 'Chef cannot appear in more than three consecutive episodes')
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes
             WHERE chefAssignedToRecipeId = NEW.chefAssignedToRecipeId
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber - 1 AND NEW.episodeNumber + 1) >= 2
        ) THEN
            RAISE(ABORT, 'Chef cannot appear in more than three consecutive episodes')
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes
             WHERE chefAssignedToRecipeId = NEW.chefAssignedToRecipeId
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber AND NEW.episodeNumber + 2) >= 2
        ) THEN
            RAISE(ABORT, 'Chef cannot appear in more than three consecutive episodes')
    END;
END;


CREATE TRIGGER check_chef_consecutive_episodes_update
BEFORE UPDATE ON episode_recipes
FOR EACH ROW
BEGIN
    -- Check for three consecutive episodes involving NEW.episodeNumber
    SELECT CASE
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes
             WHERE chefAssignedToRecipeId = NEW.chefAssignedToRecipeId
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber - 2 AND NEW.episodeNumber - 1) >= 2
        ) THEN
            RAISE(ABORT, 'Chef cannot appear in more than three consecutive episodes')
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes
             WHERE chefAssignedToRecipeId = NEW.chefAssignedToRecipeId
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber - 1 AND NEW.episodeNumber + 1) >= 2
        ) THEN
            RAISE(ABORT, 'Chef cannot appear in more than three consecutive episodes')
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes
             WHERE chefAssignedToRecipeId = NEW.chefAssignedToRecipeId
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber AND NEW.episodeNumber + 2) >= 2
        ) THEN
            RAISE(ABORT, 'Chef cannot appear in more than three consecutive episodes')
    END;
END;


CREATE TRIGGER check_recipe_consecutive_episodes_insert
BEFORE INSERT ON episode_recipes
FOR EACH ROW
BEGIN
    -- Check for three consecutive episodes involving NEW.episodeNumber
    SELECT CASE
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes 
             WHERE recipeName = NEW.recipeName
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber - 2 AND NEW.episodeNumber - 1) >= 2
        ) THEN
            RAISE(ABORT, 'Recipe cannot appear in more than three consecutive episodes')
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes 
             WHERE recipeName = NEW.recipeName
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber - 1 AND NEW.episodeNumber + 1) >= 2
        ) THEN
            RAISE(ABORT, 'Recipe cannot appear in more than three consecutive episodes')
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes 
             WHERE recipeName = NEW.recipeName
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber AND NEW.episodeNumber + 2) >= 2
        ) THEN
            RAISE(ABORT, 'Recipe cannot appear in more than three consecutive episodes')
    END;
END;



CREATE TRIGGER check_recipe_consecutive_episodes_update
BEFORE UPDATE ON episode_recipes
FOR EACH ROW
BEGIN
    -- Check for three consecutive episodes involving NEW.episodeNumber
    SELECT CASE
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes 
             WHERE recipeName = NEW.recipeName
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber - 2 AND NEW.episodeNumber - 1) >= 2
        ) THEN
            RAISE(ABORT, 'Recipe cannot appear in more than three consecutive episodes')
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes 
             WHERE recipeName = NEW.recipeName
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber - 1 AND NEW.episodeNumber + 1) >= 2
        ) THEN
            RAISE(ABORT, 'Recipe cannot appear in more than three consecutive episodes')
        WHEN (
            (SELECT COUNT(*) FROM episode_recipes 
             WHERE recipeName = NEW.recipeName
             AND episodeYear = NEW.episodeYear
             AND episodeNumber BETWEEN NEW.episodeNumber AND NEW.episodeNumber + 2) >= 2
        ) THEN
            RAISE(ABORT, 'Recipe cannot appear in more than three consecutive episodes')
    END;
END;

CREATE TRIGGER check_recipe_does_not_have_a_chef_that_is_a_judge_insert
BEFORE INSERT ON episode_recipes
FOR EACH ROW
BEGIN
    -- Check if the chef assigned to the recipe is also a judge in the same episode
    SELECT CASE
        WHEN (
            SELECT COUNT(*)
            FROM episode_judges
            WHERE episodeYear = NEW.episodeYear
            AND episodeNumber = NEW.episodeNumber
            AND chefId = NEW.chefAssignedToRecipeId
        ) > 0 THEN
            RAISE(ABORT, 'episode recipe cannot have a chef that is a judge')
    END;
END;

CREATE TRIGGER check_recipe_does_not_have_a_chef_that_is_a_judge_update
BEFORE UPDATE ON episode_recipes
FOR EACH ROW
BEGIN
    -- Check if the chef assigned to the recipe is also a judge in the same episode
    SELECT CASE
        WHEN (
            SELECT COUNT(*)
            FROM episode_judges
            WHERE episodeYear = NEW.episodeYear
            AND episodeNumber = NEW.episodeNumber
            AND chefId = NEW.chefAssignedToRecipeId
        ) > 0 THEN
            RAISE(ABORT, 'episode recipe cannot have a chef that is a judge')
    END;
END;