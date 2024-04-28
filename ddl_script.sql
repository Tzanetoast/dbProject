-- DROP TABLE nationalCuisines;

-- CREATE TABLE nationalCuisines (
--     nation VARCHAR(128) NOT NULL,
--     PRIMARY KEY (nation)
-- );

-- INSERT INTO NationalCuisines (nation) VALUES
-- ('Italian'),('French'),('Japanese'),('Mexican');

-- DROP TABLE mealType;

-- CREATE TABLE mealType (
--     type VARCHAR(128) NOT NULL,
--     PRIMARY KEY (type) 
-- );

-- CREATE TABLE recipe-mealType (
--     recipeId INT NOT NULL,
--     type VARCHAR(128) NOT NULL,
--     PRIMARY KEY (recipeId,type),
--     FOREIGN KEY recipeId REFERENCES recipes(recipeId),
--     FOREIGN KEY type REFERENCES mealType(type)
-- )

-- DROP TABLE recipes;

-- CREATE TABLE recipes (
--     recipeId INT NOT NULL,
--     name VARCHAR(128) NOT NULL,
--     cookingORpastry VARCHAR(7) NOT NULL CHECK (cookingORpastry IN ('cooking', 'pastry')),
--     shortDescription TEXT,
--     nationalCuisine VARCHAR(128) NOT NULL,
--     difficulty  SMALLINT CHECK (difficulty BETWEEN 1 AND 5),
--     PrepTime INT, -- in minutes
--     CookingTime INT, -- in minutes
--     MealType VARCHAR(255), -- e.g., Breakfast, Lunch, Dinner
--     AdditionalTags TEXT, -- JSON array of tags
--     Tips TEXT, -- JSON array of tips
--     MainIngredientID INT,
--     PRIMARY KEY (recipeId),
--     FOREIGN KEY (nationalCuisine) REFERENCES nationalCuisines(nation)
-- );

-- DROP TABLE recipes;

-- CREATE TABLE recipes (
--     recipeId INT NOT NULL,
--     name VARCHAR(128) NOT NULL,
--     cookingORpastry VARCHAR(7) NOT NULL CHECK (cookingORpastry IN ('cooking', 'pastry')),
--     shortDescription TEXT,
--     nationalCuisine VARCHAR(128) NOT NULL,  
--     difficulty  SMALLINT CHECK (difficulty BETWEEN 1 AND 5), --dificulty of the dish
--     prepTime INT, -- in minutes
--     cookingTime INT, -- in minutes
--     mealType VARCHAR(255), -- e.g., Breakfast, Lunch, Dinner,Snack,Appetizers,Dessert, brunch, cold-dish,Barbecue,Buffet,Halal,Fine-Dining,Vegan,Raw-Food
--     tools VARCHAR(255),
--     PRIMARY KEY (recipeId)
--     --FOREIGN KEY (nationalCuisine) REFERENCES nationalCuisines(nation)
-- );

-- INSERT INTO recipes (recipeId, name, cookingORpastry, shortDescription, nationalCuisine, difficulty, prepTime, cookingTime, mealType) VALUES 
-- (1, 'Apple Frangipan Tart', 'pastry', 'A delicious tart made with apples and frangipane.', 'British', 3, 30, 45, 'Dessert'),
-- (2, 'Apple & Blackberry Crumble', 'pastry', 'A traditional dessert combining apples and blackberries with a crumble topping.', 'British', 2, 15, 30, 'Dessert'),
-- (3, 'Apam balik', 'cooking', 'A sweet Malaysian pancake that is crispy on the outside and fluffy inside.', 'Malaysian', 2, 10, 15, 'Snack'),
-- (4, 'Ayam Percik', 'cooking', 'Malaysian grilled chicken slathered in a spicy coconut milk marinade.', 'Malaysian', 3, 20, 30, 'Dinner'),

-- (5, 'Bakewell tart', 'pastry', 'A classic English dessert tart with jam and frangipane.', 'British', 3, 20, 40, 'Dessert, Snack'),
-- (6, 'Beef Wellington', 'cooking', 'Beef fillet coated with mushroom duxelles and wrapped in puff pastry.', 'British', 5, 30, 60, 'Dinner, Fine-Dining'),

-- (7, 'Irish stew', 'cooking', 'A hearty stew made with lamb, potatoes, and carrots.', 'Irish', 2, 15, 120, 'Dinner, Lunch'),

-- (8, 'Banana Pancakes', 'cooking', 'Sweet pancakes made with ripe bananas.', 'American', 1, 10, 15, 'Breakfast, Dessert'),

-- (9, 'Chicken Congee', 'cooking', 'A type of rice porridge popular in Asian countries.', 'Chinese', 1, 10, 90, 'Breakfast, Dinner'),
-- (10, 'Cannelloni', 'cooking', 'Tubular pasta filled with meat or cheese and baked in a sauce.', 'Italian', 3, 30, 45, 'Lunch, Dinner'),
-- (11, 'Caldo verde', 'cooking', 'A traditional Portuguese soup made with potatoes, chorizo, and kale.', 'Portuguese', 2, 15, 35, 'Dinner, Cold-dish'),

-- (12, 'Dakdoritang', 'cooking', 'Korean spicy chicken stew with vegetables.', 'Korean', 3, 20, 40, 'Dinner'),
-- (13, 'Danish Pastry', 'pastry', 'Sweet pastry originated from Denmark.', 'Danish', 4, 30, 20, 'Breakfast, Snack'),
-- (14, 'Dum Aloo', 'cooking', 'Potatoes cooked in curry, popular in Indian cuisine.', 'Indian', 2, 15, 30, 'Lunch, Dinner'),

-- (15, 'English Breakfast', 'cooking', 'Full breakfast dish consisting of eggs, sausages, beans, toast, and more.', 'British', 2, 5, 15, 'Breakfast, Brunch'),
-- (16, 'Eclairs', 'pastry', 'Pastry filled with cream and topped with chocolate icing.', 'French', 4, 25, 50, 'Dessert, Snack'),
-- (17, 'Eton Mess', 'pastry', 'Dessert consisting of a mix of strawberries, meringue, and whipped cream.', 'British', 1, 15, 0, 'Dessert, Snack'),

-- (18, 'Fish and Chips', 'cooking', 'Battered fish with deep-fried chips, a popular British fast food.', 'British', 2, 10, 20, 'Lunch, Dinner, Snack'),
-- (19, 'Fajitas', 'cooking', 'Grilled meat served on a flour or corn tortilla.', 'Mexican', 2, 20, 10, 'Dinner, Barbecue'),
-- (20, 'Falafel', 'cooking', 'Deep-fried balls made from ground chickpeas or fava beans.', 'Middle Eastern', 2, 30, 5, 'Lunch, Dinner, Snack'),

-- (21, 'Gazpacho', 'cooking', 'Cold soup made from raw, blended vegetables.', 'Spanish', 1, 20, 0, 'Lunch, Dinner, Cold-dish'),
-- (22, 'Goulash', 'cooking', 'Stew of meat and vegetables seasoned with paprika.', 'Hungarian', 3, 15, 120, 'Dinner'),
-- (23, 'Greek Salad', 'cooking', 'Salad made with tomatoes, cucumbers, onion, feta cheese, and olives.', 'Greek', 1, 10, 0, 'Lunch, Dinner, Cold-dish'),

-- (24, 'Hot and Sour Soup', 'cooking', 'A variety of soups from severalAsian countries, particularly spicy in Sichuan cuisine.', 'Chinese', 2, 10, 20, 'Dinner, Snack'),
-- (25, 'Hummus', 'cooking', 'Creamy dip made from cooked, mashed chickpeas blended with tahini, lemon juice, and garlic.', 'Middle Eastern', 1, 10, 0, 'Snack, Appetizer'),
-- (26, 'Hamburgers', 'cooking', 'Ground meat patties, typically beef, served on a bun with various toppings.', 'American', 1, 10, 10, 'Lunch, Dinner, Snack'),

-- (27, 'Irish Coffee', 'pastry', 'Hot coffee with Irish whiskey and sugar, stirred, and topped with cream.', 'Irish', 1, 5, 0, 'Dessert, Snack'),
-- (28, 'Indian Curry', 'cooking', 'Spiced meat, fish, or vegetables cooked in a sauce.', 'Indian', 3, 20, 40, 'Lunch, Dinner'),
-- (29, 'Italian Biscotti', 'pastry', 'Twice-baked almond biscuits originating from Italy.', 'Italian', 2, 20, 30, 'Snack, Dessert'),

-- (30, 'Jambalaya', 'cooking', 'A Creole rice dish with meat and seafood, cooked in a tomato base.', 'American', 3, 20, 45, 'Lunch, Dinner'),
-- (31, 'Japanese Curry', 'cooking', 'A thick, stew-like curry with meat and vegetables.', 'Japanese', 2, 15, 35, 'Dinner'),
-- (32, 'Jerk Chicken', 'cooking', 'Spicy chicken dish marinated with a hot spice mixture called jerk spice.', 'Caribbean', 3, 240, 45, 'Dinner, Barbecue'),

-- (33, 'Kimchi Fried Rice', 'cooking', 'Fried rice made with kimchi and other ingredients such as vegetables or meat.', 'Korean', 1, 10, 15, 'Lunch, Dinner'),
-- (34, 'Kaiserschmarrn', 'pastry', 'A fluffy shredded pancake that has its origins in Austria.', 'Austrian', 2, 10, 20, 'Dessert, Snack'),
-- (35, 'Kebab', 'cooking', 'Meat cut into cubes, marinated, and then grilled on skewers.', 'Middle Eastern', 2, 180, 10, 'Lunch, Dinner, Snack'),

-- (36, 'Lasagna', 'cooking', 'Layered pasta dish with cheese, meat, and tomato sauce.', 'Italian', 4, 30, 60, 'Lunch, Dinner'),
-- (37, 'Lamb Tagine', 'cooking', 'Moroccan dish of slow-cooked lamb with spices.', 'Moroccan', 3, 20, 120, 'Dinner'),
-- (38, 'Lobster Bisque', 'cooking', 'A smooth and creamy soup made with lobster stock.', 'French', 4, 15, 45, 'Dinner, Fine-Dining'),

-- (39, 'Moussaka', 'cooking', 'Eggplant or potato-based dish, often including ground meat.', 'Greek', 3, 30, 60, 'Dinner'),
-- (40, 'Mapo Tofu', 'cooking', 'Spicy Sichuan tofu dish with minced meat, typically pork or beef.', 'Chinese', 2, 10, 20, 'Lunch, Dinner'),
-- (41, 'Macaron', 'pastry', 'Sweet meringue-based confection made with egg white, icing sugar, granulated sugar, almond meal, and food coloring.', 'French', 4, 25, 15, 'Dessert, Snack'),

-- (42, 'Nachos', 'cooking', 'Dish of heated tortilla chips or totopos covered with melted cheese, often served as a snack or appetizer.', 'Mexican', 1, 5, 10, 'Snack, Appetizer'),
-- (43, 'Nasi Goreng', 'cooking', 'Indonesian dish made with fried rice, typically flavored with kecap manis (sweet soy sauce), shallot, garlic, tamarind and chili.', 'Indonesian', 2, 10, 15, 'Lunch, Dinner'),
-- (44, 'Nougat', 'pastry', 'A family of confections made with sugar or honey, roasted nuts, whipped egg whites, and sometimes chopped candied fruit.', 'French', 3, 30, 20, 'Dessert, Snack'),

-- (45, 'Osso Buco', 'cooking', 'An Italian dish made with veal shanks cooked with vegetables, white wine, and broth.', 'Italian', 4, 15, 120, 'Lunch, Dinner'),
-- (46, 'Oysters Kilpatrick', 'cooking', 'Oysters topped with a Worcestershire-based sauce, bacon and breadcrumbs, then grilled.', 'Australian', 2, 10, 10, 'Appetizer, Fine-Dining'),
-- (47, 'Okonomiyaki', 'cooking', 'Japanese savory pancake containing a variety of ingredients.', 'Japanese', 2, 10, 15, 'Lunch, Dinner, Snack'),

-- (48, 'Paella', 'cooking', 'Spanish rice dish originally from Valencia, containing meat, seafood, and vegetables.', 'Spanish', 3, 20, 40, 'Lunch, Dinner'),
-- (49, 'Pierogi', 'cooking', 'Filled dumplings of Central European origin made by wrapping unleavened dough around a savory or sweet filling.', 'Eastern European', 3, 30, 20, 'Lunch, Dinner, Snack'),
-- (50, 'Peking Duck', 'cooking', 'A famous duck dish from Beijing that has been prepared since the imperial era, known for its thin, crisp skin.', 'Chinese', 5, 120, 60, 'Dinner, Fine-Dining'),

