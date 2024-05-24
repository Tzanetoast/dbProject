DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS nationalCuisines;
DROP TABLE IF EXISTS mealTypes;
DROP TABLE IF EXISTS tools;
DROP TABLE IF EXISTS foodGroups;
-- DROP TABLE IF EXISTS chefs;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS recipes_mealTypes;
DROP TABLE IF EXISTS recipes_usageTips;
DROP TABLE IF EXISTS recipes_tools;
DROP TABLE IF EXISTS recipes_ingredients;
DROP TABLE IF EXISTS recipes_instructions;
-- DROP TABLE IF EXISTS chefs_nationalCuisines;
-- DROP TABLE IF EXISTS chefs_recipes;
-- DROP TABLE IF EXISTS credentials;
DROP TABLE IF EXISTS episodes;
DROP TABLE IF EXISTS episode_nationalCuisines;
DROP TABLE IF EXISTS episode_judges;
DROP TABLE IF EXISTS episode_chefs;
DROP TABLE IF EXISTS episode_recipes;
DROP TABLE IF EXISTS recipe_score;


CREATE TABLE ingredients (
    name VARCHAR(64),   
    foodGroup VARCHAR(64),  
    unitOfMeasure VARCHAR(64),  
    caloriesPerUnitOfMeasure INT,--kcal
    proteinsPerUnitOfMeasure INT,
    carbohydratesPerUnitOfMeasure INT, --grams
    fatsPerUnitOfMeasure INT,--grams
    sugarsPerUnitOfMeasure INT,--grams
    PRIMARY KEY (name)
);

CREATE TABLE nationalCuisines (
    name VARCHAR(64),
    description VARCHAR(256),
    PRIMARY KEY (name)
);

CREATE TABLE mealTypes(
    name VARCHAR(64),
    PRIMARY KEY (name)
);

CREATE TABLE tools (
    name VARCHAR(64),
    usage VARCHAR(256),
    PRIMARY KEY (name)
);

CREATE TABLE foodGroups (
    name VARCHAR(100),
    description VARCHAR(255),
    PRIMARY KEY (name)
);

-- CREATE TABLE chefs (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,   
--     firstName VARCHAR(32) NOT NULL,                
--     lastName VARCHAR(32) NOT NULL,                
--     contactNumber VARCHAR(32) NOT NULL,            
--     dateOfBirth DATE NOT NULL,            
--     age INTEGER,                  
--     dateOfExperienceStart DATE NOT NULL,
--     yearsOfExperience INTEGER,    
--     professionalGrade TEXT NOT NULL,       
--     CHECK (professionalGrade IN ('Third-Chef', 'Second-Chef', 'Third-Chef', 'Sous-Chef', 'Head-Chef')),
--     --CHECK (age > 0 OR age IS NULL)
--     CHECK (age > 0),
--     CHECK (yearsOfExperience > 0)
-- );

CREATE TABLE recipes (
    name VARCHAR(64) NOT NULL,
    cookingORpastry VARCHAR(7) NOT NULL CHECK (cookingORpastry IN ('cooking', 'pastry')),
    shortDescription TEXT,
    nationalCuisine VARCHAR(64) NOT NULL,  
    difficulty  SMALLINT CHECK (difficulty BETWEEN 1 AND 5), --dificulty of the dish
    prepTime INT, -- in minutes
    cookingTime INT, -- in minutes
    mealType VARCHAR(255), -- e.g., Breakfast, Lunch, Dinner, Snack, Appetizers, Dessert, brunch, cold-dish, Barbecue, Buffet, Halal, Fine-Dining, Vegan, Raw-Food
    tools VARCHAR(255),
    portions INT,
    basicIngredient VARCHAR(64),
    categoryBasedOnBasicIngredient VARCHAR(64),
    caloriesPerPortion INT,
    proteinsPerPortion INT,
    carbohydratesPerPortion INT,
    fatsPerPortion INT,
    sugarsPerPortion INT,
    PRIMARY KEY (name),
    FOREIGN KEY (nationalCuisine) REFERENCES nationalCuisines(name)
);

CREATE TABLE recipes_mealTypes(
    recipeName VARCHAR(64),
    mealTypeName VARCHAR(64),
    PRIMARY KEY (recipeName,mealTypeName),
    FOREIGN KEY (recipeName) REFERENCES recipes(name),
    FOREIGN KEY (mealTypeName) REFERENCES mealTypes(name)
);


CREATE TABLE recipes_usageTips(
    recipeName VARCHAR(64),
    usageTip VARCHAR(256),
    PRIMARY KEY (recipeName, usageTip),
    FOREIGN KEY (recipeName) REFERENCES recipes(name)
);