-- (51, 'Quiche Lorraine', 'pastry', 'A French tart consisting of pastry crust filled with smoked bacon, cheese, and egg custard.', 'French', 3, 20, 45, 'Breakfast, Brunch, Snack'),
-- (52, 'Quesadilla', 'cooking', 'A Mexican dish consisting of a tortilla that is filled primarily with cheese, and sometimes meats, spices, and other fillings, and then cooked on a griddle.', 'Mexican', 1, 5, 10, 'Snack, Lunch'),
-- (53, 'Quinoa Salad', 'cooking', 'Salad made from quinoa mixed with various vegetables and sometimes meat or seafood.', 'International', 1, 15, 0, 'Lunch, Dinner, Cold-dish'),

-- (54, 'Ratatouille', 'cooking', 'A French Provençal stewed vegetable dish, originating in Nice.', 'French', 2, 20, 40, 'Lunch, Dinner'),
-- (55, 'Risotto', 'cooking', 'An Italian rice dish cooked with broth until it reaches a creamy consistency.', 'Italian', 3, 10, 30, 'Lunch, Dinner'),
-- (56, 'Ramen', 'cooking', 'A Japanese noodle soup dish with meat or fish broth flavored with soy sauce or miso, and uses toppings such as sliced pork, nori, and green onions.', 'Japanese', 3, 15, 30, 'Lunch, Dinner'),

-- (57, 'Sushi', 'cooking', 'Japanese dish of prepared vinegared rice, usually with some sugar and salt, accompanying a variety of ingredients, such as seafood, often raw, and vegetables.', 'Japanese', 3, 30, 0, 'Lunch, Dinner, Snack'),
-- (58, 'Shepherds Pie', 'cooking', 'A traditional British dish of minced meat topped with a mashed potato crust.', 'British', 2, 20, 60, 'Lunch, Dinner'),
-- (59, 'Samosa', 'cooking', 'A fried or baked pastry with a savory filling, such as spiced potatoes, onions, peas, or lentils.', 'Indian', 2, 30, 10, 'Snack, Appetizer'),

-- (60, 'Tiramisu', 'pastry', 'A popular coffee-flavored Italian dessert.', 'Italian', 2, 30, 0, 'Dessert'),
-- (61, 'Tacos', 'cooking', 'Traditional Mexican dish consisting of a small hand-sized corn or wheat tortilla topped with a filling.', 'Mexican', 1, 10, 10, 'Lunch, Dinner, Snack'),
-- (62, 'Tabbouleh', 'cooking', 'A Levantine vegetarian salad made of finely chopped parsley, with tomatoes, mint, onion, bulgur, and seasoned with olive oil, lemon juice, salt and pepper.', 'Middle Eastern', 1, 20, 0, 'Lunch, Dinner, Cold-dish'),

-- (63, 'Udon Soup', 'cooking', 'A Japanese noodle soup made with udon noodles.', 'Japanese', 2, 5, 15, 'Lunch, Dinner'),
-- (64, 'Ukrainian borscht', 'cooking', 'A hearty soup made with beetroot as a main ingredient, giving it a distinctive red color.', 'Ukrainian', 3, 30, 60, 'Lunch, Dinner'),
-- (65, 'Umbrian Lentil Stew', 'cooking', 'Made with lentils and typically includes tomatoes, vegetables, and herbs.', 'Italian', 2, 10, 45, 'Lunch, Dinner'),

-- (66, 'Vietnamese Pho', 'cooking', 'A Vietnamese soup consisting of broth, rice noodles, herbs, and meat.', 'Vietnamese', 2, 20, 90, 'Lunch, Dinner'),
-- (67, 'Vegetable Terrine', 'cooking', 'Made with layers of cooked or raw vegetables held together by a gelatin made from a vegetable stock or a meat stock.', 'French', 4, 30, 120, 'Lunch, Dinner, Cold-dish'),
-- (68, 'Venison Stew', 'cooking', 'A hearty stew made using venison as the main ingredient.', 'International', 3, 20, 120, 'Lunch, Dinner'),

-- (69, 'Waldorf Salad', 'cooking', 'An American salad generally made of fresh apples, celery, grapes, and walnuts, dressed in mayonnaise, and usually served on a bed of lettuce.', 'American', 1, 15, 0, 'Lunch, Dinner, Cold-dish'),
-- (70, 'Welsh Rarebit', 'cooking', 'A dish made with a savory sauce of melted cheese and various other ingredients and served hot, after being poured over slices of toasted bread.', 'British', 1, 5, 10, 'Snack, Lunch'),
-- (71, 'Wiener Schnitzel', 'cooking', 'A traditional Viennese dish made by breading and frying a thin slice of meat (usually veal).', 'Austrian', 2, 10, 10, 'Lunch, Dinner'),

-- (72, 'Xiaolongbao', 'cooking', 'Chinese steamed buns filled with meat and broth.', 'Chinese', 4, 30, 20, 'Lunch, Dinner, Snack'),
-- (73, 'Xinjiang Lamb Skewers', 'cooking', 'Spicy skewers of grilled lamb, a popular street food from the Xinjiang region.', 'Chinese', 2, 120, 10, 'Dinner, Snack'),

-- (74, 'Jerk Chicken', 'cooking', 'Spicy marinated chicken grilled to perfection.', 'Jamaican', 3, 240, 45, 'Dinner, Barbecue'),
-- (75, 'Jambalaya', 'cooking', 'A Creole dish with rice, meat, and vegetables.', 'American', 3, 20, 45, 'Lunch, Dinner'),
-- (76, 'Japanese Cheesecake', 'pastry', 'A fluffy and light style of cheesecake.', 'Japanese', 2, 15, 45, 'Dessert'),

-- (77, 'Kimchi Stew', 'cooking', 'Spicy stew made with kimchi and tofu.', 'Korean', 2, 15, 30, 'Lunch, Dinner'),
-- (78, 'Kebab', 'cooking', 'Skewered and grilled meats with vegetables.', 'Middle Eastern', 2, 30, 15, 'Lunch, Dinner, Snack'),
-- (79, 'Key Lime Pie', 'pastry', 'A pie made with Key lime juice, egg yolks, and sweetened condensed milk.', 'American', 2, 20, 30, 'Dessert');
-- DROP TABLE recipes;

DROP TABLE recipes;

CREATE TABLE recipes (
    name VARCHAR(64) NOT NULL,
    cookingORpastry VARCHAR(7) NOT NULL CHECK (cookingORpastry IN ('cooking', 'pastry')),
    shortDescription TEXT,
    nationalCuisine VARCHAR(64) NOT NULL,  
    difficulty  SMALLINT CHECK (difficulty BETWEEN 1 AND 5), --dificulty of the dish
    prepTime INT, -- in minutes
    cookingTime INT, -- in minutes
    mealType VARCHAR(255), -- e.g., Breakfast, Lunch, Dinner,Snack,Appetizers,Dessert, brunch, cold-dish,Barbecue,Buffet,Halal,Fine-Dining,Vegan,Raw-Food
    tools VARCHAR(255),
    PRIMARY KEY (name)
    --FOREIGN KEY (nationalCuisine) REFERENCES nationalCuisines(nation)
);

INSERT INTO recipes (name, cookingORpastry, shortDescription, nationalCuisine, difficulty, prepTime, cookingTime, mealType) VALUES 
('Apple Frangipan Tart', 'pastry', 'A delicious tart made with apples and frangipane.', 'British', 3, 30, 45, 'Dessert'),
('Apple & Blackberry Crumble', 'pastry', 'A traditional dessert combining apples and blackberries with a crumble topping.', 'British', 2, 15, 30, 'Dessert'),
('Apam balik', 'cooking', 'A sweet Malaysian pancake that is crispy on the outside and fluffy inside.', 'Malaysian', 2, 10, 15, 'Snack'),
('Ayam Percik', 'cooking', 'Malaysian grilled chicken slathered in a spicy coconut milk marinade.', 'Malaysian', 3, 20, 30, 'Dinner'),

('Bakewell tart', 'pastry', 'A classic English dessert tart with jam and frangipane.', 'British', 3, 20, 40, 'Dessert, Snack'),
('Beef Wellington', 'cooking', 'Beef fillet coated with mushroom duxelles and wrapped in puff pastry.', 'British', 5, 30, 60, 'Dinner, Fine-Dining'),
('Banana Pancakes', 'cooking', 'Sweet pancakes made with ripe bananas.', 'American', 1, 10, 15, 'Breakfast, Dessert'),

('Chicken Congee', 'cooking', 'A type of rice porridge popular in Asian countries.', 'Chinese', 1, 10, 90, 'Breakfast, Dinner'),
('Cannelloni', 'cooking', 'Tubular pasta filled with meat or cheese and baked in a sauce.', 'Italian', 3, 30, 45, 'Lunch, Dinner'),
('Caldo verde', 'cooking', 'A traditional Portuguese soup made with potatoes, chorizo, and kale.', 'Portuguese', 2, 15, 35, 'Dinner, Cold-dish'),

('Dakdoritang', 'cooking', 'Korean spicy chicken stew with vegetables.', 'Korean', 3, 20, 40, 'Dinner'),
('Danish Pastry', 'pastry', 'Sweet pastry originated from Denmark.', 'Danish', 4, 30, 20, 'Breakfast, Snack'),
('Dum Aloo', 'cooking', 'Potatoes cooked in curry, popular in Indian cuisine.', 'Indian', 2, 15, 30, 'Lunch, Dinner'),

('English Breakfast', 'cooking', 'Full breakfast dish consisting of eggs, sausages, beans, toast, and more.', 'British', 2, 5, 15, 'Breakfast, Brunch'),
('Eclairs', 'pastry', 'Pastry filled with cream and topped with chocolate icing.', 'French', 4, 25, 50, 'Dessert, Snack'),
('Eton Mess', 'pastry', 'Dessert consisting of a mix of strawberries, meringue, and whipped cream.', 'British', 1, 15, 0, 'Dessert, Snack'),

('Fish and Chips', 'cooking', 'Battered fish with deep-fried chips, a popular British fast food.', 'British', 2, 10, 20, 'Lunch, Dinner, Snack'),
('Fajitas', 'cooking', 'Grilled meat served on a flour or corn tortilla.', 'Mexican', 2, 20, 10, 'Dinner, Barbecue'),
('Falafel', 'cooking', 'Deep-fried balls made from ground chickpeas or fava beans.', 'Middle Eastern', 2, 30, 5, 'Lunch, Dinner, Snack'),

('Gazpacho', 'cooking', 'Cold soup made from raw, blended vegetables.', 'Spanish', 1, 20, 0, 'Lunch, Dinner, Cold-dish'),
('Goulash', 'cooking', 'Stew of meat and vegetables seasoned with paprika.', 'Hungarian', 3, 15, 120, 'Dinner'),
('Greek Salad', 'cooking', 'Salad made with tomatoes, cucumbers, onion, feta cheese, and olives.', 'Greek', 1, 10, 0, 'Lunch, Dinner, Cold-dish'),

('Hot and Sour Soup', 'cooking', 'A variety of soups from severalAsian countries, particularly spicy in Sichuan cuisine.', 'Chinese', 2, 10, 20, 'Dinner, Snack'),
('Hummus', 'cooking', 'Creamy dip made from cooked, mashed chickpeas blended with tahini, lemon juice, and garlic.', 'Middle Eastern', 1, 10, 0, 'Snack, Appetizer'),
('Hamburgers', 'cooking', 'Ground meat patties, typically beef, served on a bun with various toppings.', 'American', 1, 10, 10, 'Lunch, Dinner, Snack'),

('Irish Coffee', 'pastry', 'Hot coffee with Irish whiskey and sugar, stirred, and topped with cream.', 'Irish', 1, 5, 0, 'Dessert, Snack'),
('Indian Curry', 'cooking', 'Spiced meat, fish, or vegetables cooked in a sauce.', 'Indian', 3, 20, 40, 'Lunch, Dinner'),
('Italian Biscotti', 'pastry', 'Twice-baked almond biscuits originating from Italy.', 'Italian', 2, 20, 30, 'Snack, Dessert'),
('Irish stew', 'cooking', 'A hearty stew made with lamb, potatoes, and carrots.', 'Irish', 2, 15, 120, 'Dinner, Lunch'),

('Jambalaya', 'cooking', 'A Creole rice dish with meat and seafood, cooked in a tomato base.', 'American', 3, 20, 45, 'Lunch, Dinner'),
('Japanese Curry', 'cooking', 'A thick, stew-like curry with meat and vegetables.', 'Japanese', 2, 15, 35, 'Dinner'),
('Jerk Chicken', 'cooking', 'Spicy chicken dish marinated with a hot spice mixture called jerk spice.', 'Caribbean', 3, 240, 45, 'Dinner, Barbecue'),
('Japanese Cheesecake', 'pastry', 'A fluffy and light style of cheesecake.', 'Japanese', 2, 15, 45, 'Dessert'),

('Kimchi Fried Rice', 'cooking', 'Fried rice made with kimchi and other ingredients such as vegetables or meat.', 'Korean', 1, 10, 15, 'Lunch, Dinner'),
('Kaiserschmarrn', 'pastry', 'A fluffy shredded pancake that has its origins in Austria.', 'Austrian', 2, 10, 20, 'Dessert, Snack'),
('Kebab', 'cooking', 'Meat cut into cubes, marinated, and then grilled on skewers.', 'Middle Eastern', 2, 180, 10, 'Lunch, Dinner, Snack'),
('Kimchi Stew', 'cooking', 'Spicy stew made with kimchi and tofu.', 'Korean', 2, 15, 30, 'Lunch, Dinner'),
('Key Lime Pie', 'pastry', 'A pie made with Key lime juice, egg yolks, and sweetened condensed milk.', 'American', 2, 20, 30, 'Dessert'),

('Lasagna', 'cooking', 'Layered pasta dish with cheese, meat, and tomato sauce.', 'Italian', 4, 30, 60, 'Lunch, Dinner'),
('Lamb Tagine', 'cooking', 'Moroccan dish of slow-cooked lamb with spices.', 'Moroccan', 3, 20, 120, 'Dinner'),
('Lobster Bisque', 'cooking', 'A smooth and creamy soup made with lobster stock.', 'French', 4, 15, 45, 'Dinner, Fine-Dining'),

('Moussaka', 'cooking', 'Eggplant or potato-based dish, often including ground meat.', 'Greek', 3, 30, 60, 'Dinner'),
('Mapo Tofu', 'cooking', 'Spicy Sichuan tofu dish with minced meat, typically pork or beef.', 'Chinese', 2, 10, 20, 'Lunch, Dinner'),
('Macaron', 'pastry', 'Sweet meringue-based confection made with egg white, icing sugar, granulated sugar, almond meal, and food coloring.', 'French', 4, 25, 15, 'Dessert, Snack'),

('Nachos', 'cooking', 'Dish of heated tortilla chips or totopos covered with melted cheese, often served as a snack or appetizer.', 'Mexican', 1, 5, 10, 'Snack, Appetizer'),
('Nasi Goreng', 'cooking', 'Indonesian dish made with fried rice, typically flavored with kecap manis (sweet soy sauce), shallot, garlic, tamarind and chili.', 'Indonesian', 2, 10, 15, 'Lunch, Dinner'),
('Nougat', 'pastry', 'A family of confections made with sugar or honey, roasted nuts, whipped egg whites, and sometimes chopped candied fruit.', 'French', 3, 30, 20, 'Dessert, Snack'),

('Osso Buco', 'cooking', 'An Italian dish made with veal shanks cooked with vegetables, white wine, and broth.', 'Italian', 4, 15, 120, 'Lunch, Dinner'),
('Oysters Kilpatrick', 'cooking', 'Oysters topped with a Worcestershire-based sauce, bacon and breadcrumbs, then grilled.', 'Australian', 2, 10, 10, 'Appetizer, Fine-Dining'),
('Okonomiyaki', 'cooking', 'Japanese savory pancake containing a variety of ingredients.', 'Japanese', 2, 10, 15, 'Lunch, Dinner, Snack'),

('Paella', 'cooking', 'Spanish rice dish originally from Valencia, containing meat, seafood, and vegetables.', 'Spanish', 3, 20, 40, 'Lunch, Dinner'),
('Pierogi', 'cooking', 'Filled dumplings of Central European origin made by wrapping unleavened dough around a savory or sweet filling.', 'Eastern European', 3, 30, 20, 'Lunch, Dinner, Snack'),
('Peking Duck', 'cooking', 'A famous duck dish from Beijing that has been prepared since the imperial era, known for its thin, crisp skin.', 'Chinese', 5, 120, 60, 'Dinner, Fine-Dining'),

('Quiche Lorraine', 'pastry', 'A French tart consisting of pastry crust filled with smoked bacon, cheese, and egg custard.', 'French', 3, 20, 45, 'Breakfast, Brunch, Snack'),
('Quesadilla', 'cooking', 'A Mexican dish consisting of a tortilla that is filled primarily with cheese, and sometimes meats, spices, and other fillings, and then cooked on a griddle.', 'Mexican', 1, 5, 10, 'Snack, Lunch'),
('Quinoa Salad', 'cooking', 'Salad made from quinoa mixed with various vegetables and sometimes meat or seafood.', 'International', 1, 15, 0, 'Lunch, Dinner, Cold-dish'),

('Ratatouille', 'cooking', 'A French Provençal stewed vegetable dish, originating in Nice.', 'French', 2, 20, 40, 'Lunch, Dinner'),
('Risotto', 'cooking', 'An Italian rice dish cooked with broth until it reaches a creamy consistency.', 'Italian', 3, 10, 30, 'Lunch, Dinner'),
('Ramen', 'cooking', 'A Japanese noodle soup dish with meat or fish broth flavored with soy sauce or miso, and uses toppings such as sliced pork, nori, and green onions.', 'Japanese', 3, 15, 30, 'Lunch, Dinner'),

('Sushi', 'cooking', 'Japanese dish of prepared vinegared rice, usually with some sugar and salt, accompanying a variety of ingredients, such as seafood, often raw, and vegetables.', 'Japanese', 3, 30, 0, 'Lunch, Dinner, Snack'),
('Shepherds Pie', 'cooking', 'A traditional British dish of minced meat topped with a mashed potato crust.', 'British', 2, 20, 60, 'Lunch, Dinner'),
('Samosa', 'cooking', 'A fried or baked pastry with a savory filling, such as spiced potatoes, onions, peas, or lentils.', 'Indian', 2, 30, 10, 'Snack, Appetizer'),

('Tiramisu', 'pastry', 'A popular coffee-flavored Italian dessert.', 'Italian', 2, 30, 0, 'Dessert'),
('Tacos', 'cooking', 'Traditional Mexican dish consisting of a small hand-sized corn or wheat tortilla topped with a filling.', 'Mexican', 1, 10, 10, 'Lunch, Dinner, Snack'),
('Tabbouleh', 'cooking', 'A Levantine vegetarian salad made of finely chopped parsley, with tomatoes, mint, onion, bulgur, and seasoned with olive oil, lemon juice, salt and pepper.', 'Middle Eastern', 1, 20, 0, 'Lunch, Dinner, Cold-dish'),

('Udon Soup', 'cooking', 'A Japanese noodle soup made with udon noodles.', 'Japanese', 2, 5, 15, 'Lunch, Dinner'),
('Ukrainian borscht', 'cooking', 'A hearty soup made with beetroot as a main ingredient, giving it a distinctive red color.', 'Ukrainian', 3, 30, 60, 'Lunch, Dinner'),
('Umbrian Lentil Stew', 'cooking', 'Made with lentils and typically includes tomatoes, vegetables, and herbs.', 'Italian', 2, 10, 45, 'Lunch, Dinner'),

('Vietnamese Pho', 'cooking', 'A Vietnamese soup consisting of broth, rice noodles, herbs, and meat.', 'Vietnamese', 2, 20, 90, 'Lunch, Dinner'),
('Vegetable Terrine', 'cooking', 'Made with layers of cooked or raw vegetables held together by a gelatin made from a vegetable stock or a meat stock.', 'French', 4, 30, 120, 'Lunch, Dinner, Cold-dish'),
('Venison Stew', 'cooking', 'A hearty stew made using venison as the main ingredient.', 'International', 3, 20, 120, 'Lunch, Dinner'),

('Waldorf Salad', 'cooking', 'An American salad generally made of fresh apples, celery, grapes, and walnuts, dressed in mayonnaise, and usually served on a bed of lettuce.', 'American', 1, 15, 0, 'Lunch, Dinner, Cold-dish'),
('Welsh Rarebit', 'cooking', 'A dish made with a savory sauce of melted cheese and various other ingredients and served hot, after being poured over slices of toasted bread.', 'British', 1, 5, 10, 'Snack, Lunch'),
('Wiener Schnitzel', 'cooking', 'A traditional Viennese dish made by breading and frying a thin slice of meat (usually veal).', 'Austrian', 2, 10, 10, 'Lunch, Dinner'),

('Xiaolongbao', 'cooking', 'Chinese steamed buns filled with meat and broth.', 'Chinese', 4, 30, 20, 'Lunch, Dinner, Snack'),
('Xinjiang Lamb Skewers', 'cooking', 'Spicy skewers of grilled lamb, a popular street food from the Xinjiang region.', 'Chinese', 2, 120, 10, 'Dinner, Snack');

-- Pies, Tarts, and Cakes
UPDATE recipes
SET tools = 'oven, mixing bowl, cake mold, rolling pin, pastry brush, measuring spoon'
WHERE name IN ('Apple Frangipan Tart', 'Bakewell tart', 'Beef Wellington', 'Banana Pancakes', 'Cannelloni', 'Danish Pastry', 'Eclairs', 'English Breakfast', 'Key Lime Pie', 'Lasagna', 'Macaron', 'Quiche Lorraine', 'Japanese Cheesecake');

-- Breads and Pastries
UPDATE recipes
SET tools = 'oven, baking sheet, mixing bowl, dough cutter, proofing basket, pastry brush'
WHERE name IN ('Indian Curry', 'Italian Biscotti');

-- Grilled Meats and Barbecue
UPDATE recipes
SET tools = 'grill, tong, basting brush, grill fork, charcoal, meat thermometer'
WHERE name IN ('Ayam Percik', 'Beef Wellington', 'Fajitas', 'Jerk Chicken', 'Kebab', 'Oysters Kilpatrick', 'Jerk Chicken (Jamaican)');

-- General Cooking and Stir Frying
UPDATE recipes
SET tools = 'stovetop, frying pan, spatula, ladle, chefs knife, cutting board'
WHERE name IN ('Apam balik', 'Chicken Congee', 'Dakdoritang', 'Dum Aloo', 'Falafel', 'Fish and Chips', 'Goulash', 'Hot and Sour Soup', 'Hummus', 'Kimchi Fried Rice', 'Mapo Tofu', 'Nasi Goreng', 'Nachos', 'Pierogi', 'Ratatouille', 'Risotto', 'Ramen', 'Samosa', 'Sushi', 'Tacos', 'Udon Soup', 'Vietnamese Pho', 'Xinjiang Lamb Skewers');

-- Steaming
UPDATE recipes
SET tools = 'steamer basket, pot, chefs knife, cutting board'
WHERE name IN ('Xiaolongbao', 'Chicken Congee');

-- Deep Frying
UPDATE recipes
SET tools = 'deep fryer, slotted spoon, thermometer, paper towel'
WHERE name IN ('Falafel', 'Fish and Chips');

-- Slow Cooking or Simmering
UPDATE recipes
SET tools = 'slow cooker, ladle, meat thermometer'
WHERE name IN ('Irish stew', 'Lamb Tagine', 'Venison Stew', 'Welsh Rarebit', 'Ukrainian borscht', 'Moussaka');

-- No Heat Preparation (Salads and Cold Dishes)
UPDATE recipes
SET tools = 'mixing bowl, chopping board, chefs knife, salad spinner, measuring spoon'
WHERE name IN ('Greek Salad', 'Gazpacho', 'Waldorf Salad', 'Tabbouleh', 'Quinoa Salad');

-- Desserts Requiring Delicate Preparation
UPDATE recipes
SET tools = 'mixing bowl, measuring cup, measuring spoon, mixer, dessert cups'
WHERE name IN ('Tiramisu', 'Eton Mess', 'Nougat', 'Venison Stew');

-- For pastry dishes that involve baking
UPDATE recipes
SET tools = 'mixing bowl, baking dish, whisk, oven, pastry brush'
WHERE name IN ('Apple & Blackberry Crumble', 'Irish Coffee', 'Kaiserschmarrn');

-- For cooking dishes that involve simmering or stewing
UPDATE recipes
SET tools = 'pot, ladle, chefs knife, cutting board, stirring spoon'
WHERE name IN ('Caldo verde', 'Jambalaya', 'Japanese Curry', 'Lobster Bisque', 'Osso Buco', 'Okonomiyaki', 'Paella', 'Peking Duck', 'Shepherds Pie', 'Umbrian Lentil Stew', 'Vegetable Terrine', 'Kimchi Stew');

-- For dishes involving grilling or pan-frying
UPDATE recipes
SET tools = 'grill, tong, spatula, cutting board, meat thermometer'
WHERE name IN ('Hamburgers', 'Wiener Schnitzel');

-- For dishes that are made using a griddle or shallow frying
UPDATE recipes
SET tools = 'frying pan, spatula, chefs knife, cutting board'
WHERE name = 'Quesadilla';

DROP TABLE tools;