CREATE TABLE recipes_tools (
    recipeName VARCHAR(64),
    toolName VARCHAR(64),
    PRIMARY KEY (recipeName,toolName),
    FOREIGN KEY (recipeName) REFERENCES recipes(name),
    FOREIGN KEY (toolName) REFERENCES tools(name)
);

CREATE TABLE recipes_ingredients (
    recipeName VARCHAR(64),
    ingredientName VARCHAR(64),
    quantity INT,
    PRIMARY KEY (recipeName, ingredientName),
    FOREIGN KEY (recipeName) REFERENCES recipes(name)
    FOREIGN KEY (ingredientName) REFERENCES ingredients(name)
);

CREATE TABLE recipes_instructions (
    recipeName VARCHAR(64),
    instructionStepNumber SMALL INT,
    instruction VARCHAR(512),
    PRIMARY KEY (recipeName, instructionStepNumber),
    FOREIGN KEY (recipeName) REFERENCES recipes(name)
);

-- CREATE TABLE chefs_nationalCuisines(
--     chefId INT,
--     nationalCuisineName VARCHAR(64),
--     PRIMARY KEY (chefId, nationalCuisineName)
--     FOREIGN KEY (chefId) REFERENCES chefs(id),
--     FOREIGN KEY (nationalCuisineName) REFERENCES nationalCuisines(Name)
-- );
-- CREATE TABLE chefs_recipes(
--     chefId INT,
--     recipeName VARCHAR(64),
--     PRIMARY KEY (chefId, recipeName),
--     FOREIGN KEY (chefId) REFERENCES chefs(id),
--     FOREIGN KEY (recipeName) REFERENCES recipes(name)
-- );
-- CREATE TABLE credentials (
--     username VARCHAR(64),
--     password VARCHAR(64),
--     chefId INTEGER,
--     isAdmin BOOLEAN DEFAULT FALSE,
--     PRIMARY KEY (username),
--     FOREIGN KEY (chefId) REFERENCES chefs(id)
-- );

CREATE TABLE episodes (
    episodeYear INTEGER CHECK(episodeYear BETWEEN 2024 AND 2100),
    episodeNumber INTEGER CHECK(episodeNumber BETWEEN 0 AND 10),
    PRIMARY KEY (episodeYear, episodeNumber)
);

CREATE TABLE episode_judges (
    episodeYear INTEGER,
    episodeNumber INTEGER,
    chefId INTEGER,
    judgeNumber INTEGER CHECK (judgeNumber BETWEEN 1 AND 3), --dificulty of the dish
    PRIMARY KEY (episodeYear, episodeNumber, chefId),
    FOREIGN KEY (episodeYear, episodeNumber) REFERENCES episodes(episodeYear, episodeNumber),
    FOREIGN KEY (chefId) REFERENCES chefs(id)
);


CREATE TABLE episode_recipes (
    episodeYear INTEGER,
    episodeNumber INTEGER,
    recipeNumber INTEGER CHECK (recipeNumber BETWEEN 1 AND 10), --dificulty of the dish,
    recipeName VARCHAR(64),
    recipeNationalCuisine VARCHAR(64),
    chefAssignedToRecipeId INTEGER,
    PRIMARY KEY (episodeYear, episodeNumber, recipeNumber),
    FOREIGN KEY (episodeYear, episodeNumber) REFERENCES episodes(episodeYear, episodeNumber),
    FOREIGN KEY (recipeName) REFERENCES recipes(name),
    FOREIGN KEY (chefAssignedToRecipeId) REFERENCES chefs(id)
    FOREIGN KEY (recipeNationalCuisine) REFERENCES nationalCuisines(name)
);


CREATE TABLE recipe_score(
    episodeYear INTEGER,
    episodeNumber INTEGER,
    recipeNumber INTEGER, --dificulty of the dish,
    judgeNumber INTEGER,
    judgeId INTEGER,
    score INTEGER, CHECK (score BETWEEN 1 AND 5)
    PRIMARY KEY (episodeYear,episodeNumber,recipeNumber,judgeNumber),
    FOREIGN KEY (episodeYear,episodeNumber) REFERENCES episodes(episodeYear, episodeNumber),
    FOREIGN KEY (episodeYear,episodeNumber,recipeNumber) REFERENCES episode_recipes(episodeYear,episodeNumber,recipeNumber),
    FOREIGN KEY (episodeYear,episodeNumber,judgeNumber) REFERENCES episode_judges(episodeYear,episodeNumber,judgeNumber),
    FOREIGN KEY (judgeId) REFERENCES chefsId
)