CREATE TABLE tools (
    name VARCHAR(64),
    usage VARCHAR(256),
    PRIMARY KEY (name)
);

INSERT INTO tools (name, usage) VALUES
('oven', 'Used for baking and roasting foods.'),
('mixing bowl', 'Used for combining ingredients.'),
('cake mold', 'Used to shape cakes during baking.'),
('rolling pin', 'Used to flatten dough.'),
('pastry brush', 'Used to apply sauces, glazes, or butters.'),
('measuring spoon', 'Used to measure small quantities of ingredients.'),
('baking sheet', 'Flat sheet used to bake products in the oven.'),
('dough cutter', 'Used to cut or portion dough.'),
('proofing basket', 'Used to shape and proof bread dough.');

-- Grilling Tools
INSERT INTO tools (name, usage) VALUES
('grill', 'Used for cooking foods with direct heat.'),
('tong', 'Used to grip and lift food while cooking or serving.'),
('basting brush', 'Used to baste foods with liquids or sauces.'),
('grill fork', 'Used to turn and lift food on a grill.'),
('charcoal', 'Used as a heat source for grilling.'),
('meat thermometer', 'Used to check the internal temperature of meats.');

-- General Cooking Tools
INSERT INTO tools (name, usage) VALUES
('stovetop', 'Used for heating and cooking foods.'),
('frying pan', 'Used for frying, searing, and browning foods.'),
('spatula', 'Used for flipping foods or scraping bowls.'),
('ladle', 'Used for serving liquid dishes like soups or stews.'),
('chefs knife', 'All-purpose knife used for chopping, slicing, and mincing.'),
('cutting board', 'Used as a protective surface for cutting.');

-- Steaming Tools
INSERT INTO tools (name, usage) VALUES
('steamer basket', 'Used to steam food by holding it above boiling water.'),
('pot', 'Used for cooking over direct heat or boiling.');

-- Deep Frying Tools
INSERT INTO tools (name, usage) VALUES
('deep fryer', 'Used to cook food by submerging it in hot oil.'),
('slotted spoon', 'Used to remove foods from liquids while draining them.'),
('thermometer', 'Used to measure the temperature of cooking mediums.'),
('paper towel', 'Used to drain excess oil from fried foods.');

-- Slow Cooking Tools
INSERT INTO tools (name, usage) VALUES
('slow cooker', 'Used for slow cooking of foods over several hours.');

-- No Heat Preparation Tools
INSERT INTO tools (name, usage) VALUES
('salad spinner', 'Used to wash and remove excess water from salad greens.');

-- Delicate Preparation Tools
INSERT INTO tools (name, usage) VALUES
('measuring cup', 'Used to measure larger quantities of ingredients.'),
('mixer', 'Used to mix, beat, and whip ingredients.'),
('dessert cups', 'Used to serve or prepare individual desserts.');

-- Additional Cooking and Baking Tools
INSERT INTO tools (name, usage) VALUES
('baking dish', 'Used for baking a variety of dishes in the oven.'),
('whisk', 'Used for whisking or beating to incorporate air into mixtures.'),
('stirring spoon', 'Used for stirring foods while cooking.');

DROP TABLE recipes_tools;

CREATE TABLE recipes_tools (
    recipeName VARCHAR(64),
    toolName VARCHAR(64),
    PRIMARY KEY (recipeName,toolName),
    FOREIGN KEY (recipeName) REFERENCES recipes(name),
    FOREIGN KEY (toolName) REFERENCES tools(name)
);

INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Apple Frangipan Tart', 'oven'),
('Apple Frangipan Tart', 'mixing bowl'),
('Apple Frangipan Tart', 'cake mold'),
('Apple Frangipan Tart', 'rolling pin'),
('Apple Frangipan Tart', 'pastry brush'),
('Apple Frangipan Tart', 'measuring spoon'),

('Bakewell tart', 'oven'),
('Bakewell tart', 'mixing bowl'),
('Bakewell tart', 'cake mold'),
('Bakewell tart', 'rolling pin'),
('Bakewell tart', 'pastry brush'),
('Bakewell tart', 'measuring spoon'),

('Beef Wellington', 'oven'),
('Beef Wellington', 'mixing bowl'),
('Beef Wellington', 'cake mold'),
('Beef Wellington', 'rolling pin'),
('Beef Wellington', 'pastry brush'),
('Beef Wellington', 'measuring spoon'),

('Banana Pancakes', 'oven'),
('Banana Pancakes', 'mixing bowl'),
('Banana Pancakes', 'cake mold'),
('Banana Pancakes', 'rolling pin'),
('Banana Pancakes', 'pastry brush'),
('Banana Pancakes', 'measuring spoon'),

('Cannelloni', 'oven'),
('Cannelloni', 'mixing bowl'),
('Cannelloni', 'cake mold'),
('Cannelloni', 'rolling pin'),
('Cannelloni', 'pastry brush'),
('Cannelloni', 'measuring spoon'),

('Danish Pastry', 'oven'),
('Danish Pastry', 'mixing bowl'),
('Danish Pastry', 'cake mold'),
('Danish Pastry', 'rolling pin'),
('Danish Pastry', 'pastry brush'),
('Danish Pastry', 'measuring spoon'),

('Eclairs', 'oven'),
('Eclairs', 'mixing bowl'),
('Eclairs', 'cake mold'),
('Eclairs', 'rolling pin'),
('Eclairs', 'pastry brush'),
('Eclairs', 'measuring spoon'),

('English Breakfast', 'oven'),
('English Breakfast', 'mixing bowl'),
('English Breakfast', 'cake mold'),
('English Breakfast', 'rolling pin'),
('English Breakfast', 'pastry brush'),
('English Breakfast', 'measuring spoon'),

('Key Lime Pie', 'oven'),
('Key Lime Pie', 'mixing bowl'),
('Key Lime Pie', 'cake mold'),
('Key Lime Pie', 'rolling pin'),
('Key Lime Pie', 'pastry brush'),
('Key Lime Pie', 'measuring spoon');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Lasagna', 'oven'),
('Lasagna', 'mixing bowl'),
('Lasagna', 'cake mold'),
('Lasagna', 'rolling pin'),
('Lasagna', 'pastry brush'),
('Lasagna', 'measuring spoon'),

('Macaron', 'oven'),
('Macaron', 'mixing bowl'),
('Macaron', 'cake mold'),
('Macaron', 'rolling pin'),
('Macaron', 'pastry brush'),
('Macaron', 'measuring spoon'),

('Quiche Lorraine', 'oven'),
('Quiche Lorraine', 'mixing bowl'),
('Quiche Lorraine', 'cake mold'),
('Quiche Lorraine', 'rolling pin'),
('Quiche Lorraine', 'pastry brush'),
('Quiche Lorraine', 'measuring spoon'),

('Japanese Cheesecake', 'oven'),
('Japanese Cheesecake', 'mixing bowl'),
('Japanese Cheesecake', 'cake mold'),
('Japanese Cheesecake', 'rolling pin'),
('Japanese Cheesecake', 'pastry brush'),
('Japanese Cheesecake', 'measuring spoon'),

-- Breads and Pastries
('Indian Curry', 'oven'),
('Indian Curry', 'baking sheet'),
('Indian Curry', 'mixing bowl'),
('Indian Curry', 'dough cutter'),
('Indian Curry', 'proofing basket'),
('Indian Curry', 'pastry brush'),

('Italian Biscotti', 'oven'),
('Italian Biscotti', 'baking sheet'),
('Italian Biscotti', 'mixing bowl'),
('Italian Biscotti', 'dough cutter'),
('Italian Biscotti', 'proofing basket'),
('Italian Biscotti', 'pastry brush'),

-- Grilled Meats and Barbecue
('Ayam Percik', 'grill'),
('Ayam Percik', 'tong'),
('Ayam Percik', 'basting brush'),
('Ayam Percik', 'grill fork'),
('Ayam Percik', 'charcoal'),
('Ayam Percik', 'meat thermometer'),

('Beef Wellington', 'grill'),
('Beef Wellington', 'tong'),
('Beef Wellington', 'basting brush'),
('Beef Wellington', 'grill fork'),
('Beef Wellington', 'charcoal'),
('Beef Wellington', 'meat thermometer'),

('Fajitas', 'grill'),
('Fajitas', 'tong'),
('Fajitas', 'basting brush'),
('Fajitas', 'grill fork'),
('Fajitas', 'charcoal'),
('Fajitas', 'meat thermometer'),

('Jerk Chicken', 'grill'),
('Jerk Chicken', 'tong'),
('Jerk Chicken', 'basting brush'),
('Jerk Chicken', 'grill fork'),
('Jerk Chicken', 'charcoal'),
('Jerk Chicken', 'meat thermometer'),

('Kebab', 'grill'),
('Kebab', 'tong'),
('Kebab', 'basting brush'),
('Kebab', 'grill fork'),
('Kebab', 'charcoal'),
('Kebab', 'meat thermometer'),

('Oysters Kilpatrick', 'grill'),
('Oysters Kilpatrick', 'tong'),
('Oysters Kilpatrick', 'basting brush'),
('Oysters Kilpatrick', 'grill fork'),
('Oysters Kilpatrick', 'charcoal'),
('Oysters Kilpatrick', 'meat thermometer'),

-- General Cooking and Stir Frying
('Apam balik', 'stovetop'),
('Apam balik', 'frying pan'),
('Apam balik', 'spatula'),
('Apam balik', 'ladle'),
('Apam balik', 'chefs knife'),
('Apam balik', 'cutting board'),

('Chicken Congee', 'stovetop'),
('Chicken Congee', 'frying pan'),
('Chicken Congee', 'spatula'),
('Chicken Congee', 'ladle'),
('Chicken Congee', 'chefs knife'),
('Chicken Congee', 'cutting board'),

('Dakdoritang', 'stovetop'),
('Dakdoritang', 'frying pan'),
('Dakdoritang', 'spatula'),
('Dakdoritang', 'ladle'),
('Dakdoritang', 'chefs knife'),
('Dakdoritang', 'cutting board'),

('Dum Aloo', 'stovetop'),
('Dum Aloo', 'frying pan'),
('Dum Aloo', 'spatula'),
('Dum Aloo', 'ladle'),
('Dum Aloo', 'chefs knife'),
('Dum Aloo', 'cutting board');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Falafel', 'stovetop'),
('Falafel', 'frying pan'),
('Falafel', 'spatula'),
('Falafel', 'ladle'),
('Falafel', 'chefs knife'),
('Falafel', 'cutting board'),

('Fish and Chips', 'stovetop'),
('Fish and Chips', 'frying pan'),
('Fish and Chips', 'spatula'),
('Fish and Chips', 'ladle'),
('Fish and Chips', 'chefs knife'),
('Fish and Chips', 'cutting board'),

('Goulash', 'stovetop'),
('Goulash', 'frying pan'),
('Goulash', 'spatula'),
('Goulash', 'ladle'),
('Goulash', 'chefs knife'),
('Goulash', 'cutting board'),

('Hot and Sour Soup', 'stovetop'),
('Hot and Sour Soup', 'frying pan'),
('Hot and Sour Soup', 'spatula'),
('Hot and Sour Soup', 'ladle'),
('Hot and Sour Soup', 'chefs knife'),
('Hot and Sour Soup', 'cutting board'),

('Hummus', 'stovetop'),
('Hummus', 'frying pan'),
('Hummus', 'spatula'),
('Hummus', 'ladle'),
('Hummus', 'chefs knife'),
('Hummus', 'cutting board'),

('Kimchi Fried Rice', 'stovetop'),
('Kimchi Fried Rice', 'frying pan'),
('Kimchi Fried Rice', 'spatula'),
('Kimchi Fried Rice', 'ladle'),
('Kimchi Fried Rice', 'chefs knife'),
('Kimchi Fried Rice', 'cutting board'),

('Mapo Tofu', 'stovetop'),
('Mapo Tofu', 'frying pan'),
('Mapo Tofu', 'spatula'),
('Mapo Tofu', 'ladle'),
('Mapo Tofu', 'chefs knife'),
('Mapo Tofu', 'cutting board'),

('Nasi Goreng', 'stovetop'),
('Nasi Goreng', 'frying pan'),
('Nasi Goreng', 'spatula'),
('Nasi Goreng', 'ladle'),
('Nasi Goreng', 'chefs knife'),
('Nasi Goreng', 'cutting board'),

('Nachos', 'stovetop'),
('Nachos', 'frying pan'),
('Nachos', 'spatula'),
('Nachos', 'ladle'),
('Nachos', 'chefs knife'),
('Nachos', 'cutting board'),

('Pierogi', 'stovetop'),
('Pierogi', 'frying pan'),
('Pierogi', 'spatula'),
('Pierogi', 'ladle'),
('Pierogi', 'chefs knife'),
('Pierogi', 'cutting board');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Ratatouille', 'stovetop'),
('Ratatouille', 'frying pan'),
('Ratatouille', 'spatula'),
('Ratatouille', 'ladle'),
('Ratatouille', 'chefs knife'),
('Ratatouille', 'cutting board');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Risotto', 'stovetop'),
('Risotto', 'frying pan'),
('Risotto', 'spatula'),
('Risotto', 'ladle'),
('Risotto', 'chefs knife'),
('Risotto', 'cutting board');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Ramen', 'stovetop'),
('Ramen', 'frying pan'),
('Ramen', 'spatula'),
('Ramen', 'ladle'),
('Ramen', 'chefs knife'),
('Ramen', 'cutting board');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Samosa', 'stovetop'),
('Samosa', 'frying pan'),
('Samosa', 'spatula'),
('Samosa', 'ladle'),
('Samosa', 'chefs knife'),
('Samosa', 'cutting board');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Sushi', 'stovetop'),
('Sushi', 'frying pan'),
('Sushi', 'spatula'),
('Sushi', 'ladle'),
('Sushi', 'chefs knife'),
('Sushi', 'cutting board');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Tacos', 'stovetop'),
('Tacos', 'frying pan'),
('Tacos', 'spatula'),
('Tacos', 'ladle'),
('Tacos', 'chefs knife'),
('Tacos', 'cutting board');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Udon Soup', 'stovetop'),
('Udon Soup', 'frying pan'),
('Udon Soup', 'spatula'),
('Udon Soup', 'ladle'),
('Udon Soup', 'chefs knife'),
('Udon Soup', 'cutting board');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Vietnamese Pho', 'stovetop'),
('Vietnamese Pho', 'frying pan'),
('Vietnamese Pho', 'spatula'),
('Vietnamese Pho', 'ladle'),
('Vietnamese Pho', 'chefs knife'),
('Vietnamese Pho', 'cutting board');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Xinjiang Lamb Skewers', 'stovetop'),
('Xinjiang Lamb Skewers', 'frying pan'),
('Xinjiang Lamb Skewers', 'spatula'),
('Xinjiang Lamb Skewers', 'ladle'),
('Xinjiang Lamb Skewers', 'chefs knife'),
('Xinjiang Lamb Skewers', 'cutting board');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Xiaolongbao', 'steamer basket'),
('Xiaolongbao', 'pot'),
('Xiaolongbao', 'chefs knife'),
('Xiaolongbao', 'cutting board');

INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Falafel', 'deep fryer'),
('Falafel', 'slotted spoon'),
('Falafel', 'thermometer'),
('Falafel', 'paper towel');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Fish and Chips', 'deep fryer'),
('Fish and Chips', 'slotted spoon'),
('Fish and Chips', 'thermometer'),
('Fish and Chips', 'paper towel');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Irish stew', 'slow cooker'),
('Irish stew', 'ladle'),
('Irish stew', 'meat thermometer');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Lamb Tagine', 'slow cooker'),
('Lamb Tagine', 'ladle'),
('Lamb Tagine', 'meat thermometer');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Venison Stew', 'slow cooker'),
('Venison Stew', 'ladle'),
('Venison Stew', 'meat thermometer');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Welsh Rarebit', 'slow cooker'),
('Welsh Rarebit', 'ladle'),
('Welsh Rarebit', 'meat thermometer');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Ukrainian borscht', 'slow cooker'),
('Ukrainian borscht', 'ladle'),
('Ukrainian borscht', 'meat thermometer');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Moussaka', 'slow cooker'),
('Moussaka', 'ladle'),
('Moussaka', 'meat thermometer');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Greek Salad', 'mixing bowl'),
('Greek Salad', 'chopping board'),
('Greek Salad', 'chefs knife'),
('Greek Salad', 'salad spinner'),
('Greek Salad', 'measuring spoon'),

('Gazpacho', 'mixing bowl'),
('Gazpacho', 'chopping board'),
('Gazpacho', 'chefs knife'),
('Gazpacho', 'salad spinner'),
('Gazpacho', 'measuring spoon'),

('Waldorf Salad', 'mixing bowl'),
('Waldorf Salad', 'chopping board'),
('Waldorf Salad', 'chefs knife'),
('Waldorf Salad', 'salad spinner'),
('Waldorf Salad', 'measuring spoon'),

('Tabbouleh', 'mixing bowl'),
('Tabbouleh', 'chopping board'),
('Tabbouleh', 'chefs knife'),
('Tabbouleh', 'salad spinner'),
('Tabbouleh', 'measuring spoon'),

('Quinoa Salad', 'mixing bowl'),
('Quinoa Salad', 'chopping board'),
('Quinoa Salad', 'chefs knife'),
('Quinoa Salad', 'salad spinner'),
('Quinoa Salad', 'measuring spoon'),

('Tiramisu', 'mixing bowl'),
('Tiramisu', 'measuring cup'),
('Tiramisu', 'measuring spoon'),
('Tiramisu', 'mixer'),
('Tiramisu', 'dessert cups'),

('Eton Mess', 'mixing bowl'),
('Eton Mess', 'measuring cup'),
('Eton Mess', 'measuring spoon'),
('Eton Mess', 'mixer'),
('Eton Mess', 'dessert cups'),

('Nougat', 'mixing bowl'),
('Nougat', 'measuring cup'),
('Nougat', 'measuring spoon'),
('Nougat', 'mixer'),
('Nougat', 'dessert cups'),

('Venison Stew', 'mixing bowl'),
('Venison Stew', 'measuring cup'),
('Venison Stew', 'measuring spoon'),
('Venison Stew', 'mixer'),
('Venison Stew', 'dessert cups'),

('Apple & Blackberry Crumble', 'mixing bowl'),
('Apple & Blackberry Crumble', 'baking dish'),
('Apple & Blackberry Crumble', 'whisk'),
('Apple & Blackberry Crumble', 'oven'),
('Apple & Blackberry Crumble', 'pastry brush'),

('Irish Coffee', 'mixing bowl'),
('Irish Coffee', 'baking dish'),
('Irish Coffee', 'whisk'),
('Irish Coffee', 'oven'),
('Irish Coffee', 'pastry brush'),

('Kaiserschmarrn', 'mixing bowl'),
('Kaiserschmarrn', 'baking dish'),
('Kaiserschmarrn', 'whisk'),
('Kaiserschmarrn', 'oven'),
('Kaiserschmarrn', 'pastry brush'),

('Caldo verde', 'pot'),
('Caldo verde', 'ladle'),
('Caldo verde', 'chefs knife'),
('Caldo verde', 'cutting board'),
('Caldo verde', 'stirring spoon'),

('Jambalaya', 'pot'),
('Jambalaya', 'ladle'),
('Jambalaya', 'chefs knife'),
('Jambalaya', 'cutting board'),
('Jambalaya', 'stirring spoon');
INSERT INTO recipes_tools (recipeName, toolName) VALUES
('Japanese Curry', 'pot'),
('Japanese Curry', 'ladle'),
('Japanese Curry', 'chefs knife'),
('Japanese Curry', 'cutting board'),
('Japanese Curry', 'stirring spoon'),

('Lobster Bisque', 'pot'),
('Lobster Bisque', 'ladle'),
('Lobster Bisque', 'chefs knife'),
('Lobster Bisque', 'cutting board'),
('Lobster Bisque', 'stirring spoon'),

('Osso Buco', 'pot'),
('Osso Buco', 'ladle'),
('Osso Buco', 'chefs knife'),
('Osso Buco', 'cutting board'),
('Osso Buco', 'stirring spoon'),

('Okonomiyaki', 'pot'),
('Okonomiyaki', 'ladle'),
('Okonomiyaki', 'chefs knife'),
('Okonomiyaki', 'cutting board'),
('Okonomiyaki', 'stirring spoon'),

('Paella', 'pot'),
('Paella', 'ladle'),
('Paella', 'chefs knife'),
('Paella', 'cutting board'),
('Paella', 'stirring spoon'),

('Peking Duck', 'pot'),
('Peking Duck', 'ladle'),
('Peking Duck', 'chefs knife'),
('Peking Duck', 'cutting board'),
('Peking Duck', 'stirring spoon'),

('Shepherds Pie', 'pot'),
('Shepherds Pie', 'ladle'),
('Shepherds Pie', 'chefs knife'),
('Shepherds Pie', 'cutting board'),
('Shepherds Pie', 'stirring spoon'),

('Umbrian Lentil Stew', 'pot'),
('Umbrian Lentil Stew', 'ladle'),
('Umbrian Lentil Stew', 'chefs knife'),
('Umbrian Lentil Stew', 'cutting board'),
('Umbrian Lentil Stew', 'stirring spoon'),

('Vegetable Terrine', 'pot'),
('Vegetable Terrine', 'ladle'),
('Vegetable Terrine', 'chefs knife'),
('Vegetable Terrine', 'cutting board'),
('Vegetable Terrine', 'stirring spoon'),

('Kimchi Stew', 'pot'),
('Kimchi Stew', 'ladle'),
('Kimchi Stew', 'chefs knife'),
('Kimchi Stew', 'cutting board'),
('Kimchi Stew', 'stirring spoon'),

('Hamburgers', 'grill'),
('Hamburgers', 'tong'),
('Hamburgers', 'spatula'),
('Hamburgers', 'cutting board'),
('Hamburgers', 'meat thermometer'),

('Wiener Schnitzel', 'grill'),
('Wiener Schnitzel', 'tong'),
('Wiener Schnitzel', 'spatula'),
('Wiener Schnitzel', 'cutting board'),
('Wiener Schnitzel', 'meat thermometer'),

('Quesadilla', 'frying pan'),
('Quesadilla', 'spatula'),
('Quesadilla', 'chefs knife'),
('Quesadilla', 'cutting board');


DROP TABLE recipes_ingredients;
CREATE TABLE recipes_ingredients (
    recipeName VARCHAR(64),
    ingredientName VARCHAR(64),
    quantity VARCHAR(64),
    PRIMARY KEY (recipeName, ingredientName),
    FOREIGN KEY (recipeName) REFERENCES recipes(name)
);

INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Apple Frangipan Tart', 'Apples', '3 medium'),
('Apple Frangipan Tart', 'Frangipane', '200g'),
('Apple Frangipan Tart', 'Pastry crust', '1 unit');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Bakewell tart', 'Jam', '150g'),
('Bakewell tart', 'Frangipane', '200g'),
('Bakewell tart', 'Pastry crust', '1 unit');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Beef Wellington', 'Beef fillet', '500g'),
('Beef Wellington', 'Puff pastry', '500g'),
('Beef Wellington', 'Mushroom duxelles', '200g');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Banana Pancakes', 'Bananas', '2 large'),
('Banana Pancakes', 'Flour', '200g'),
('Banana Pancakes', 'Eggs', '2 large');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Cannelloni', 'Cannelloni tubes', '12 units'),
('Cannelloni', 'Ricotta cheese', '250g'),
('Cannelloni', 'Spinach', '200g');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Danish Pastry', 'Flour', '500g'),
('Danish Pastry', 'Butter', '250g'),
('Danish Pastry', 'Sugar', '100g');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Eclairs', 'Choux pastry', '1 batch'),
('Eclairs', 'Pastry cream', '200g'),
('Eclairs', 'Chocolate glaze', '100g');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('English Breakfast', 'Eggs', '4 large'),
('English Breakfast', 'Bacon', '4 slices'),
('English Breakfast', 'Sausages', '2 units');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Key Lime Pie', 'Lime juice', '100ml'),
('Key Lime Pie', 'Condensed milk', '1 can'),
('Key Lime Pie', 'Graham cracker crust', '1 unit');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Lasagna', 'Lasagna noodles', '12 sheets'),
('Lasagna', 'Ricotta cheese', '500g'),
('Lasagna', 'Marinara sauce', '600g');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Macaron', 'Almond flour', '200g'),
('Macaron', 'Granulated sugar', '200g'),
('Macaron', 'Egg whites', '3 large');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Quiche Lorraine', 'Pastry crust', '1 unit'),
('Quiche Lorraine', 'Bacon', '200g'),
('Quiche Lorraine', 'Eggs', '3 large');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Japanese Cheesecake', 'Cream cheese', '250g'),
('Japanese Cheesecake', 'Eggs', '3 large'),
('Japanese Cheesecake', 'Sugar', '100g');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
-- Breads and Pastries
('Indian Curry', 'Chicken', '500g'),
('Indian Curry', 'Curry powder', '2 tbsp'),
('Indian Curry', 'Coconut milk', '400ml');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Italian Biscotti', 'Flour', '300g'),
('Italian Biscotti', 'Sugar', '150g'),
('Italian Biscotti', 'Almonds', '100g');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
-- Grilled Meats and Barbecue
('Ayam Percik', 'Chicken', '1 kg'),
('Ayam Percik', 'Coconut milk', '200ml'),
('Ayam Percik', 'Lemongrass', '2 stalks');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
-- General Cooking and Stir Frying
('Apam balik', 'Flour', '200g'),
('Apam balik', 'Eggs', '2 large'),
('Apam balik', 'Peanut filling', '100g');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Chicken Congee', 'Rice', '200g'),
('Chicken Congee', 'Chicken breast', '300g'),
('Chicken Congee', 'Ginger', '20g');

INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Dakdoritang', 'Chicken', '1 kg'),
('Dakdoritang', 'Potatoes', '3 medium'),
('Dakdoritang', 'Carrots', '2 large'),
('Dakdoritang', 'Gochujang (Korean chili paste)', '3 tbsp'),
('Dakdoritang', 'Soy sauce', '50 ml'),
('Dakdoritang', 'Garlic', '5 cloves'),

('Dum Aloo', 'Potatoes', '500g'),
('Dum Aloo', 'Tomatoes', '200g'),
('Dum Aloo', 'Onion', '1 large'),
('Dum Aloo', 'Cumin seeds', '1 tsp'),
('Dum Aloo', 'Garam Masala', '1 tsp'),

('Falafel', 'Chickpeas', '400g (drained)'),
('Falafel', 'Onion', '1 small'),
('Falafel', 'Garlic', '3 cloves'),
('Falafel', 'Parsley', '50g'),
('Falafel', 'Cumin', '2 tsp'),

('Fish and Chips', 'White fish fillets', '4 large'),
('Fish and Chips', 'Flour', '150g'),
('Fish and Chips', 'Beer', '250ml'),
('Fish and Chips', 'Potatoes', '4 large'),

('Goulash', 'Beef', '500g'),
('Goulash', 'Onions', '2 large'),
('Goulash', 'Bell peppers', '2'),
('Goulash', 'Paprika', '2 tbsp'),
('Goulash', 'Tomatoes', '400g (canned)'),

('Hot and Sour Soup', 'Bamboo shoots', '100g'),
('Hot and Sour Soup', 'Tofu', '200g'),
('Hot and Sour Soup', 'Shiitake mushrooms', '100g'),
('Hot and Sour Soup', 'Chicken broth', '1.5 liters'),
('Hot and Sour Soup', 'Soy sauce', '3 tbsp'),
('Hot and Sour Soup', 'Rice vinegar', '3 tbsp'),

('Hummus', 'Chickpeas', '400g (drained)'),
('Hummus', 'Tahini', '100g'),
('Hummus', 'Lemon juice', '50ml'),
('Hummus', 'Garlic', '2 cloves'),
('Hummus', 'Olive oil', '50ml'),

('Kimchi Fried Rice', 'Cooked rice', '400g'),
('Kimchi Fried Rice', 'Kimchi', '200g'),
('Kimchi Fried Rice', 'Onion', '1 medium'),
('Kimchi Fried Rice', 'Sesame oil', '2 tbsp'),
('Kimchi Fried Rice', 'Eggs', '2'),

('Mapo Tofu', 'Tofu', '400g'),
('Mapo Tofu', 'Ground pork', '150g'),
('Mapo Tofu', 'Doubanjiang (fermented bean paste)', '2 tbsp'),
('Mapo Tofu', 'Garlic', '3 cloves'),
('Mapo Tofu', 'Green onion', '3 stalks'),

('Nasi Goreng', 'Cooked rice', '400g'),
('Nasi Goreng', 'Chicken', '200g'),
('Nasi Goreng', 'Kecap Manis (sweet soy sauce)', '3 tbsp'),
('Nasi Goreng', 'Shallots', '2'),
('Nasi Goreng', 'Garlic', '2 cloves'),
('Nasi Goreng', 'Eggs', '2'),

('Nachos', 'Tortilla chips', '300g'),
('Nachos', 'Cheddar cheese', '200g'),
('Nachos', 'Jalapenos', '50g'),
('Nachos', 'Ground beef', '200g'),
('Nachos', 'Salsa', '100g'),

('Pierogi', 'Flour', '500g'),
('Pierogi', 'Egg', '1 large'),
('Pierogi', 'Potato', '300g'),
('Pierogi', 'Cheese', '100g'),
('Pierogi', 'Onion', '1 medium');

INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Ratatouille', 'Eggplant', '1 large'),
('Ratatouille', 'Zucchini', '1 large'),
('Ratatouille', 'Yellow squash', '1 large'),
('Ratatouille', 'Bell peppers', '2'),
('Ratatouille', 'Tomato', '3 medium'),
('Ratatouille', 'Onion', '1 large'),
('Ratatouille', 'Garlic', '3 cloves');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Risotto', 'Arborio rice', '200g'),
('Risotto', 'Chicken stock', '800ml'),
('Risotto', 'Onion', '1 small'),
('Risotto', 'White wine', '100ml'),
('Risotto', 'Parmesan cheese', '50g'),
('Risotto', 'Butter', '50g');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Ramen', 'Ramen noodles', '400g'),
('Ramen', 'Chicken broth', '1.5 liters'),
('Ramen', 'Soy sauce', '50ml'),
('Ramen', 'Sesame oil', '2 tbsp'),
('Ramen', 'Green onions', '4 stalks'),
('Ramen', 'Eggs', '4');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Samosa', 'Potatoes', '300g'),
('Samosa', 'Green peas', '150g'),
('Samosa', 'Cumin seeds', '1 tsp'),
('Samosa', 'Garam masala', '1 tsp'),
('Samosa', 'Pastry dough', '500g');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Sushi', 'Sushi rice', '500g'),
('Sushi', 'Nori sheets', '5'),
('Sushi', 'Rice vinegar', '50ml'),
('Sushi', 'Soy sauce', 'for dipping'),
('Sushi', 'Fresh fish (various)', '300g'),
('Sushi', 'Wasabi', 'according to taste');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Tacos', 'Corn tortillas', '12'),
('Tacos', 'Ground beef', '500g'),
('Tacos', 'Onion', '1 medium'),
('Tacos', 'Tomatoes', '2 large'),
('Tacos', 'Cheddar cheese', '100g'),
('Tacos', 'Lettuce', '1 head');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Udon Soup', 'Udon noodles', '400g'),
('Udon Soup', 'Dashi broth', '1 liter'),
('Udon Soup', 'Soy sauce', '3 tbsp'),
('Udon Soup', 'Mirin', '2 tbsp'),
('Udon Soup', 'Green onions', '3 stalks'),
('Udon Soup', 'Mushrooms', '100g');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Vietnamese Pho', 'Rice noodles', '400g'),
('Vietnamese Pho', 'Beef brisket', '500g'),
('Vietnamese Pho', 'Onion', '1 large'),
('Vietnamese Pho', 'Ginger', '50g'),
('Vietnamese Pho', 'Star anise', '5 pods'),
('Vietnamese Pho', 'Fish sauce', '3 tbsp');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Xinjiang Lamb Skewers', 'Lamb', '500g'),
('Xinjiang Lamb Skewers', 'Cumin seeds', '2 tbsp'),
('Xinjiang Lamb Skewers', 'Paprika', '1 tbsp'),
('Xinjiang Lamb Skewers', 'Garlic powder', '1 tsp'),
('Xinjiang Lamb Skewers', 'Salt', '1 tsp');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Xiaolongbao', 'Flour', '500g'),
('Xiaolongbao', 'Ground pork', '300g'),
('Xiaolongbao', 'Ginger', '20g'),
('Xiaolongbao', 'Green onions', '50g'),
('Xiaolongbao', 'Soy sauce', '3 tbsp');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Irish stew', 'Lamb shoulder', '500g'),
('Irish stew', 'Potatoes', '500g'),
('Irish stew', 'Carrots', '200g'),
('Irish stew', 'Onions', '2 large'),
('Irish stew', 'Beef stock', '1 liter');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Lamb Tagine', 'Lamb shoulder', '500g'),
('Lamb Tagine', 'Onions', '2'),
('Lamb Tagine', 'Garlic', '3 cloves'),
('Lamb Tagine', 'Dried apricots', '100g'),
('Lamb Tagine', 'Cinnamon', '1 stick');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Venison Stew', 'Venison', '500g'),
('Venison Stew', 'Potatoes', '300g'),
('Venison Stew', 'Carrots', '200g'),
('Venison Stew', 'Onions', '2'),
('Venison Stew', 'Beef stock', '1 liter');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Welsh Rarebit', 'Cheddar cheese', '200g'),
('Welsh Rarebit', 'Beer', '100ml'),
('Welsh Rarebit', 'Worcestershire sauce', '2 tbsp'),
('Welsh Rarebit', 'Mustard', '1 tsp'),
('Welsh Rarebit', 'Bread', '4 slices');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Ukrainian borscht', 'Beetroot', '500g'),
('Ukrainian borscht', 'Cabbage', '200g'),
('Ukrainian borscht', 'Potatoes', '300g'),
('Ukrainian borscht', 'Carrots', '2'),
('Ukrainian borscht', 'Onions', '1'),
('Ukrainian borscht', 'Tomato paste', '2 tbsp');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Moussaka', 'Eggplant', '2 large'),
('Moussaka', 'Ground lamb', '500g'),
('Moussaka', 'Tomatoes', '400g (canned)'),
('Moussaka', 'Bechamel sauce', '500ml'),
('Moussaka', 'Onion', '1 large');

INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Greek Salad', 'Cucumber', '1 large'),
('Greek Salad', 'Tomatoes', '3 medium'),
('Greek Salad', 'Red onion', '1 small'),
('Greek Salad', 'Kalamata olives', '100g'),
('Greek Salad', 'Feta cheese', '200g'),
('Greek Salad', 'Olive oil', '50ml'),

('Gazpacho', 'Tomatoes', '500g'),
('Gazpacho', 'Cucumber', '1 medium'),
('Gazpacho', 'Bell pepper', '1'),
('Gazpacho', 'Red onion', '1 small'),
('Gazpacho', 'Garlic', '2 cloves'),
('Gazpacho', 'Olive oil', '50ml'),
('Gazpacho', 'Vinegar', '2 tbsp'),

('Waldorf Salad', 'Apples', '2 large'),
('Waldorf Salad', 'Celery', '100g'),
('Waldorf Salad', 'Walnuts', '50g'),
('Waldorf Salad', 'Mayonnaise', '100ml'),
('Waldorf Salad', 'Lemon juice', '1 tbsp'),

('Tabbouleh', 'Bulgur', '100g'),
('Tabbouleh', 'Parsley', '200g'),
('Tabbouleh', 'Mint', '50g'),
('Tabbouleh', 'Tomatoes', '3 medium'),
('Tabbouleh', 'Lemon juice', '3 tbsp'),
('Tabbouleh', 'Olive oil', '50ml'),

('Quinoa Salad', 'Quinoa', '200g'),
('Quinoa Salad', 'Cucumber', '1 medium'),
('Quinoa Salad', 'Cherry tomatoes', '150g'),
('Quinoa Salad', 'Red onion', '1 small'),
('Quinoa Salad', 'Feta cheese', '100g'),
('Quinoa Salad', 'Lemon juice', '2 tbsp'),
('Quinoa Salad', 'Olive oil', '50ml'),

('Tiramisu', 'Mascarpone cheese', '250g'),
('Tiramisu', 'Ladyfingers', '200g'),
('Tiramisu', 'Espresso', '200ml'),
('Tiramisu', 'Eggs', '3 large'),
('Tiramisu', 'Sugar', '100g'),

('Eton Mess', 'Strawberries', '300g'),
('Eton Mess', 'Meringue', '100g'),
('Eton Mess', 'Whipping cream', '200ml'),

('Nougat', 'Honey', '200g'),
('Nougat', 'Sugar', '300g'),
('Nougat', 'Egg whites', '2'),
('Nougat', 'Almonds', '150g');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Apple & Blackberry Crumble', 'Apples', '3 large'),
('Apple & Blackberry Crumble', 'Blackberries', '150g'),
('Apple & Blackberry Crumble', 'Sugar', '100g'),
('Apple & Blackberry Crumble', 'Flour', '100g'),
('Apple & Blackberry Crumble', 'Butter', '100g');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Irish Coffee', 'Coffee', '250ml'),
('Irish Coffee', 'Irish whiskey', '50ml'),
('Irish Coffee', 'Brown sugar', '2 tbsp'),
('Irish Coffee', 'Cream', '50ml');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Kaiserschmarrn', 'Eggs', '4 large'),
('Kaiserschmarrn', 'Milk', '200ml'),
('Kaiserschmarrn', 'Flour', '120g'),
('Kaiserschmarrn', 'Sugar', '30g'),
('Kaiserschmarrn', 'Butter', '50g');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Caldo verde', 'Potatoes', '500g'),
('Caldo verde', 'Kale', '200g'),
('Caldo verde', 'Chorizo', '100g'),
('Caldo verde', 'Onion', '1 large'),
('Caldo verde', 'Garlic', '2 cloves');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Jambalaya', 'Rice', '300g'),
('Jambalaya', 'Chicken', '200g'),
('Jambalaya', 'Shrimp', '150g'),
('Jambalaya', 'Andouille sausage', '100g'),
('Jambalaya', 'Bell peppers', '2');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Japanese Curry', 'Curry powder', '2 tbsp'),
('Japanese Curry', 'Beef', '300g'),
('Japanese Curry', 'Potatoes', '300g'),
('Japanese Curry', 'Carrots', '200g'),
('Japanese Curry', 'Onion', '1 large');
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Lobster Bisque', 'Lobster', '2 whole'),
('Lobster Bisque', 'Carrots', '2'),
('Lobster Bisque', 'Celery', '2 stalks'),
('Lobster Bisque', 'Onion', '1 large'),
('Lobster Bisque', 'Tomato paste', '1 tbsp'),
('Lobster Bisque', 'Brandy', '50ml'),

('Osso Buco', 'Veal shanks', '4 pieces'),
('Osso Buco', 'Carrots', '2'),
('Osso Buco', 'Celery', '2 stalks'),
('Osso Buco', 'Onion', '1 large'),
('Osso Buco', 'White wine', '100ml'),
('Osso Buco', 'Tomatoes', '400g (canned)'),

('Okonomiyaki', 'Cabbage', '300g'),
('Okonomiyaki', 'Flour', '100g'),
('Okonomiyaki', 'Eggs', '2'),
('Okonomiyaki', 'Bacon', '100g'),
('Okonomiyaki', 'Okonomiyaki sauce', '50ml'),

('Paella', 'Rice', '300g'),
('Paella', 'Chicken', '200g'),
('Paella', 'Seafood mix', '200g'),
('Paella', 'Bell peppers', '2'),
('Paella', 'Saffron', '1 pinch'),

('Peking Duck', 'Duck', '1 whole'),
('Peking Duck', 'Hoisin sauce', '100ml'),
('Peking Duck', 'Cucumbers', '2'),
('Peking Duck', 'Green onions', '5 stalks'),

('Shepherds Pie', 'Ground lamb', '500g'),
('Shepherds Pie', 'Potatoes', '600g'),
('Shepherds Pie', 'Carrots', '2'),
('Shepherds Pie', 'Onion', '1 large'),
('Shepherds Pie', 'Peas', '100g'),

('Umbrian Lentil Stew', 'Lentils', '200g'),
('Umbrian Lentil Stew', 'Tomatoes', '400g (canned)'),
('Umbrian Lentil Stew', 'Carrots', '2'),
('Umbrian Lentil Stew', 'Celery', '2 stalks'),
('Umbrian Lentil Stew', 'Onion', '1 large'),

('Vegetable Terrine', 'Carrots', '2 large'),
('Vegetable Terrine', 'Zucchini', '2'),
('Vegetable Terrine', 'Eggplant', '1'),
('Vegetable Terrine', 'Gelatin', '10g'),

('Kimchi Stew', 'Kimchi', '300g'),
('Kimchi Stew', 'Tofu', '200g'),
('Kimchi Stew', 'Pork belly', '200g'),
('Kimchi Stew', 'Onion', '1 large'),
('Kimchi Stew', 'Garlic', '4 cloves');


INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES


('Fajitas', 'Chicken breast', '500g'),
('Fajitas', 'Bell peppers', '3 (mixed colors)'),
('Fajitas', 'Onion', '1 large'),
('Fajitas', 'Fajita seasoning', '2 tbsp'),
('Fajitas', 'Tortillas', '8'),

('Hamburgers', 'Ground beef', '500g'),
('Hamburgers', 'Hamburger buns', '4'),
('Hamburgers', 'Lettuce', '4 leaves'),
('Hamburgers', 'Tomato', '1 large'),
('Hamburgers', 'Onion', '1 large'),
('Hamburgers', 'Cheese', '4 slices'),

('Jerk Chicken', 'Chicken thighs', '1 kg'),
('Jerk Chicken', 'Jerk seasoning', '50g'),
('Jerk Chicken', 'Scotch bonnet peppers', '2'),
('Jerk Chicken', 'Green onions', '5 stalks'),
('Jerk Chicken', 'Thyme', '1 tbsp'),

('Kebab', 'Lamb', '500g'),
('Kebab', 'Onions', '2 large'),
('Kebab', 'Bell peppers', '2'),
('Kebab', 'Kebab spices', '2 tbsp'),
('Kebab', 'Yogurt', '100ml'),

('Oysters Kilpatrick', 'Oysters', '12'),
('Oysters Kilpatrick', 'Bacon', '100g'),
('Oysters Kilpatrick', 'Worcestershire sauce', '2 tbsp'),
('Oysters Kilpatrick', 'Butter', '50g'),
('Oysters Kilpatrick', 'Parsley', 'for garnish'),

('Quesadilla', 'Tortillas', '4 large'),
('Quesadilla', 'Cheese', '200g'),
('Quesadilla', 'Chicken', '200g (optional)'),
('Quesadilla', 'Green peppers', '1'),
('Quesadilla', 'Onion', '1 large'),


('Wiener Schnitzel', 'Veal cutlets', '4'),
('Wiener Schnitzel', 'Eggs', '2'),
('Wiener Schnitzel', 'Breadcrumbs', '200g'),
('Wiener Schnitzel', 'Flour', '100g'),
('Wiener Schnitzel', 'Lemon', '2 (for garnish)');


CREATE TABLE ingredients (
    name VARCHAR(64),   
    foodGroup VARCHAR(64),  
    unitOfMeasure VARCHAR(64),  
    caloriesPerUnitOfMeasure INT,--kcal
    carbohydratesPerUnitOfMeasure INT, --grams
    fatsPerUnitOfMeasure INT,--grams
    sugarsPerUnitOfMeasure INT,--grams
    PRIMARY KEY (name)
);


INSERT INTO ingredients (name, foodGroup, unitOfMeasure, caloriesPerUnitOfMeasure, carbohydratesPerUnitOfMeasure, fatsPerUnitOfMeasure, sugarsPerUnitOfMeasure) VALUES
('Eggs', 'Dairy, Eggs, and Products', 'large (50g each)', 70, 1, 5, 1),
('Flour', 'Cereals and Products', 'cup (120g)', 455, 95, 1, 1),
('Peanut filling', 'Various Plant-Based Foods', 'cup (100g)', 588, 20, 50, 9),
('Apples', 'Various Plant-Based Foods', 'medium (182g)', 95, 25, 0, 19),
('Blackberries', 'Various Plant-Based Foods', 'cup (144g)', 62, 14, 1, 7),
('Butter', 'Dairy, Eggs, and Products', 'tablespoon (14g)', 102, 0, 12, 0),
('Sugar', 'Sweeteners', 'tablespoon (12.6g)', 49, 13, 0, 13),
('Frangipane', 'Various Plant-Based Foods', '100g', 400, 44, 24, 24),
('Pastry crust', 'Cereals and Products', 'piece (60g)', 200, 20, 11, 0),
('Chicken', 'Meat and Products', '100g', 239, 0, 14, 0),
('Coconut milk', 'Various Plant-Based Foods', 'cup (240g)', 552, 13, 57, 8),
('Lemongrass', 'Spices and Essential Oils', 'stalk (18g)', 5, 1, 0, 0);
INSERT INTO ingredients (name, foodGroup, unitOfMeasure, caloriesPerUnitOfMeasure, carbohydratesPerUnitOfMeasure, fatsPerUnitOfMeasure, sugarsPerUnitOfMeasure) VALUES
('Jam', 'Preserved Foods', 'tablespoon (20g)', 56, 14, 0, 10),
('Bananas', 'Various Plant-Based Foods', 'medium (118g)', 105, 27, 0, 14),
('Beef fillet', 'Meat and Products', '100g', 250, 0, 15, 0),
('Mushroom duxelles', 'Various Plant-Based Foods', '100g', 70, 5, 5, 2),
('Puff pastry', 'Cereals and Products', 'ounce (28g)', 158, 11, 11, 0),
('Chorizo', 'Meat and Products', 'slice (10g)', 50, 0, 5, 0),
('Garlic', 'Various Plant-Based Foods', 'clove (3g)', 5, 1, 0, 0),
('Kale', 'Various Plant-Based Foods', 'cup (67g)', 34, 6, 1, 0),
('Onion', 'Various Plant-Based Foods', 'medium (110g)', 44, 10, 0, 5),
('Potatoes', 'Various Plant-Based Foods', 'medium (173g)', 161, 37, 0, 2),
('Cannelloni tubes', 'Cereals and Products', 'piece (30g)', 90, 18, 1, 1),
('Ricotta cheese', 'Dairy, Eggs, and Products', 'cup (248g)', 428, 8, 32, 1),
('Spinach', 'Various Plant-Based Foods', 'cup (30g)', 7, 1, 0, 0),
('Chicken breast', 'Meat and Products', '100g', 165, 0, 4, 0),
('Ginger', 'Spices and Essential Oils', 'tablespoon (6g)', 5, 1, 0, 0),
('Rice', 'Cereals and Products', 'cup (cooked, 158g)', 206, 45, 0, 0),
('Carrots', 'Various Plant-Based Foods', 'medium (61g)', 25, 6, 0, 3),
('Gochujang (Korean chili paste)', 'Preserved Foods', 'tablespoon (20g)', 45, 9, 1, 7),
('Soy sauce', 'Preserved Foods', 'tablespoon (18g)', 10, 1, 0, 0),
('Cumin seeds', 'Spices and Essential Oils', 'teaspoon (2g)', 8, 1, 0, 0),
('Garam Masala', 'Spices and Essential Oils', 'teaspoon (2g)', 6, 1, 0, 0),
('Tomatoes', 'Various Plant-Based Foods', 'medium (123g)', 22, 5, 0, 3),
('Chocolate glaze', 'Sweeteners', 'tablespoon (20g)', 100, 15, 5, 12),
('Choux pastry', 'Cereals and Products', 'piece (10g)', 30, 3, 2, 1),
('Pastry cream', 'Dairy, Eggs, and Products', 'cup (250g)', 305, 30, 18, 23),
('Bacon', 'Meat and Products', 'slice (8g)', 42, 0, 3, 0),
('Sausages', 'Meat and Products', 'link (50g)', 142, 1, 12, 1),
('Meringue', 'Sweeteners', 'piece (30g)', 95, 22, 0, 22),
('Strawberries', 'Various Plant-Based Foods', 'cup (152g)', 49, 12, 0, 7),
('Whipping cream', 'Dairy, Eggs, and Products', 'cup (60g)', 154, 4, 16, 3);
INSERT INTO ingredients (name, foodGroup, unitOfMeasure, caloriesPerUnitOfMeasure, carbohydratesPerUnitOfMeasure, fatsPerUnitOfMeasure, sugarsPerUnitOfMeasure) VALUES
('Bell peppers', 'Various Plant-Based Foods', 'medium (119g)', 24, 6, 0, 4),
('Fajita seasoning', 'Spices and Essential Oils', 'tablespoon (8g)', 20, 4, 0, 0),
('Tortillas', 'Cereals and Products', 'each (medium, 40g)', 94, 16, 2, 0),
('Chickpeas', 'Various Plant-Based Foods', 'cup (cooked, 164g)', 269, 45, 4, 8),
('Cumin', 'Spices and Essential Oils', 'teaspoon (2g)', 8, 1, 0, 0),
('Parsley', 'Spices and Essential Oils', 'cup (chopped, 60g)', 22, 4, 0, 1),
('Beer', 'Various Beverages', 'can (356ml)', 154, 13, 0, 0),
('White fish fillets', 'Fish and Products', 'fillet (180g)', 206, 0, 2, 0),
('Bell pepper', 'Various Plant-Based Foods', 'medium (119g)', 24, 6, 0, 4),
('Cucumber', 'Various Plant-Based Foods', 'medium (201g)', 30, 7, 0, 4),
('Olive oil', 'Fats and Oils', 'tablespoon (13.5g)', 119, 0, 14, 0),
('Red onion', 'Various Plant-Based Foods', 'medium (110g)', 44, 10, 0, 5),
('Vinegar', 'Various Plant-Based Foods', 'tablespoon (15g)', 3, 0, 0, 0),
('Beef', 'Meat and Products', '100g', 250, 0, 15, 0),
('Onions', 'Various Plant-Based Foods', 'medium (110g)', 44, 10, 0, 5),
('Paprika', 'Spices and Essential Oils', 'teaspoon (2g)', 6, 1, 0, 0),
('Feta cheese', 'Dairy, Eggs, and Products', 'cup (crumbled, 150g)', 396, 6, 32, 0),
('Kalamata olives', 'Various Plant-Based Foods', 'cup (134g)', 275, 15, 23, 0),
('Cheese', 'Dairy, Eggs, and Products', 'slice (28g)', 113, 1, 9, 0),
('Ground beef', 'Meat and Products', '100g', 254, 0, 18, 0),
('Hamburger buns', 'Cereals and Products', 'each (43g)', 120, 21, 2, 3),
('Lettuce', 'Various Plant-Based Foods', 'leaf (5g)', 1, 0, 0, 0),
('Tomato', 'Various Plant-Based Foods', 'medium (123g)', 22, 5, 0, 3),
('Bamboo shoots', 'Various Plant-Based Foods', 'cup (120g)', 20, 3, 0, 2),
('Chicken broth', 'Preserved Foods', 'cup (240ml)', 38, 3, 1, 1),
('Rice vinegar', 'Various Plant-Based Foods', 'tablespoon (15ml)', 3, 0, 0, 0),
('Shiitake mushrooms', 'Various Plant-Based Foods', 'cup (87g)', 35, 7, 0, 2),
('Tofu', 'Various Plant-Based Foods', 'block (122g)', 177, 5, 12, 1),
('Lemon juice', 'Various Plant-Based Foods', 'tablespoon (15ml)', 4, 1, 0, 0),
('Tahini', 'Various Plant-Based Foods', 'tablespoon (15g)', 89, 3, 8, 0),
('Curry powder', 'Spices and Essential Oils', 'teaspoon (2g)', 6, 1, 0, 0),
('Brown sugar', 'Sweeteners', 'tablespoon (12g)', 45, 12, 0, 12),
('Coffee', 'Coffee, Tea, and Related Products', 'cup (240ml)', 2, 0, 0, 0),
('Cream', 'Dairy, Eggs, and Products', 'tablespoon (15ml)', 52, 1, 6, 1),
('Irish whiskey', 'Various Beverages', 'shot (44ml)', 98, 0, 0, 0),
('Beef stock', 'Preserved Foods', 'cup (240ml)', 31, 0, 0, 0),
('Lamb shoulder', 'Meat and Products', '100g', 236, 0, 16, 0),
('Almonds', 'Various Plant-Based Foods', 'cup (143g)', 828, 30, 72, 6),
('Andouille sausage', 'Meat and Products', 'link (85g)', 229, 2, 19, 1),
('Shrimp', 'Fish and Products', '100g', 99, 0, 1, 0),
('Cream cheese', 'Dairy, Eggs, and Products', 'ounce (28g)', 99, 1, 10, 1);
INSERT INTO ingredients (name, foodGroup, unitOfMeasure, caloriesPerUnitOfMeasure, carbohydratesPerUnitOfMeasure, fatsPerUnitOfMeasure, sugarsPerUnitOfMeasure) VALUES
('Chicken thighs', 'Meat and Products', '100g', 209, 0, 15, 0),
('Green onions', 'Various Plant-Based Foods', '100g', 32, 7, 0, 2),
('Jerk seasoning', 'Spices and Essential Oils', 'teaspoon (2g)', 5, 1, 0, 0),
('Scotch bonnet peppers', 'Various Plant-Based Foods', 'pepper (6.5g)', 2, 1, 0, 0),
('Thyme', 'Spices and Essential Oils', 'tablespoon (1g)', 3, 1, 0, 0),
('Milk', 'Dairy, Eggs, and Products', 'cup (244g)', 103, 12, 2, 12),
('Kebab spices', 'Spices and Essential Oils', 'tablespoon (7g)', 20, 4, 0, 0),
('Lamb', 'Meat and Products', '100g', 294, 0, 24, 0),
('Yogurt', 'Dairy, Eggs, and Products', 'cup (245g)', 154, 17, 9, 17),
('Condensed milk', 'Dairy, Eggs, and Products', 'cup (306g)', 982, 166, 27, 166),
('Graham cracker crust', 'Cereals and Products', 'piece (21g)', 102, 12, 5, 5),
('Lime juice', 'Various Plant-Based Foods', 'tablespoon (15ml)', 4, 1, 0, 0),
('Cooked rice', 'Cereals and Products', 'cup (158g)', 206, 45, 0, 0),
('Kimchi', 'Various Plant-Based Foods', 'cup (150g)', 23, 4, 0, 2),
('Sesame oil', 'Fats and Oils', 'tablespoon (14ml)', 120, 0, 14, 0),
('Pork belly', 'Meat and Products', '100g', 518, 0, 53, 0),
('Cinnamon', 'Spices and Essential Oils', 'teaspoon (2.6g)', 6, 2, 0, 0),
('Dried apricots', 'Fruits and Products', 'cup (130g)', 313, 81, 1, 69),
('Lasagna noodles', 'Cereals and Products', 'piece (56g)', 180, 36, 1, 1),
('Marinara sauce', 'Various Plant-Based Foods', 'cup (240g)', 70, 13, 2, 9),
('Brandy', 'Various Beverages', 'shot (42g)', 95, 0, 0, 0),
('Celery', 'Various Plant-Based Foods', 'stalk (40g)', 6, 1, 0, 1),
('Lobster', 'Fish and Products', '100g', 89, 0, 1, 0),
('Tomato paste', 'Preserved Foods', 'tablespoon (16g)', 13, 3, 0, 2),
('Almond flour', 'Various Plant-Based Foods', 'cup (96g)', 544, 20, 48, 4),
('Egg whites', 'Dairy, Eggs, and Products', 'large (33g)', 17, 0, 0, 0),
('Granulated sugar', 'Sweeteners', 'cup (200g)', 774, 200, 0, 200),
('Doubanjiang (fermented bean paste)', 'Various Plant-Based Foods', 'tablespoon (15g)', 25, 4, 1, 3),
('Green onion', 'Various Plant-Based Foods', '100g', 32, 7, 0, 2),
('Ground pork', 'Meat and Products', '100g', 297, 0, 21, 0),
('Bechamel sauce', 'Dairy, Eggs, and Products', 'cup (250g)', 300, 20, 23, 9),
('Eggplant', 'Various Plant-Based Foods', 'medium (200g)', 50, 12, 0, 7),
('Ground lamb', 'Meat and Products', '100g', 282, 0, 23, 0),
('Cheddar cheese', 'Dairy, Eggs, and Products', 'slice (28g)', 113, 0, 9, 0),
('Jalapenos', 'Various Plant-Based Foods', 'pepper (14g)', 4, 1, 0, 1),
('Salsa', 'Various Plant-Based Foods', 'tablespoon (15g)', 4, 1, 0, 1),
('Tortilla chips', 'Cereals and Products', 'ounce (28g)', 138, 19, 7, 0),
('Kecap Manis (sweet soy sauce)', 'Preserved Foods', 'tablespoon (15ml)', 40, 10, 0, 9),
('Shallots', 'Various Plant-Based Foods', 'medium (10g)', 7, 2, 0, 1),
('Honey', 'Sweeteners', 'tablespoon (21g)', 64, 17, 0, 17),
('Cabbage', 'Various Plant-Based Foods', 'cup (chopped, 89g)', 22, 5, 0, 3),
('Okonomiyaki sauce', 'Preserved Foods', 'tablespoon (18g)', 35, 7, 0, 6),
('Veal shanks', 'Meat and Products', '100g', 178, 0, 9, 0),
('White wine', 'Various Beverages', 'glass (147ml)', 123, 4, 0, 1),
('Oysters', 'Fish and Products', 'medium (25g)', 17, 2, 1, 0),
('Worcestershire sauce', 'Spices and Essential Oils', 'tablespoon (17ml)', 13, 3, 0, 1),
('Saffron', 'Spices and Essential Oils', 'teaspoon (0.7g)', 6, 1, 0, 0),
('Seafood mix', 'Fish and Products', '100g', 89, 0, 1, 0),
('Cucumbers', 'Various Plant-Based Foods', 'medium (201g)', 30, 7, 0, 4),
('Duck', 'Meat and Products', '100g', 337, 0, 28, 0),
('Hoisin sauce', 'Various Plant-Based Foods', 'tablespoon (19g)', 35, 7, 1, 6),
('Egg', 'Dairy, Eggs, and Products', 'large (50g)', 70, 1, 5, 1),
('Potato', 'Various Plant-Based Foods', 'medium (173g)', 161, 37, 0, 2),
('Green peppers', 'Various Plant-Based Foods', 'medium (119g)', 24, 6, 0, 4),
('Cherry tomatoes', 'Various Plant-Based Foods', 'cup (149g)', 27, 6, 0, 4),
('Quinoa', 'Cereals and Products', 'cup (185g)', 222, 39, 4, 0),
('Ramen noodles', 'Cereals and Products', 'package (85g)', 371, 51, 14, 1),
('Yellow squash', 'Various Plant-Based Foods', 'medium (200g)', 31, 7, 0, 4),
('Zucchini', 'Various Plant-Based Foods', 'medium (196g)', 33, 6, 1, 5),
('Arborio rice', 'Cereals and Products', 'cup (192g)', 716, 158, 1, 0),
('Chicken stock', 'Preserved Foods', 'cup (240ml)', 86, 8, 3, 1),
('Parmesan cheese', 'Dairy, Eggs, and Products', 'ounce (28g)', 122, 1, 8, 0),
('Garam masala', 'Spices and Essential Oils', 'teaspoon (2g)', 6, 1, 0, 0),
('Green peas', 'Various Plant-Based Foods', 'cup (160g)', 118, 21, 1, 8),
('Pastry dough', 'Cereals and Products', 'piece (100g)', 455, 45, 30, 1),
('Peas', 'Various Plant-Based Foods', 'cup (160g)', 117, 21, 1, 8),
('Fresh fish (various)', 'Fish and Products', '100g', 206, 0, 12, 0),
('Nori sheets', 'Fish and Products', 'sheet (2.5g)', 9, 1, 0, 0),
('Sushi rice', 'Cereals and Products', 'cup (cooked, 158g)', 296, 65, 0, 0),
('Wasabi', 'Spices and Essential Oils', 'teaspoon (6g)', 15, 3, 0, 0),
('Bulgur', 'Cereals and Products', 'cup (140g)', 479, 106, 2, 0),
('Mint', 'Spices and Essential Oils', 'cup (chopped, 18g)', 12, 2, 0, 0),
('Corn tortillas', 'Cereals and Products', 'each (24g)', 52, 11, 1, 1),
('Espresso', 'Coffee, Tea, and Related Products', 'shot (30ml)', 2, 0, 0, 0),
('Ladyfingers', 'Cereals and Products', 'each (15g)', 47, 8, 1, 3),
('Mascarpone cheese', 'Dairy, Eggs, and Products', 'cup (250g)', 859, 6, 89, 0),
('Dashi broth', 'Various Beverages', 'cup (240ml)', 10, 2, 0, 0),
('Mirin', 'Various Beverages', 'tablespoon (15ml)', 48, 8, 0, 5),
('Mushrooms', 'Various Plant-Based Foods', 'cup (70g)', 15, 2, 0, 1),
('Udon noodles', 'Cereals and Products', 'package (200g)', 200, 42, 1, 2),
('Beetroot', 'Various Plant-Based Foods', 'medium (82g)', 35, 8, 0, 7),
('Lentils', 'Various Plant-Based Foods', 'cup (192g)', 678, 115, 2, 4),
('Gelatin', 'Dairy, Eggs, and Products', 'tablespoon (7g)', 23, 0, 0, 0),
('Venison', 'Meat and Products', '100g', 158, 0, 2, 0),
('Beef brisket', 'Meat and Products', '100g', 248, 0, 19, 0),
('Fish sauce', 'Preserved Foods', 'tablespoon (18ml)', 9, 1, 0, 1),
('Rice noodles', 'Cereals and Products', 'cup (176g)', 192, 44, 0, 0),
('Star anise', 'Spices and Essential Oils', 'whole (2g)', 7, 1, 0, 0),
('Mayonnaise', 'Fats and Oils', 'tablespoon (13g)', 94, 0, 10, 0),
('Walnuts', 'Various Plant-Based Foods', 'cup (120g)', 765, 16, 76, 3),
('Bread', 'Cereals and Products', 'slice (32g)', 85, 16, 1, 2),
('Mustard', 'Spices and Essential Oils', 'tablespoon (15g)', 15, 2, 1, 1),
('Breadcrumbs', 'Cereals and Products', 'cup (120g)', 460, 78, 6, 8),
('Lemon', 'Various Plant-Based Foods', 'whole (58g)', 17, 5, 0, 1),
('Veal cutlets', 'Meat and Products', '100g', 194, 0, 7, 0),
('Garlic powder', 'Spices and Essential Oils', 'teaspoon (3.1g)', 10, 2, 0, 0),
('Salt', 'Spices and Essential Oils', 'teaspoon (6g)', 0, 0, 0, 0);