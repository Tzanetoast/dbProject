DROP TABLE nationalCuisines;

CREATE TABLE nationalCuisines (
    name VARCHAR(64),
    description VARCHAR(256),
    PRIMARY KEY (name)
);

INSERT INTO nationalCuisines (name, description) VALUES 
('British', 'Known for its traditional dishes like fish and chips, puddings, and roasts.'),
('Malaysian', 'Features complex flavors with spicy, sweet, and savory elements, heavily influenced by various cultures including Chinese and Indian.'),
('American', 'Diverse and broad, encompasses everything from classic hamburgers and hot dogs to regional specialties like Southern barbecue.'),
('Chinese', 'Rich with flavors from Sichuan spice to Cantonese dim sum, known for its regional diversity.'),
('Italian', 'Emphasizes fresh, high-quality ingredients like tomatoes, garlic, and olive oil, famous for pasta and pizza.'),
('Portuguese', 'Seafood-centric, often includes spices like piri piri and dishes like bacalhau.'),
('Korean', 'Known for its balance of spice, sweetness, and fermentation with dishes like kimchi and barbecued meats.'),
('Danish', 'Features hearty meat-based meals alongside pastries, most famously Danish pastries.'),
('Indian', 'Renowned for its use of aromatic spices and a wide array of dishes from curries to tandoori.'),
('French', 'Famous for its fine dining and techniques, includes bread, wines, and cheeses as staples.'),
('Mexican', 'Rich in flavors and colors, often spicy, includes tacos, quesadillas, and mole among other dishes.'),
('Middle Eastern', 'Characterized by dishes like hummus, falafel, and kebabs, with a heavy emphasis on spices and herbs.'),
('Spanish', 'Known for tapas and seafood, dishes like paella and gazpacho highlight its regional diversity.'),
('Hungarian', 'Famous for its hearty stews and paprika-laden dishes such as goulash.'),
('Greek', 'Mediterranean cuisine known for its use of feta cheese, olives, and herbs in dishes like moussaka and Greek salad.'),
('Irish', 'Comforting and hearty with staples like Irish stew, potatoes, and a variety of breads.'),
('Japanese', 'Notable for its sushi, ramen, and precision in preparation and presentation of meals.'),
('Caribbean', 'Vibrant and flavorful, with a strong emphasis on spices, seafood, and tropical fruits.'),
('Austrian', 'Known for its pastries such as strudel and savory dishes like Wiener Schnitzel.'),
('Moroccan', 'Rich in spices and flavors with specialties like tagine and couscous.'),
('Indonesian', 'Diverse archipelago cuisine featuring satay, nasi goreng, and rich peanut sauces.'),
('Australian', 'Combines British influences with native bush tucker, famous for its barbecues and seafood.'),
('Eastern European', 'Hearty dishes with a significant use of meat, potatoes, and dairy, along with a strong pickling tradition.'),
('International', 'Encompasses global dishes tailored to worldwide tastes, often found in cosmopolitan areas.'),
('Ukrainian', 'Known for its use of vegetables and grains, with dishes like borscht and pierogi.'),
('Vietnamese', 'Marked by the use of fresh herbs, fish sauce, and dishes that balance sweet, sour, salty, and hot flavors.');

DROP TABLE mealTypes;
CREATE TABLE mealTypes(
    name VARCHAR(64),
    PRIMARY KEY (name)
);

INSERT INTO mealTypes (name) VALUES
('Dessert'),
('Snack'),
('Dinner'),
('Breakfast'),
('Lunch'),
('Cold-dish'),
('Barbecue'),
('Appetizer'),
('Brunch');


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
    portions INT,
    PRIMARY KEY (name)
    FOREIGN KEY (nationalCuisine) REFERENCES nationalCuisines(name)
);

INSERT INTO recipes (name, cookingORpastry, shortDescription, nationalCuisine, difficulty, prepTime, cookingTime, mealType, portions) VALUES 
('Apple Frangipan Tart', 'pastry', 'A delicious tart made with apples and frangipane.', 'British', 3, 30, 45, 'Dessert', 4),
('Apple & Blackberry Crumble', 'pastry', 'A traditional dessert combining apples and blackberries with a crumble topping.', 'British', 2, 15, 30, 'Dessert', 4),
('Apam balik', 'cooking', 'A sweet Malaysian pancake that is crispy on the outside and fluffy inside.', 'Malaysian', 2, 10, 15, 'Snack', 4),
('Ayam Percik', 'cooking', 'Malaysian grilled chicken slathered in a spicy coconut milk marinade.', 'Malaysian', 3, 20, 30, 'Dinner', 4),

('Bakewell tart', 'pastry', 'A classic English dessert tart with jam and frangipane.', 'British', 3, 20, 40, 'Dessert, Snack', 6),
('Beef Wellington', 'cooking', 'Beef fillet coated with mushroom duxelles and wrapped in puff pastry.', 'British', 5, 30, 60, 'Dinner, Fine-Dining', 4),
('Banana Pancakes', 'cooking', 'Sweet pancakes made with ripe bananas.', 'American', 1, 10, 15, 'Breakfast, Dessert', 4),

('Chicken Congee', 'cooking', 'A type of rice porridge popular in Asian countries.', 'Chinese', 1, 10, 90, 'Breakfast, Dinner', 2),
('Cannelloni', 'cooking', 'Tubular pasta filled with meat or cheese and baked in a sauce.', 'Italian', 3, 30, 45, 'Lunch, Dinner', 4),
('Caldo verde', 'cooking', 'A traditional Portuguese soup made with potatoes, chorizo, and kale.', 'Portuguese', 2, 15, 35, 'Dinner, Cold-dish', 4),

('Dakdoritang', 'cooking', 'Korean spicy chicken stew with vegetables.', 'Korean', 3, 20, 40, 'Dinner', 4),
('Danish Pastry', 'pastry', 'Sweet pastry originated from Denmark.', 'Danish', 4, 30, 20, 'Breakfast, Snack', 4),
('Dum Aloo', 'cooking', 'Potatoes cooked in curry, popular in Indian cuisine.', 'Indian', 2, 15, 30, 'Lunch, Dinner', 4),

('English Breakfast', 'cooking', 'Full breakfast dish consisting of eggs, sausages, beans, toast, and more.', 'British', 2, 5, 15, 'Breakfast, Brunch', 1),
('Eclairs', 'pastry', 'Pastry filled with cream and topped with chocolate icing.', 'French', 4, 25, 50, 'Dessert, Snack', 8),
('Eton Mess', 'pastry', 'Dessert consisting of a mix of strawberries, meringue, and whipped cream.', 'British', 1, 15, 0, 'Dessert, Snack', 2),

('Fish and Chips', 'cooking', 'Battered fish with deep-fried chips, a popular British fast food.', 'British', 2, 10, 20, 'Lunch, Dinner, Snack', 2),
('Fajitas', 'cooking', 'Grilled meat served on a flour or corn tortilla.', 'Mexican', 2, 20, 10, 'Dinner, Barbecue', 4),
('Falafel', 'cooking', 'Deep-fried balls made from ground chickpeas or fava beans.', 'Middle Eastern', 2, 30, 5, 'Lunch, Dinner, Snack', 4),

('Gazpacho', 'cooking', 'Cold soup made from raw, blended vegetables.', 'Spanish', 1, 20, 0, 'Lunch, Dinner, Cold-dish', 4),
('Goulash', 'cooking', 'Stew of meat and vegetables seasoned with paprika.', 'Hungarian', 3, 15, 120, 'Dinner', 4),
('Greek Salad', 'cooking', 'Salad made with tomatoes, cucumbers, onion, feta cheese, and olives.', 'Greek', 1, 10, 0, 'Lunch, Dinner, Cold-dish', 2),

('Hot and Sour Soup', 'cooking', 'A variety of soups from several Asian countries, particularly spicy in Sichuan cuisine.', 'Chinese', 2, 10, 20, 'Dinner, Snack', 2),
('Hummus', 'cooking', 'Creamy dip made from cooked, mashed chickpeas blended with tahini, lemon juice, and garlic.', 'Middle Eastern', 1, 10, 0, 'Snack, Appetizer', 4),
('Hamburgers', 'cooking', 'Ground meat patties, typically beef, served on a bun with various toppings.', 'American', 1, 10, 10, 'Lunch, Dinner, Snack', 4),

('Irish Coffee', 'pastry', 'Hot coffee with Irish whiskey and sugar, stirred, and topped with cream.', 'Irish', 1, 5, 0, 'Dessert, Snack', 1),
('Indian Curry', 'cooking', 'Spiced meat, fish, or vegetables cooked in a sauce.', 'Indian', 3, 20, 40, 'Lunch, Dinner', 4),
('Italian Biscotti', 'pastry', 'Twice-baked almond biscuits originating from Italy.', 'Italian', 2, 20, 30, 'Snack, Dessert', 8),
('Irish Stew', 'cooking', 'A hearty stew made with lamb, potatoes, and carrots.', 'Irish', 2, 15, 120, 'Dinner, Lunch', 4),

('Jambalaya', 'cooking', 'A Creole rice dish with meat and seafood, cooked in a tomato base.', 'American', 3, 20, 45, 'Lunch, Dinner', 4),
('Japanese Curry', 'cooking', 'A thick, stew-like curry with meat and vegetables.', 'Japanese', 2, 15, 35, 'Dinner', 4),
('Jerk Chicken', 'cooking', 'Spicy chicken dish marinated with a hot spice mixture called jerk spice.', 'Caribbean', 3, 240, 45, 'Dinner, Barbecue', 4),
('Japanese Cheesecake', 'pastry', 'A fluffy and light style of cheesecake.', 'Japanese', 2, 15, 45, 'Dessert', 6),

('Kimchi Fried Rice', 'cooking', 'Fried rice made with kimchi and other ingredients such as vegetables or meat.', 'Korean', 1, 10, 15, 'Lunch, Dinner', 2),
('Kaiserschmarrn', 'pastry', 'A fluffy shredded pancake that has its origins in Austria.', 'Austrian', 2, 10, 20, 'Dessert, Snack', 4),
('Kebab', 'cooking', 'Meat cut into cubes, marinated, and then grilled on skewers.', 'Middle Eastern', 2, 180, 10, 'Lunch, Dinner, Snack', 4),
('Kimchi Stew', 'cooking', 'Spicy stew made with kimchi and tofu.', 'Korean', 2, 15, 30, 'Lunch, Dinner', 4),
('Key Lime Pie', 'pastry', 'A pie made with Key lime juice, egg yolks, and sweetened condensed milk.', 'American', 2, 20, 30, 'Dessert', 8),

('Lasagna', 'cooking', 'Layered pasta dish with cheese, meat, and tomato sauce.', 'Italian', 4, 30, 60, 'Lunch, Dinner', 6),
('Lamb Tagine', 'cooking', 'Moroccan dish of slow-cooked lamb with spices.', 'Moroccan', 3, 20, 120, 'Dinner', 4),
('Lobster Bisque', 'cooking', 'A smooth and creamy soup made with lobster stock.', 'French', 4, 15, 45, 'Dinner, Fine-Dining', 4),

('Moussaka', 'cooking', 'Eggplant or potato-based dish, often including ground meat.', 'Greek', 3, 30, 60, 'Dinner', 4),
('Mapo Tofu', 'cooking', 'Spicy Sichuan tofu dish with minced meat, typically pork or beef.', 'Chinese', 2, 10, 20, 'Lunch, Dinner', 4),
('Macaron', 'pastry', 'Sweet meringue-based confection made with egg white, icing sugar, granulated sugar, almond meal, and food coloring.', 'French', 4, 25, 15, 'Dessert, Snack', 8),

('Nachos', 'cooking', 'Dish of heated tortilla chips or totopos covered with melted cheese, often served as a snack or appetizer.', 'Mexican', 1, 5, 10, 'Snack, Appetizer', 4),
('Nasi Goreng', 'cooking', 'Indonesian dish made with fried rice, typically flavored with kecap manis (sweet soy sauce), shallot, garlic, tamarind and chili.', 'Indonesian', 2, 10, 15, 'Lunch, Dinner', 2),
('Nougat', 'pastry', 'A family of confections made with sugar or honey, roasted nuts, whipped egg whites, and sometimes chopped candied fruit.', 'French', 3, 30, 20, 'Dessert, Snack', 8),

('Osso Buco', 'cooking', 'An Italian dish made with veal shanks cooked with vegetables, white wine, and broth.', 'Italian', 4, 15, 120, 'Lunch, Dinner', 4),
('Oysters Kilpatrick', 'cooking', 'Oysters topped with a Worcestershire-based sauce, bacon and breadcrumbs, then grilled.', 'Australian', 2, 10, 10, 'Appetizer, Fine-Dining', 2),
('Okonomiyaki', 'cooking', 'Japanese savory pancake containing a variety of ingredients.', 'Japanese', 2, 10, 15, 'Lunch, Dinner, Snack', 2),

('Paella', 'cooking', 'Spanish rice dish originally from Valencia, containing meat, seafood, and vegetables.', 'Spanish', 3, 20, 40, 'Lunch, Dinner', 4),
('Pierogi', 'cooking', 'Filled dumplings of Central European origin made by wrapping unleavened dough around a savory or sweet filling.', 'Eastern European', 3, 30, 20, 'Lunch, Dinner, Snack', 6),
('Peking Duck', 'cooking', 'A famous duck dish from Beijing that has been prepared since the imperial era, known for its thin, crisp skin.', 'Chinese', 5, 120, 60, 'Dinner, Fine-Dining', 4),

('Quiche Lorraine', 'pastry', 'A French tart consisting of pastry crust filled with smoked bacon, cheese, and egg custard.', 'French', 3, 20, 45, 'Breakfast, Brunch, Snack', 6),
('Quesadilla', 'cooking', 'A Mexican dish consisting of a tortilla that is filled primarily with cheese, and sometimes meats, spices, and other fillings, and then cooked on a griddle.', 'Mexican', 1, 5, 10, 'Snack, Lunch', 4),
('Quinoa Salad', 'cooking', 'Salad made from quinoa mixed with various vegetables and sometimes meat or seafood.', 'International', 1, 15, 0, 'Lunch, Dinner, Cold-dish', 4),

('Ratatouille', 'cooking', 'A French Provençal stewed vegetable dish, originating in Nice.', 'French', 2, 20, 40, 'Lunch, Dinner', 4),
('Risotto', 'cooking', 'An Italian rice dish cooked with broth until it reaches a creamy consistency.', 'Italian', 3, 10, 30, 'Lunch, Dinner', 4),
('Ramen', 'cooking', 'A Japanese noodle soup dish with meat or fish broth flavored with soy sauce or miso, and uses toppings such as sliced pork, nori, and green onions.', 'Japanese', 3, 15, 30, 'Lunch, Dinner', 2),

('Sushi', 'cooking', 'Japanese dish of prepared vinegared rice, usually with some sugar and salt, accompanying a variety of ingredients, such as seafood, often raw, and vegetables.', 'Japanese', 3, 30, 0, 'Lunch, Dinner, Snack', 4),
('Shepherds Pie', 'cooking', 'A traditional British dish of minced meat topped with a mashed potato crust.', 'British', 2, 20, 60, 'Lunch, Dinner', 4),
('Samosa', 'cooking', 'A fried or baked pastry with a savory filling, such as spiced potatoes, onions, peas, or lentils.', 'Indian', 2, 30, 10, 'Snack, Appetizer', 6),

('Tiramisu', 'pastry', 'A popular coffee-flavored Italian dessert.', 'Italian', 2, 30, 0, 'Dessert', 8),
('Tacos', 'cooking', 'Traditional Mexican dish consisting of a small hand-sized corn or wheat tortilla topped with a filling.', 'Mexican', 1, 10, 10, 'Lunch, Dinner, Snack', 4),
('Tabbouleh', 'cooking', 'A Levantine vegetarian salad made of finely chopped parsley, with tomatoes, mint, onion, bulgur, and seasoned with olive oil, lemon juice, salt and pepper.', 'Middle Eastern', 1, 20, 0, 'Lunch, Dinner, Cold-dish', 4),

('Udon Soup', 'cooking', 'A Japanese noodle soup made with udon noodles.', 'Japanese', 2, 5, 15, 'Lunch, Dinner', 2),
('Ukrainian borscht', 'cooking', 'A hearty soup made with beetroot as a main ingredient, giving it a distinctive red color.', 'Ukrainian', 3, 30, 60, 'Lunch, Dinner', 4),
('Umbrian Lentil Stew', 'cooking', 'Made with lentils and typically includes tomatoes, vegetables, and herbs.', 'Italian', 2, 10, 45, 'Lunch, Dinner', 4),

('Vietnamese Pho', 'cooking', 'A Vietnamese soup consisting of broth, rice noodles, herbs, and meat.', 'Vietnamese', 2, 20, 90, 'Lunch, Dinner', 4),
('Vegetable Terrine', 'cooking', 'Made with layers of cooked or raw vegetables held together by a gelatin made from a vegetable stock or a meat stock.', 'French', 4, 30, 120, 'Lunch, Dinner, Cold-dish', 4),
('Venison Stew', 'cooking', 'A hearty stew made using venison as the main ingredient.', 'International', 3, 20, 120, 'Lunch, Dinner', 4),

('Waldorf Salad', 'cooking', 'An American salad generally made of fresh apples, celery, grapes, and walnuts, dressed in mayonnaise, and usually served on a bed of lettuce.', 'American', 1, 15, 0, 'Lunch, Dinner, Cold-dish', 4),
('Welsh Rarebit', 'cooking', 'A dish made with a savory sauce of melted cheese and various other ingredients and served hot, after being poured over slices of toasted bread.', 'British', 1, 5, 10, 'Snack, Lunch', 4),
('Wiener Schnitzel', 'cooking', 'A traditional Viennese dish made by breading and frying a thin slice of meat (usually veal).', 'Austrian', 2, 10, 10, 'Lunch, Dinner', 4),

('Xiaolongbao', 'cooking', 'Chinese steamed buns filled with meat and broth.', 'Chinese', 4, 30, 20, 'Lunch, Dinner, Snack', 6),
('Xinjiang Lamb Skewers', 'cooking', 'Spicy skewers of grilled lamb, a popular street food from the Xinjiang region.', 'Chinese', 2, 120, 10, 'Dinner, Snack', 6);
DROP TABLE recipes_mealTypes;
CREATE TABLE recipes_mealTypes(
    recipeName VARCHAR(64),
    mealTypeName VARCHAR(64),
    PRIMARY KEY (recipeName,mealTypeName),
    FOREIGN KEY (recipeName) REFERENCES recipes(name),
    FOREIGN KEY (mealTypeName) REFERENCES mealTypes(name)
);

INSERT INTO recipes_mealTypes (recipeName, mealTypeName) VALUES 
('Apple Frangipan Tart', 'Dessert'),
('Apple & Blackberry Crumble', 'Dessert'),

('Apam balik', 'Snack'),

('Ayam Percik', 'Dinner'),

('Bakewell tart', 'Dessert'),
('Bakewell tart', 'Snack'),

('Beef Wellington', 'Dinner'),

('Banana Pancakes', 'Breakfast'),

('Chicken Congee', 'Breakfast'),
('Chicken Congee', 'Dinner'),

('Cannelloni', 'Lunch'),

('Caldo verde', 'Dinner'),

('Dakdoritang', 'Dinner'),

('Danish Pastry', 'Breakfast'),
('Danish Pastry', 'Snack'),

('Dum Aloo', 'Lunch'),

('English Breakfast', 'Breakfast'),
('Eclairs', 'Dessert'),

('Eton Mess', 'Dessert'),

('Fish and Chips', 'Lunch'),
('Fish and Chips', 'Dinner'),
('Fish and Chips', 'Snack'),

('Fajitas', 'Dinner'),

('Falafel', 'Lunch'),
('Falafel', 'Dinner'),
('Falafel', 'Snack'),

('Gazpacho', 'Lunch'),
('Gazpacho', 'Dinner'),
('Gazpacho', 'Cold-dish'),
('Goulash', 'Dinner'),

('Greek Salad', 'Lunch'),
('Greek Salad', 'Dinner'),
('Greek Salad', 'Cold-dish'),

('Hot and Sour Soup', 'Dinner'),
('Hot and Sour Soup', 'Snack'),

('Hummus', 'Snack'),

('Hamburgers', 'Lunch'),
('Hamburgers', 'Dinner'),
('Hamburgers', 'Snack'),

('Irish Coffee', 'Dessert'),

('Indian Curry', 'Lunch'),
('Indian Curry', 'Dinner'),

('Italian Biscotti', 'Snack'),

('Irish Stew', 'Lunch'),
('Irish Stew', 'Dinner'),

('Jambalaya', 'Lunch'),
('Jambalaya', 'Dinner'),

('Jerk Chicken','Dinner'),
('Jerk Chicken','Barbecue'),

('Japanese Curry', 'Dinner'),

('Japanese Cheesecake', 'Dessert'),

('Kimchi Fried Rice', 'Lunch'),
('Kimchi Fried Rice', 'Dinner'),

('Kaiserschmarrn', 'Dessert'),
('Kaiserschmarrn', 'Snack'),

('Kebab', 'Lunch'),
('Kebab', 'Dinner'),
('Kebab', 'Snack'),

('Kimchi Stew', 'Lunch'),
('Kimchi Stew', 'Dinner'),

('Key Lime Pie', 'Dessert'),

('Lasagna', 'Lunch'),
('Lasagna', 'Dinner'),

('Lamb Tagine', 'Dinner'),

('Lobster Bisque', 'Dinner'),

('Moussaka', 'Dinner'),

('Mapo Tofu', 'Lunch'),
('Mapo Tofu', 'Dinner'),

('Macaron', 'Dessert'),
('Macaron', 'Snack'),

('Nachos', 'Snack'),
('Nasi Goreng', 'Lunch'),

('Nougat', 'Dessert'),
('Nougat', 'Snack'),

('Osso Buco', 'Lunch'),

('Oysters Kilpatrick', 'Appetizer'),

('Okonomiyaki', 'Lunch'),
('Okonomiyaki', 'Dinner'),
('Okonomiyaki', 'Snack'),

('Paella', 'Lunch'),
('Paella', 'Dinner'),

('Pierogi', 'Lunch'),
('Pierogi', 'Dinner'),
('Pierogi', 'Snack'),

('Peking Duck', 'Dinner'),

('Quiche Lorraine', 'Breakfast'),
('Quiche Lorraine', 'Brunch'),
('Quiche Lorraine', 'Snack'),

('Quesadilla', 'Snack'),

('Quinoa Salad', 'Lunch'),
('Quinoa Salad', 'Dinner'),
('Quinoa Salad', 'Cold-dish'),

('Ratatouille', 'Lunch'),
('Ratatouille', 'Dinner'),

('Risotto', 'Lunch'),
('Risotto', 'Dinner'),

('Ramen', 'Lunch'),
('Ramen', 'Dinner'),

('Sushi', 'Lunch'),
('Sushi', 'Dinner'),
('Sushi', 'Snack'),

('Shepherds Pie', 'Lunch'),
('Shepherds Pie', 'Dinner'),

('Samosa', 'Snack'),
('Samosa', 'Appetizer'),

('Tiramisu', 'Dessert'),

('Tacos', 'Lunch'),
('Tacos', 'Dinner'),
('Tacos', 'Snack'),

('Tabbouleh', 'Lunch'),
('Tabbouleh', 'Dinner'),
('Tabbouleh', 'Cold-dish'),

('Udon Soup', 'Lunch'),
('Udon Soup', 'Dinner'),

('Ukrainian borscht', 'Lunch'),
('Ukrainian borscht', 'Dinner'),

('Umbrian Lentil Stew', 'Lunch'),
('Umbrian Lentil Stew', 'Dinner'),

('Vietnamese Pho', 'Lunch'),
('Vietnamese Pho', 'Dinner'),

('Vegetable Terrine', 'Lunch'),
('Vegetable Terrine', 'Dinner'),
('Vegetable Terrine', 'Cold-dish'),

('Venison Stew', 'Lunch'),

('Waldorf Salad', 'Lunch'),
('Waldorf Salad', 'Dinner'),
('Waldorf Salad', 'Cold-dish'),

('Welsh Rarebit', 'Snack'),
('Welsh Rarebit', 'Lunch'),

('Wiener Schnitzel', 'Lunch'),
('Wiener Schnitzel', 'Dinner'),

('Xiaolongbao', 'Lunch'),
('Xiaolongbao', 'Dinner'),
('Xiaolongbao', 'Snack'),

('Xinjiang Lamb Skewers', 'Dinner'),
('Xinjiang Lamb Skewers', 'Snack');

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

DROP TABLE recipes_usageTips;

CREATE TABLE recipes_usageTips(
    recipeName VARCHAR(64),
    usageTipNumber SMALL INT,
    usageTip VARCHAR(256),
    PRIMARY KEY (recipeName, usageTipNumber),
    FOREIGN KEY (recipeName) REFERENCES recipes(name)
);

INSERT INTO recipes_usageTips (recipeName, usageTipNumber, usageTip) VALUES 
('Apam balik', 1, 'Best served warm with a sprinkle of sugar and crushed peanuts'),
('Apam balik', 2, 'Store any leftovers in an airtight container to maintain freshness'),
('Apple & Blackberry Crumble', 1, 'Serve with a scoop of vanilla ice cream for a delicious contrast of warm and cold'),
('Apple & Blackberry Crumble', 2, 'Leftovers can be reheated in the oven for a few minutes to regain crispiness'),
('Apple & Blackberry Crumble', 3, 'Make extra crumble topping and freeze it for future use'),
('Apple Frangipan Tart', 1, 'Dust with powdered sugar before serving for an elegant touch'),
('Apple Frangipan Tart', 2, 'Refrigerate any leftovers and reheat in the oven for a few minutes before serving again'),
('Ayam Percik', 1, 'Marinate the chicken overnight for maximum flavor absorption'),
('Ayam Percik', 2, 'Brush with extra marinade while grilling for added moisture and flavor'),
('Ayam Percik', 3, 'Serve with steamed rice and a side of cucumber slices'),
('Bakewell tart', 1, 'Serve at room temperature with a dollop of whipped cream or custard'),
('Bakewell tart', 2, 'For extra indulgence, drizzle with a raspberry coulis before serving'),
('Bakewell tart', 3, 'Leftovers can be enjoyed cold or reheated in the microwave'),
('Banana Pancakes', 1, 'Top with sliced bananas and a drizzle of maple syrup'),
('Banana Pancakes', 2, 'Add a pinch of cinnamon to the batter for extra flavor'),
('Banana Pancakes', 3, 'Leftover pancakes can be frozen and reheated in the toaster for a quick breakfast');
INSERT INTO recipes_usageTips (recipeName, usageTipNumber, usageTip) VALUES 
('Beef Wellington', 1, 'Rest the beef wellington before slicing to allow the juices to redistribute'),
('Beef Wellington', 2, 'For a perfectly golden crust, brush the pastry with egg wash before baking'),
('Beef Wellington', 3, 'Serve with a rich red wine sauce or a creamy mushroom sauce on the side'),
('Caldo verde', 1, 'Garnish with a drizzle of olive oil and freshly chopped parsley before serving'),
('Caldo verde', 2, 'For extra creaminess, swirl in a spoonful of sour cream or Greek yogurt before serving'),
('Caldo verde', 3, 'Serve with crusty bread or cornbread on the side for a complete meal'),
('Cannelloni', 1, 'Top with extra grated cheese before baking for a golden, cheesy crust'),
('Cannelloni', 2, 'Serve with a side salad dressed with balsamic vinaigrette for a refreshing contrast'),
('Cannelloni', 3, 'Leftovers can be frozen and reheated in the oven for a quick and easy meal'),
('Chicken Congee', 1, 'Garnish with sliced green onions, chopped cilantro, and a drizzle of sesame oil before serving'),
('Chicken Congee', 2, 'For extra flavor, add a few drops of soy sauce or fish sauce to taste'),
('Chicken Congee', 3, 'Serve with Chinese fried dough sticks (youtiao) or steamed buns on the side'),
('Dakdoritang', 1, 'Adjust the spiciness by adding more or less gochujang (Korean red chili paste)'),
('Dakdoritang', 2, 'For added depth of flavor, simmer the stew for an extra 10-15 minutes before serving'),
('Dakdoritang', 3, 'Serve with a bowl of steamed rice and kimchi on the side'),
('Danish Pastry', 1, 'Top with a simple glaze made from powdered sugar and milk for a glossy finish'),
('Danish Pastry', 2, 'For extra richness, sprinkle chopped nuts or chocolate chips over the filling before folding'),
('Danish Pastry', 3, 'Enjoy warm from the oven or toast lightly before serving for a crispy exterior'),
('Dum Aloo', 1, 'Garnish with a sprinkle of chopped fresh cilantro or parsley before serving'),
('Dum Aloo', 2, 'For extra creaminess, stir in a spoonful of yogurt or sour cream just before serving'),
('Dum Aloo', 3, 'Serve with naan bread or steamed rice for a complete meal');
INSERT INTO recipes_usageTips (recipeName, usageTipNumber, usageTip) VALUES 
('Eclairs', 1, 'Drizzle with melted chocolate or caramel sauce for an indulgent finish'),
('Eclairs', 2, 'For added texture, sprinkle chopped nuts or toasted coconut over the icing before it sets'),
('Eclairs', 3, 'Store in an airtight container in the refrigerator for up to three days'),
('English Breakfast', 1, 'Serve with toast, butter, and a selection of jams or marmalades on the side'),
('English Breakfast', 2, 'Brew a pot of strong English breakfast tea to accompany the meal'),
('English Breakfast', 3, 'For a vegetarian option, swap out the bacon and sausage for vegetarian alternatives'),
('Eton Mess', 1, 'Top with extra fresh berries and a drizzle of fruit coulis for a burst of flavor and color'),
('Eton Mess', 2, 'For extra crunch, sprinkle crushed meringue or toasted nuts over the whipped cream'),
('Eton Mess', 3, 'Serve immediately after assembling to prevent the meringue from becoming soggy'),
('Fajitas', 1, 'Serve with warm flour tortillas and a selection of toppings such as guacamole, salsa, and sour cream'),
('Fajitas', 2, 'For extra flavor, marinate the meat in lime juice, garlic, and spices before cooking'),
('Fajitas', 3, 'Add grilled vegetables such as bell peppers and onions to make it a complete meal'),
('Falafel', 1, 'Serve with tahini sauce or tzatziki for dipping'),
('Falafel', 2, 'For added freshness, serve with a side of tabbouleh salad or pickled vegetables'),
('Falafel', 3, 'Stuff falafel into pita bread with lettuce, tomatoes, and onions for a satisfying sandwich'),
('Fish and Chips', 1, 'Serve with malt vinegar, tartar sauce, or ketchup for dipping'),
('Fish and Chips', 2, 'For extra crunch, double fry the potatoes or use a beer batter for the fish'),
('Fish and Chips', 3, 'Serve with mushy peas or a side salad to balance out the meal'),
('Gazpacho', 1, 'Garnish with a drizzle of extra virgin olive oil and a sprinkle of fresh herbs before serving'),
('Gazpacho', 2, 'For added texture, top with diced cucumber, bell pepper, and croutons before serving'),
('Gazpacho', 3, 'Chill in the refrigerator for at least an hour before serving to enhance the flavors'),
('Goulash', 1, 'Serve with a dollop of sour cream and a sprinkle of chopped fresh parsley or dill on top'),
('Goulash', 2, 'For extra richness, stir in a tablespoon of tomato paste or red wine before simmering'),
('Goulash', 3, 'Serve over cooked egg noodles, rice, or mashed potatoes for a hearty meal');
INSERT INTO recipes_usageTips (recipeName, usageTipNumber, usageTip) VALUES 
('Greek Salad', 1, 'Drizzle with extra virgin olive oil and a squeeze of fresh lemon juice before serving'),
('Greek Salad', 2, 'For extra flavor, add a sprinkle of dried oregano and crumbled feta cheese on top'),
('Greek Salad', 3, 'Serve with crusty bread or pita on the side for a complete meal'),
('Hamburgers', 1, 'Top with your favorite condiments and vegetables such as lettuce, tomato, and onion'),
('Hamburgers', 2, 'For extra flavor, mix seasonings such as Worcestershire sauce or garlic powder into the ground beef before forming patties'),
('Hamburgers', 3, 'Serve with crispy french fries or onion rings on the side for a classic diner experience'),
('Hot and Sour Soup', 1, 'Garnish with sliced green onions and a drizzle of sesame oil before serving'),
('Hot and Sour Soup', 2, 'For extra heat, add more white pepper or chili paste to taste'),
('Hot and Sour Soup', 3, 'Serve with crispy wonton strips or steamed rice on the side for a complete meal'),
('Hummus', 1, 'Drizzle with extra virgin olive oil and a sprinkle of paprika before serving'),
('Hummus', 2, 'For extra flavor, add roasted garlic, sun-dried tomatoes, or roasted red peppers to the hummus mixture'),
('Hummus', 3, 'Serve with warm pita bread, crackers, or fresh vegetables for dipping'),
('Indian Curry', 1, 'Serve with basmati rice, naan bread, or roti for soaking up the delicious sauce'),
('Indian Curry', 2, 'For extra richness, stir in a splash of coconut milk or heavy cream before serving'),
('Indian Curry', 3, 'Garnish with fresh cilantro or chopped nuts for added flavor and texture'),
('Irish Coffee', 1, 'Top with a dollop of whipped cream and a sprinkle of ground nutmeg or cinnamon before serving'),
('Irish Coffee', 2, 'For extra indulgence, drizzle with chocolate syrup or sprinkle with shaved chocolate before adding the cream'),
('Irish Coffee', 3, 'Serve with a side of shortbread cookies or biscotti for dipping'),
('Irish Stew', 1, 'Serve with crusty bread or Irish soda bread for soaking up the flavorful broth'),
('Irish Stew', 2, 'For extra richness, stir in a tablespoon of tomato paste or red wine before simmering'),
('Irish Stew', 3, 'Garnish with chopped fresh parsley or thyme for a pop of color and flavor'),
('Italian Biscotti', 1, 'Dip in a cup of espresso or Vin Santo for a traditional Italian treat'),
('Italian Biscotti', 2, 'For extra flavor, add chopped nuts, dried fruit, or chocolate chips to the biscotti dough'),
('Italian Biscotti', 3, 'Store in an airtight container at room temperature for up to two weeks'),
('Jambalaya', 1, 'Serve with hot sauce or a sprinkle of cayenne pepper for extra heat'),
('Jambalaya', 2, 'For extra flavor, use andouille sausage or smoked ham in the recipe'),
('Jambalaya', 3, 'Garnish with chopped green onions or fresh parsley before serving for added freshness');
INSERT INTO recipes_usageTips (recipeName, usageTipNumber, usageTip) VALUES 
('Japanese Cheesecake', 1, 'Dust with powdered sugar or cocoa powder before serving for an elegant touch'),
('Japanese Cheesecake', 2, 'Serve with a dollop of whipped cream and fresh berries on the side'),
('Japanese Cheesecake', 3, 'Chill in the refrigerator for a few hours before serving for a firmer texture'),
('Japanese Curry', 1, 'Serve with steamed rice or Japanese-style pickles (tsukemono) on the side'),
('Japanese Curry', 2, 'For extra flavor, stir in a spoonful of Japanese curry roux or honey before serving'),
('Japanese Curry', 3, 'Garnish with pickled ginger or chopped green onions for added freshness and color'),
('Jerk Chicken', 1, 'Serve with traditional Jamaican side dishes such as rice and peas, fried plantains, and festival bread'),
('Jerk Chicken', 2, 'For extra heat, marinate the chicken in jerk seasoning overnight before grilling'),
('Jerk Chicken', 3, 'Garnish with lime wedges and fresh cilantro before serving for added flavor and brightness'),
('Kaiserschmarrn', 1, 'Serve dusted with powdered sugar and a drizzle of fruit compote or maple syrup'),
('Kaiserschmarrn', 2, 'For extra richness, sprinkle with toasted almonds or top with a scoop of vanilla ice cream'),
('Kaiserschmarrn', 3, 'Enjoy as a dessert or sweet breakfast dish with a cup of coffee or tea'),
('Kebab', 1, 'Serve wrapped in warm pita bread with a generous dollop of tzatziki sauce'),
('Kebab', 2, 'For extra flavor, marinate the meat in yogurt, lemon juice, and spices before grilling'),
('Kebab', 3, 'Serve with a side of tabbouleh salad or grilled vegetables for a complete meal'),
('Key Lime Pie', 1, 'Top with whipped cream or meringue before serving for an extra decadent touch'),
('Key Lime Pie', 2, 'For extra tanginess, garnish with lime zest or thinly sliced lime wedges before serving'),
('Key Lime Pie', 3, 'Chill in the refrigerator for at least two hours before serving for a firm, set filling');
INSERT INTO recipes_usageTips (recipeName, usageTipNumber, usageTip) VALUES 
('Kimchi Fried Rice', 1, 'Serve with a fried egg on top for added richness and flavor'),
('Kimchi Fried Rice', 2, 'For extra heat, add more gochujang (Korean red chili paste) or kimchi juice to taste'),
('Kimchi Fried Rice', 3, 'Garnish with sliced green onions and toasted sesame seeds before serving for added freshness and crunch'),
('Kimchi Stew', 1, 'Serve with a bowl of steamed rice and a side of kimchi on the side'),
('Kimchi Stew', 2, 'For extra depth of flavor, add a spoonful of doenjang (Korean fermented soybean paste) or gochujang (Korean red chili paste)'),
('Kimchi Stew', 3, 'Garnish with sliced green onions and a drizzle of sesame oil before serving for added flavor and freshness'),
('Lamb Tagine', 1, 'Serve with couscous or crusty bread to soak up the flavorful sauce'),
('Lamb Tagine', 2, 'For extra richness, stir in a handful of dried fruits such as apricots or raisins before serving'),
('Lamb Tagine', 3, 'Garnish with chopped fresh cilantro or parsley before serving for added freshness and color'),
('Lasagna', 1, 'Let it rest for 10-15 minutes before slicing to allow the layers to set'),
('Lasagna', 2, 'For extra cheesiness, add a sprinkle of grated Parmesan or mozzarella cheese on top before baking'),
('Lasagna', 3, 'Serve with garlic bread and a side salad for a complete meal'),
('Lobster Bisque', 1, 'Garnish with a drizzle of heavy cream and a sprinkle of fresh chives or tarragon before serving'),
('Lobster Bisque', 2, 'For extra richness, stir in a tablespoon of brandy or sherry just before serving'),
('Lobster Bisque', 3, 'Serve with crusty bread or oyster crackers on the side for dipping'),
('Macaron', 1, 'Let the macarons rest for 30 minutes before baking to develop a smooth, shiny surface'),
('Macaron', 2, 'For extra flavor, add a teaspoon of instant espresso powder or matcha powder to the meringue mixture'),
('Macaron', 3, 'Store in an airtight container in the refrigerator for up to three days to allow the flavors to meld'),
('Mapo Tofu', 1, 'Garnish with sliced green onions and a sprinkle of toasted sesame seeds before serving'),
('Mapo Tofu', 2, 'For extra heat, add more doubanjiang (Chinese chili bean paste) or chili oil to taste'),
('Mapo Tofu', 3, 'Serve with steamed rice or noodles for a satisfying meal'),
('Moussaka', 1, 'Let it rest for 10-15 minutes before slicing to allow the layers to set'),
('Moussaka', 2, 'For extra richness, sprinkle grated cheese or breadcrumbs on top before baking'),
('Moussaka', 3, 'Serve with a Greek salad and crusty bread for a complete meal'),
('Nachos', 1, 'Top with your favorite toppings such as salsa, guacamole, sour cream, and jalapenos'),
('Nachos', 2, 'For extra flavor, add seasoned ground beef, shredded chicken, or black beans to the nachos'),
('Nachos', 3, 'Serve immediately after assembling to prevent the chips from becoming soggy'),
('Nasi Goreng', 1, 'Top with a fried egg and a sprinkle of crispy shallots before serving'),
('Nasi Goreng', 2, 'For extra heat, add more sambal oelek or chopped fresh chili peppers to taste'),
('Nasi Goreng', 3, 'Garnish with sliced cucumber, tomato wedges, and a wedge of lime before serving for added freshness'),
('Nougat', 1, 'Cut into bite-sized pieces and wrap individually in parchment paper for a sweet treat on the go'),
('Nougat', 2, 'For extra crunch, add toasted nuts such as almonds, pistachios, or hazelnuts to the nougat mixture'),
('Nougat', 3, 'Store in an airtight container at room temperature for up to two weeks');
INSERT INTO recipes_usageTips (recipeName, usageTipNumber, usageTip) VALUES 
('Okonomiyaki', 1, 'Top with a drizzle of okonomiyaki sauce, Japanese mayo, and bonito flakes before serving'),
('Okonomiyaki', 2, 'For extra flavor, add chopped cabbage, scallions, shrimp, or pork belly to the batter'),
('Okonomiyaki', 3, 'Serve with a side of pickled ginger and a bowl of miso soup for a complete meal'),
('Osso Buco', 1, 'Serve with creamy polenta, mashed potatoes, or crusty bread to soak up the flavorful sauce'),
('Osso Buco', 2, 'For extra richness, stir in a tablespoon of gremolata (lemon zest, garlic, and parsley) just before serving'),
('Osso Buco', 3, 'Garnish with chopped fresh parsley or lemon zest before serving for added freshness and flavor'),
('Oysters Kilpatrick', 1, 'Top with crispy bacon pieces and a sprinkle of breadcrumbs before grilling'),
('Oysters Kilpatrick', 2, 'For extra flavor, add a dash of Worcestershire sauce or hot sauce to each oyster before grilling'),
('Oysters Kilpatrick', 3, 'Serve with lemon wedges and a glass of chilled white wine for an elegant appetizer'),
('Paella', 1, 'Garnish with lemon wedges and fresh parsley before serving for added freshness and color'),
('Paella', 2, 'For extra flavor, use homemade seafood or chicken stock instead of water to cook the rice'),
('Paella', 3, 'Serve with a side of crusty bread and a glass of Spanish wine for a complete meal'),
('Peking Duck', 1, 'Serve with Mandarin pancakes, hoisin sauce, and thinly sliced scallions for wrapping'),
('Peking Duck', 2, 'For extra crispiness, hang the duck in front of a fan or air-dry'),
('Peking Duck', 3, 'Serve with steamed buns or lettuce cups for a variation in presentation'),
('Pierogi', 1, 'Serve with sour cream or applesauce for dipping'),
('Pierogi', 2, 'For extra flavor, sauté in butter until golden brown and crispy before serving'),
('Pierogi', 3, 'Freeze any leftovers for a quick and easy meal later on'),
('Quesadilla', 1, 'Serve with salsa, guacamole, and sour cream for dipping'),
('Quesadilla', 2, 'For extra flavor, add cooked chicken, steak, or shrimp to the filling mixture'),
('Quesadilla', 3, 'Cut into wedges and serve immediately while warm and crispy');
INSERT INTO recipes_usageTips (recipeName, usageTipNumber, usageTip) VALUES 
('Quiche Lorraine', 1, 'Serve with a side salad dressed with balsamic vinaigrette for a light and refreshing meal'),
('Quiche Lorraine', 2, 'For extra richness, use heavy cream instead of milk in the custard mixture'),
('Quiche Lorraine', 3, 'Enjoy warm or at room temperature for breakfast, brunch, or lunch'),
('Quinoa Salad', 1, 'Garnish with chopped fresh herbs such as parsley, cilantro, or mint before serving'),
('Quinoa Salad', 2, 'For extra flavor, add diced avocado, cherry tomatoes, or crumbled feta cheese to the salad mixture'),
('Quinoa Salad', 3, 'Serve chilled or at room temperature as a side dish or light meal option'),
('Ramen', 1, 'Top with sliced green onions, nori strips, and a seasoned soft-boiled egg before serving'),
('Ramen', 2, 'For extra flavor, add a spoonful of miso paste, soy sauce, or chili oil to the broth'),
('Ramen', 3, 'Customize with your favorite toppings such as sliced pork, tofu, mushrooms, or corn kernels'),
('Ratatouille', 1, 'Garnish with a drizzle of extra virgin olive oil and a sprinkle of fresh basil or parsley before serving'),
('Ratatouille', 2, 'For extra richness, sprinkle grated Parmesan or crumbled goat cheese on top before serving'),
('Ratatouille', 3, 'Serve as a side dish, over pasta, or with crusty bread for a complete meal'),
('Risotto', 1, 'Stir in a knob of butter and a handful of grated Parmesan cheese for extra creaminess before serving'),
('Risotto', 2, 'For extra flavor, add cooked vegetables, mushrooms, or seafood to the risotto halfway through cooking'),
('Risotto', 3, 'Garnish with fresh herbs such as parsley, chives, or thyme for added freshness and color'),
('Samosa', 1, 'Serve with tamarind chutney, mint chutney, or mango chutney for dipping'),
('Samosa', 2, 'For extra heat, add more green chilies or red chili powder to the filling mixture'),
('Samosa', 3, 'Enjoy as a snack or appetizer with a cup of chai tea or your favorite beverage'),
('Shepherds Pie', 1, 'For extra flavor, stir in a tablespoon of Worcestershire sauce or tomato paste to the meat mixture'),
('Shepherds Pie', 2, 'Top with grated cheddar cheese or mashed sweet potatoes for a twist on the classic recipe'),
('Shepherds Pie', 3, 'Bake until the top is golden brown and crispy for the perfect finishing touch'),
('Sushi', 1, 'Serve with soy sauce, pickled ginger, and wasabi for dipping'),
('Sushi', 2, 'For extra flavor, add a thin layer of spicy mayo or eel sauce on top of the sushi rolls'),
('Sushi', 3, 'Experiment with different fillings such as raw fish, cooked shrimp, avocado, cucumber, or cream cheese');
INSERT INTO recipes_usageTips (recipeName, usageTipNumber, usageTip) VALUES 
('Tabbouleh', 1, 'For extra freshness, add chopped mint or basil to the tabbouleh mixture before serving'),
('Tabbouleh', 2, 'Serve with grilled pita bread or falafel for a complete Middle Eastern meal'),
('Tabbouleh', 3, 'Drizzle with extra virgin olive oil and a squeeze of fresh lemon juice for added flavor before serving'),
('Tacos', 1, 'Serve with salsa, guacamole, sour cream, and lime wedges for topping and garnish'),
('Tacos', 2, 'For extra flavor, marinate the meat in lime juice, garlic, and spices before cooking'),
('Tacos', 3, 'Use soft tortillas for traditional tacos or crispy taco shells for a crunchy texture'),
('Tiramisu', 1, 'Dust with cocoa powder or grated chocolate before serving for an elegant finish'),
('Tiramisu', 2, 'For extra indulgence, drizzle with coffee liqueur or rum over the ladyfinger layers before adding the mascarpone mixture'),
('Tiramisu', 3, 'Chill in the refrigerator for at least four hours or overnight to allow the flavors to meld together'),
('Udon Soup', 1, 'Top with sliced green onions, kamaboko (fish cake), and a sprinkle of sesame seeds before serving'),
('Udon Soup', 2, 'For extra flavor, add a spoonful of miso paste or soy sauce to the broth before serving'),
('Udon Soup', 3, 'Customize with your favorite toppings such as tempura, tofu, spinach, or narutomaki (fish cake)'),
('Ukrainian borscht', 1, 'Serve with a dollop of sour cream and a sprinkle of fresh dill or parsley on top'),
('Ukrainian borscht', 2, 'For extra richness, stir in a spoonful of vinegar or lemon juice just before serving'),
('Ukrainian borscht', 3, 'Enjoy with a slice of hearty rye bread or pampushky (Ukrainian garlic bread rolls)'),
('Umbrian Lentil Stew', 1, 'Garnish with a drizzle of extra virgin olive oil and a sprinkle of grated Parmesan cheese before serving'),
('Umbrian Lentil Stew', 2, 'For extra flavor, stir in a spoonful of tomato paste or balsamic vinegar before simmering'),
('Umbrian Lentil Stew', 3, 'Serve with crusty bread or polenta for a hearty and satisfying meal'),
('Vegetable Terrine', 1, 'Serve with a dollop of herbed yogurt or tomato sauce on the side'),
('Vegetable Terrine', 2, 'For extra flavor, add roasted garlic, sun-dried tomatoes, or olives to the vegetable mixture'),
('Vegetable Terrine', 3, 'Chill in the refrigerator for at least four hours or overnight to allow the terrine to set before slicing'),
('Venison Stew', 1, 'Serve with mashed potatoes, buttered noodles, or crusty bread for soaking up the flavorful gravy'),
('Venison Stew', 2, 'For extra richness, stir in a tablespoon of red currant jelly or cocoa powder before simmering'),
('Venison Stew', 3, 'Garnish with chopped fresh parsley or rosemary before serving for added freshness and flavor');
INSERT INTO recipes_usageTips (recipeName, usageTipNumber, usageTip) VALUES 
('Vietnamese Pho', 1, 'Top with bean sprouts, fresh herbs, lime wedges, and sliced chili peppers before serving'),
('Vietnamese Pho', 2, 'For extra flavor, add a splash of fish sauce or hoisin sauce to the broth before serving'),
('Vietnamese Pho', 3, 'Customize with your favorite toppings such as thinly sliced beef, cooked chicken, tofu, or shrimp'),
('Waldorf Salad', 1, 'For extra crunch, add toasted walnuts or pecans to the salad mixture before serving'),
('Waldorf Salad', 2, 'Serve on a bed of lettuce or mixed greens for a refreshing and light meal option'),
('Waldorf Salad', 3, 'Drizzle with a creamy dressing such as ranch or blue cheese before serving for added flavor'),
('Welsh Rarebit', 1, 'Serve with crusty bread or toasted English muffins for a classic British meal'),
('Welsh Rarebit', 2, 'For extra flavor, add a spoonful of Worcestershire sauce or mustard to the cheese sauce before serving'),
('Welsh Rarebit', 3, 'Broil until bubbly and golden brown for the perfect finishing touch'),
('Wiener Schnitzel', 1, 'Serve with lemon wedges and a sprinkle of chopped parsley before serving'),
('Wiener Schnitzel', 2, 'For extra flavor, season the breadcrumbs with salt, pepper, and paprika before breading the veal cutlets'),
('Wiener Schnitzel', 3, 'Enjoy with a side of potato salad, cucumber salad, or lingonberry jam for a traditional Austrian meal'),
('Xiaolongbao', 1, 'Serve with black vinegar, shredded ginger, and a few drops of chili oil for dipping'),
('Xiaolongbao', 2, 'For extra flavor, add a spoonful of hot broth or soup to each dumpling before eating'),
('Xiaolongbao', 3, 'Be careful when biting into the dumplings as the hot soup inside can be very hot'),
('Xinjiang Lamb Skewers', 1, 'Serve with a sprinkle of cumin and chili powder for added flavor'),
('Xinjiang Lamb Skewers', 2, 'For extra richness, brush with a mixture of melted butter and minced garlic before grilling'),
('Xinjiang Lamb Skewers', 3, 'Enjoy with a side of naan bread or steamed rice for a complete meal');


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
    FOREIGN KEY (ingredientName) REFERENCES ingredients(name)
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

DROP TABLE ingredients;

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

INSERT INTO ingredients (name, foodGroup, unitOfMeasure, caloriesPerUnitOfMeasure, proteinsPerUnitOfMeasure, carbohydratesPerUnitOfMeasure, fatsPerUnitOfMeasure, sugarsPerUnitOfMeasure) VALUES
('Eggs', 'Dairy, Eggs, and Products', 'large (50g each)', 70, 6, 1, 5, 1),
('Flour', 'Cereals and Products', 'cup (120g)', 455, 13, 95, 1, 1),
('Peanut filling', 'Various Plant-Based Foods', 'cup (100g)', 588, 25, 20, 50, 9),
('Apples', 'Various Plant-Based Foods', 'medium (182g)', 95, 0, 25, 0, 19),
('Blackberries', 'Various Plant-Based Foods', 'cup (144g)', 62, 2, 14, 1, 7),
('Butter', 'Dairy, Eggs, and Products', 'tablespoon (14g)', 102, 0, 0, 12, 0),
('Sugar', 'Sweeteners', 'tablespoon (12.6g)', 49, 0, 13, 0, 13),
('Frangipane', 'Various Plant-Based Foods', '100g', 400, 4, 44, 24, 24),
('Pastry crust', 'Cereals and Products', 'piece (60g)', 200, 3, 20, 11, 0),
('Chicken', 'Meat and Products', '100g', 239, 27, 0, 14, 0),
('Coconut milk', 'Various Plant-Based Foods', 'cup (240g)', 552, 5, 13, 57, 8),
('Lemongrass', 'Spices and Essential Oils', 'stalk (18g)', 5, 0, 1, 0, 0),
('Jam', 'Preserved Foods', 'tablespoon (20g)', 56, 0, 14, 0, 10),
('Bananas', 'Various Plant-Based Foods', 'medium (118g)', 105, 1, 27, 0, 14),
('Beef fillet', 'Meat and Products', '100g', 250, 26, 0, 15, 0),
('Mushroom duxelles', 'Various Plant-Based Foods', '100g', 70, 3, 5, 5, 2),
('Puff pastry', 'Cereals and Products', 'ounce (28g)', 158, 2, 11, 11, 0),
('Chorizo', 'Meat and Products', 'slice (10g)', 50, 3, 0, 5, 0),
('Garlic', 'Various Plant-Based Foods', 'clove (3g)', 5, 0, 1, 0, 0),
('Kale', 'Various Plant-Based Foods', 'cup (67g)', 34, 2, 6, 1, 0),
('Onion', 'Various Plant-Based Foods', 'medium (110g)', 44, 1, 10, 0, 5),
('Potatoes', 'Various Plant-Based Foods', 'medium (173g)', 161, 4, 37, 0, 2),
('Cannelloni tubes', 'Cereals and Products', 'piece (30g)', 90, 3, 18, 1, 1),
('Ricotta cheese', 'Dairy, Eggs, and Products', 'cup (248g)', 428, 28, 8, 32, 1),
('Spinach', 'Various Plant-Based Foods', 'cup (30g)', 7, 1, 1, 0, 0),
('Chicken breast', 'Meat and Products', '100g', 165, 31, 0, 4, 0),
('Ginger', 'Spices and Essential Oils', 'tablespoon (6g)', 5, 0, 1, 0, 0),
('Rice', 'Cereals and Products', 'cup (cooked, 158g)', 206, 5, 45, 0, 0),
('Carrots', 'Various Plant-Based Foods', 'medium (61g)', 25, 1, 6, 0, 3),
('Gochujang (Korean chili paste)', 'Preserved Foods', 'tablespoon (20g)', 45, 2, 9, 1, 7),
('Soy sauce', 'Preserved Foods', 'tablespoon (18g)', 10, 2, 1, 0, 0),
('Cumin seeds', 'Spices and Essential Oils', 'teaspoon (2g)', 8, 0, 1, 0, 0),
('Garam Masala', 'Spices and Essential Oils', 'teaspoon (2g)', 6, 0, 1, 0, 0),
('Tomatoes', 'Various Plant-Based Foods', 'medium (123g)', 22, 1, 5, 0, 3),
('Chocolate glaze', 'Sweeteners', 'tablespoon (20g)', 100, 1, 15, 5, 12),
('Choux pastry', 'Cereals and Products', 'piece (10g)', 30, 1, 3, 2, 1),
('Pastry cream', 'Dairy, Eggs, and Products', 'cup (250g)', 305, 6, 30, 18, 23),
('Bacon', 'Meat and Products', 'slice (8g)', 42, 3, 0, 3, 0),
('Sausages', 'Meat and Products', 'link (50g)', 142, 7, 1, 12, 1),
('Meringue', 'Sweeteners', 'piece (30g)', 95, 1, 22, 0, 22),
('Strawberries', 'Various Plant-Based Foods', 'cup (152g)', 49, 1, 12, 0, 7),
('Whipping cream', 'Dairy, Eggs, and Products', 'cup (60g)', 154, 1, 4, 16, 3);
-- Continue adding more entries similarly for the remaining ingredients
INSERT INTO ingredients (name, foodGroup, unitOfMeasure, caloriesPerUnitOfMeasure, proteinsPerUnitOfMeasure, carbohydratesPerUnitOfMeasure, fatsPerUnitOfMeasure, sugarsPerUnitOfMeasure) VALUES
('Bell peppers', 'Various Plant-Based Foods', 'medium (119g)', 24, 1, 6, 0, 4),
('Fajita seasoning', 'Spices and Essential Oils', 'tablespoon (8g)', 20, 0, 4, 0, 0),
('Tortillas', 'Cereals and Products', 'each (medium, 40g)', 94, 2, 16, 2, 0),
('Chickpeas', 'Various Plant-Based Foods', 'cup (cooked, 164g)', 269, 15, 45, 4, 8),
('Cumin', 'Spices and Essential Oils', 'teaspoon (2g)', 8, 0, 1, 0, 0),
('Parsley', 'Spices and Essential Oils', 'cup (chopped, 60g)', 22, 2, 4, 0, 0),
('Beer', 'Various Beverages', 'can (356ml)', 154, 2, 13, 0, 0),
('White fish fillets', 'Fish and Products', 'fillet (180g)', 206, 42, 0, 2, 0),
('Bell pepper', 'Various Plant-Based Foods', 'medium (119g)', 24, 1, 6, 0, 4),
('Cucumber', 'Various Plant-Based Foods', 'medium (201g)', 30, 1, 7, 0, 4),
('Olive oil', 'Fats and Oils', 'tablespoon (13.5g)', 119, 0, 0, 14, 0),
('Red onion', 'Various Plant-Based Foods', 'medium (110g)', 44, 1, 10, 0, 5),
('Vinegar', 'Various Plant-Based Foods', 'tablespoon (15ml)', 3, 0, 0, 0, 0),
('Beef', 'Meat and Products', '100g', 250, 26, 0, 15, 0),
('Onions', 'Various Plant-Based Foods', 'medium (110g)', 44, 1, 10, 0, 5),
('Paprika', 'Spices and Essential Oils', 'teaspoon (2g)', 6, 0, 1, 0, 0),
('Feta cheese', 'Dairy, Eggs, and Products', 'cup (crumbled, 150g)', 396, 21, 6, 32, 0),
('Kalamata olives', 'Various Plant-Based Foods', 'cup (134g)', 275, 2, 15, 23, 0),
('Cheese', 'Dairy, Eggs, and Products', 'slice (28g)', 113, 7, 1, 9, 0),
('Ground beef', 'Meat and Products', '100g', 254, 17, 0, 18, 0),
('Hamburger buns', 'Cereals and Products', 'each (43g)', 120, 4, 21, 2, 3),
('Lettuce', 'Various Plant-Based Foods', 'leaf (5g)', 1, 0, 0, 0, 0),
('Tomato', 'Various Plant-Based Foods', 'medium (123g)', 22, 1, 5, 0, 3),
('Bamboo shoots', 'Various Plant-Based Foods', 'cup (120g)', 20, 2, 3, 0, 2),
('Chicken broth', 'Preserved Foods', 'cup (240ml)', 38, 5, 3, 1, 1),
('Rice vinegar', 'Various Plant-Based Foods', 'tablespoon (15ml)', 3, 0, 0, 0, 0),
('Shiitake mushrooms', 'Various Plant-Based Foods', 'cup (87g)', 35, 2, 7, 0, 2),
('Tofu', 'Various Plant-Based Foods', 'block (122g)', 177, 16, 5, 12, 1),
('Lemon juice', 'Various Plant-Based Foods', 'tablespoon (15ml)', 4, 0, 1, 0, 0),
('Tahini', 'Various Plant-Based Foods', 'tablespoon (15g)', 89, 3, 3, 8, 0),
('Curry powder', 'Spices and Essential Oils', 'teaspoon (2g)', 6, 0, 1, 0, 0),
('Brown sugar', 'Sweeteners', 'tablespoon (12g)', 45, 0, 12, 0, 12),
('Coffee', 'Coffee, Tea, and Related Products', 'cup (240ml)', 2, 0, 0, 0, 0),
('Cream', 'Dairy, Eggs, and Products', 'tablespoon (15ml)', 52, 0, 1, 6, 1),
('Irish whiskey', 'Various Beverages', 'shot (44ml)', 98, 0, 0, 0, 0),
('Beef stock', 'Preserved Foods', 'cup (240ml)', 31, 5, 0, 1, 0),
('Lamb shoulder', 'Meat and Products', '100g', 236, 22, 0, 16, 0),
('Almonds', 'Various Plant-Based Foods', 'cup (143g)', 828, 30, 30, 72, 6),
('Andouille sausage', 'Meat and Products', 'link (85g)', 229, 14, 2, 19, 1),
('Shrimp', 'Fish and Products', '100g', 99, 24, 0, 1, 0),
('Cream cheese', 'Dairy, Eggs, and Products', 'ounce (28g)', 99, 2, 1, 10, 1);
-- Add the next set of ingredients in a similar format
INSERT INTO ingredients (name, foodGroup, unitOfMeasure, caloriesPerUnitOfMeasure, proteinsPerUnitOfMeasure, carbohydratesPerUnitOfMeasure, fatsPerUnitOfMeasure, sugarsPerUnitOfMeasure) VALUES
('Chicken thighs', 'Meat and Products', '100g', 209, 26, 0, 15, 0),
('Green onions', 'Various Plant-Based Foods', '100g', 32, 1, 7, 0, 2),
('Jerk seasoning', 'Spices and Essential Oils', 'teaspoon (2g)', 5, 0, 1, 0, 0),
('Scotch bonnet peppers', 'Various Plant-Based Foods', 'pepper (6.5g)', 2, 0, 0, 0, 0),
('Thyme', 'Spices and Essential Oils', 'tablespoon (1g)', 3, 0, 1, 0, 0),
('Milk', 'Dairy, Eggs, and Products', 'cup (244g)', 103, 8, 12, 2, 12),
('Kebab spices', 'Spices and Essential Oils', 'tablespoon (7g)', 20, 1, 4, 0, 0),
('Lamb', 'Meat and Products', '100g', 294, 25, 0, 24, 0),
('Yogurt', 'Dairy, Eggs, and Products', 'cup (245g)', 154, 13, 17, 9, 17),
('Condensed milk', 'Dairy, Eggs, and Products', 'cup (306g)', 982, 24, 166, 27, 166),
('Graham cracker crust', 'Cereals and Products', 'piece (21g)', 102, 1, 12, 5, 5),
('Lime juice', 'Various Plant-Based Foods', 'tablespoon (15ml)', 4, 0, 1, 0, 0),
('Cooked rice', 'Cereals and Products', 'cup (158g)', 206, 4, 45, 0, 0),
('Kimchi', 'Various Plant-Based Foods', 'cup (150g)', 23, 2, 4, 0, 2),
('Sesame oil', 'Fats and Oils', 'tablespoon (14ml)', 120, 0, 0, 14, 0),
('Pork belly', 'Meat and Products', '100g', 518, 9, 0, 53, 0),
('Cinnamon', 'Spices and Essential Oils', 'teaspoon (2.6g)', 6, 0, 2, 0, 0),
('Dried apricots', 'Fruits and Products', 'cup (130g)', 313, 4, 81, 1, 69),
('Lasagna noodles', 'Cereals and Products', 'piece (56g)', 180, 6, 36, 1, 1),
('Marinara sauce', 'Various Plant-Based Foods', 'cup (240g)', 70, 2, 13, 2, 9),
('Brandy', 'Various Beverages', 'shot (42g)', 95, 0, 0, 0, 0),
('Celery', 'Various Plant-Based Foods', 'stalk (40g)', 6, 0, 1, 0, 1),
('Lobster', 'Fish and Products', '100g', 89, 19, 0, 1, 0),
('Tomato paste', 'Preserved Foods', 'tablespoon (16g)', 13, 1, 3, 0, 2),
('Almond flour', 'Various Plant-Based Foods', 'cup (96g)', 544, 21, 20, 48, 4),
('Egg whites', 'Dairy, Eggs, and Products', 'large (33g)', 17, 4, 0, 0, 0),
('Granulated sugar', 'Sweeteners', 'cup (200g)', 774, 0, 200, 0, 200),
('Doubanjiang (fermented bean paste)', 'Various Plant-Based Foods', 'tablespoon (15g)', 25, 2, 4, 1, 3),
('Green onion', 'Various Plant-Based Foods', '100g', 32, 1, 7, 0, 2),
('Ground pork', 'Meat and Products', '100g', 297, 25, 0, 21, 0),
('Bechamel sauce', 'Dairy, Eggs, and Products', 'cup (250g)', 300, 6, 20, 23, 9),
('Eggplant', 'Various Plant-Based Foods', 'medium (200g)', 50, 2, 12, 0, 7),
('Ground lamb', 'Meat and Products', '100g', 282, 17, 0, 23, 0),
('Cheddar cheese', 'Dairy, Eggs, and Products', 'slice (28g)', 113, 7, 1, 9, 0),
('Jalapenos', 'Various Plant-Based Foods', 'pepper (14g)', 4, 0, 1, 0, 1),
('Salsa', 'Various Plant-Based Foods', 'tablespoon (15g)', 4, 0, 1, 0, 1),
('Tortilla chips', 'Cereals and Products', 'ounce (28g)', 138, 2, 19, 7, 0),
('Kecap Manis (sweet soy sauce)', 'Preserved Foods', 'tablespoon (15ml)', 40, 1, 10, 0, 9),
('Shallots', 'Various Plant-Based Foods', 'medium (10g)', 7, 0, 2, 0, 1),
('Honey', 'Sweeteners', 'tablespoon (21g)', 64, 0, 17, 0, 17),
('Cabbage', 'Various Plant-Based Foods', 'cup (chopped, 89g)', 22, 1, 5, 0, 3),
('Okonomiyaki sauce', 'Preserved Foods', 'tablespoon (18g)', 35, 0, 7, 0, 6),
('Veal shanks', 'Meat and Products', '100g', 178, 18, 0, 9, 0),
('White wine', 'Various Beverages', 'glass (147ml)', 123, 0, 4, 0, 1),
('Oysters', 'Fish and Products', 'medium (25g)', 17, 2, 2, 1, 0),
('Worcestershire sauce', 'Spices and Essential Oils', 'tablespoon (17ml)', 13, 0, 3, 0, 1),
('Saffron', 'Spices and Essential Oils', 'teaspoon (0.7g)', 6, 0, 1, 0, 0),
('Seafood mix', 'Fish and Products', '100g', 89, 19, 0, 1, 0),
('Cucumbers', 'Various Plant-Based Foods', 'medium (201g)', 30, 1, 7, 0, 4),
('Duck', 'Meat and Products', '100g', 337, 27, 0, 28, 0),
('Hoisin sauce', 'Various Plant-Based Foods', 'tablespoon (19g)', 35, 0, 7, 1, 6),
('Egg', 'Dairy, Eggs, and Products', 'large (50g)', 70, 6, 1, 5, 1),
('Potato', 'Various Plant-Based Foods', 'medium (173g)', 161, 4, 37, 0, 2),
('Green peppers', 'Various Plant-Based Foods', 'medium (119g)', 24, 1, 6, 0, 4),
('Cherry tomatoes', 'Various Plant-Based Foods', 'cup (149g)', 27, 1, 6, 0, 4),
('Quinoa', 'Cereals and Products', 'cup (185g)', 222, 8, 39, 4, 0),
('Ramen noodles', 'Cereals and Products', 'package (85g)', 371, 10, 51, 14, 1),
('Yellow squash', 'Various Plant-Based Foods', 'medium (200g)', 31, 2, 7, 0, 4),
('Zucchini', 'Various Plant-Based Foods', 'medium (196g)', 33, 2, 6, 1, 5),
('Arborio rice', 'Cereals and Products', 'cup (192g)', 716, 14, 158, 1, 0),
('Chicken stock', 'Preserved Foods', 'cup (240ml)', 86, 6, 8, 3, 1),
('Parmesan cheese', 'Dairy, Eggs, and Products', 'ounce (28g)', 122, 10, 1, 8, 0),
('Garam masala', 'Spices and Essential Oils', 'teaspoon (2g)', 6, 0, 1, 0, 0),
('Green peas', 'Various Plant-Based Foods', 'cup (160g)', 118, 8, 21, 1, 8),
('Pastry dough', 'Cereals and Products', 'piece (100g)', 455, 6, 45, 30, 1),
('Peas', 'Various Plant-Based Foods', 'cup (160g)', 117, 8, 21, 1, 8),
('Fresh fish (various)', 'Fish and Products', '100g', 206, 22, 0, 12, 0),
('Nori sheets', 'Fish and Products', 'sheet (2.5g)', 9, 1, 1, 0, 0),
('Sushi rice', 'Cereals and Products', 'cup (cooked, 158g)', 296, 6, 65, 0, 0),
('Wasabi', 'Spices and Essential Oils', 'teaspoon (6g)', 15, 0, 3, 0, 0),
('Bulgur', 'Cereals and Products', 'cup (140g)', 479, 17, 106, 2, 0),
('Mint', 'Spices and Essential Oils', 'cup (chopped, 18g)', 12, 1, 2, 0, 0),
('Corn tortillas', 'Cereals and Products', 'each (24g)', 52, 1, 11, 1, 1),
('Espresso', 'Coffee, Tea, and Related Products', 'shot (30ml)', 2, 0, 0, 0, 0),
('Ladyfingers', 'Cereals and Products', 'each (15g)', 47, 1, 8, 1, 3),
('Mascarpone cheese', 'Dairy, Eggs, and Products', 'cup (250g)', 859, 10, 6, 89, 0),
('Dashi broth', 'Various Beverages', 'cup (240ml)', 10, 2, 2, 0, 0),
('Mirin', 'Various Beverages', 'tablespoon (15ml)', 48, 0, 8, 0, 5),
('Mushrooms', 'Various Plant-Based Foods', 'cup (70g)', 15, 2, 2, 0, 1),
('Udon noodles', 'Cereals and Products', 'package (200g)', 200, 6, 42, 1, 2),
('Beetroot', 'Various Plant-Based Foods', 'medium (82g)', 35, 1, 8, 0, 7),
('Lentils', 'Various Plant-Based Foods', 'cup (192g)', 678, 50, 115, 2, 4),
('Gelatin', 'Dairy, Eggs, and Products', 'tablespoon (7g)', 23, 6, 0, 0, 0),
('Venison', 'Meat and Products', '100g', 158, 30, 0, 2, 0),
('Beef brisket', 'Meat and Products', '100g', 248, 28, 0, 19, 0),
('Fish sauce', 'Preserved Foods', 'tablespoon (18ml)', 9, 1, 1, 0, 1),
('Rice noodles', 'Cereals and Products', 'cup (176g)', 192, 4, 44, 0, 0),
('Star anise', 'Spices and Essential Oils', 'whole (2g)', 7, 0, 1, 0, 0),
('Mayonnaise', 'Fats and Oils', 'tablespoon (13g)', 94, 0, 0, 10, 0),
('Walnuts', 'Various Plant-Based Foods', 'cup (120g)', 765, 18, 16, 76, 3),
('Bread', 'Cereals and Products', 'slice (32g)', 85, 3, 16, 1, 2),
('Mustard', 'Spices and Essential Oils', 'tablespoon (15g)', 15, 1, 2, 1, 1),
('Breadcrumbs', 'Cereals and Products', 'cup (120g)', 460, 14, 78, 6, 8),
('Lemon', 'Various Plant-Based Foods', 'whole (58g)', 17, 1, 5, 0, 1),
('Veal cutlets', 'Meat and Products', '100g', 194, 25, 0, 7, 0),
('Garlic powder', 'Spices and Essential Oils', 'teaspoon (3.1g)', 10, 0, 2, 0, 0),
('Salt', 'Spices and Essential Oils', 'teaspoon (6g)', 0, 0, 0, 0, 0);



DROP TABLE recipes_ingredients;
CREATE TABLE recipes_ingredients (
    recipeName VARCHAR(64),
    ingredientName VARCHAR(64),
    quantity INT,
    PRIMARY KEY (recipeName, ingredientName),
    FOREIGN KEY (recipeName) REFERENCES recipes(name)
    FOREIGN KEY (ingredientName) REFERENCES ingredients(name)
);

INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Apam balik', 'Eggs', 2),
('Apam balik', 'Flour', 2), -- Cups
('Apam balik', 'Peanut filling', 1), -- Cups
('Apple & Blackberry Crumble', 'Apples', 3),
('Apple & Blackberry Crumble', 'Blackberries', 2), -- Cups
('Apple & Blackberry Crumble', 'Butter', 4), -- Tablespoons
('Apple & Blackberry Crumble', 'Flour', 1), -- Cups
('Apple & Blackberry Crumble', 'Sugar', 1), -- Cups
('Apple Frangipan Tart', 'Apples', 3),
('Apple Frangipan Tart', 'Frangipane', 1), -- 100g units
('Apple Frangipan Tart', 'Pastry crust', 1),
('Ayam Percik', 'Chicken', 2), -- 100g units
('Ayam Percik', 'Coconut milk', 2), -- Cups
('Ayam Percik', 'Lemongrass', 2),
('Bakewell tart', 'Frangipane', 1), -- 100g units
('Bakewell tart', 'Jam', 1), -- Tablespoons
('Bakewell tart', 'Pastry crust', 1),
('Banana Pancakes', 'Bananas', 2),
('Banana Pancakes', 'Eggs', 2),
('Banana Pancakes', 'Flour', 1), -- Cups
('Beef Wellington', 'Beef fillet', 1), -- 100g units
('Beef Wellington', 'Mushroom duxelles', 1), -- 100g units
('Beef Wellington', 'Puff pastry', 1), -- Ounces
('Caldo verde', 'Chorizo', 2), -- Slices
('Caldo verde', 'Garlic', 2),
('Caldo verde', 'Kale', 1), -- Cups
('Caldo verde', 'Onion', 1),
('Caldo verde', 'Potatoes', 2),
('Cannelloni', 'Cannelloni tubes', 6),
('Cannelloni', 'Ricotta cheese', 1), -- Cups
('Cannelloni', 'Spinach', 2), -- Cups
('Chicken Congee', 'Chicken breast', 2), -- 100g units
('Chicken Congee', 'Ginger', 1), -- Tablespoons
('Chicken Congee', 'Rice', 1), -- Cups
('Dakdoritang', 'Carrots', 2),
('Dakdoritang', 'Chicken', 2), -- 100g units
('Dakdoritang', 'Garlic', 2),
('Dakdoritang', 'Gochujang (Korean chili paste)', 1), -- Tablespoons
('Dakdoritang', 'Potatoes', 2),
('Dakdoritang', 'Soy sauce', 1), -- Tablespoons
('Danish Pastry', 'Butter', 4), -- Tablespoons
('Danish Pastry', 'Flour', 2), -- Cups
('Danish Pastry', 'Sugar', 1); -- Cups

INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Dum Aloo', 'Cumin seeds', 1), -- Teaspoons
('Dum Aloo', 'Garam Masala', 1), -- Teaspoons
('Dum Aloo', 'Onion', 1),
('Dum Aloo', 'Potatoes', 3),
('Dum Aloo', 'Tomatoes', 2),
('Eclairs', 'Chocolate glaze', 1), -- Tablespoons
('Eclairs', 'Choux pastry', 1), -- Pieces
('Eclairs', 'Pastry cream', 1), -- Cups
('English Breakfast', 'Bacon', 3), -- Slices
('English Breakfast', 'Eggs', 2),
('English Breakfast', 'Sausages', 2), -- Links
('Eton Mess', 'Meringue', 3), -- Pieces
('Eton Mess', 'Strawberries', 1), -- Cups
('Eton Mess', 'Whipping cream', 1), -- Cups
('Fajitas', 'Bell peppers', 2),
('Fajitas', 'Chicken breast', 2), -- 100g units
('Fajitas', 'Fajita seasoning', 1), -- Tablespoons
('Fajitas', 'Onion', 1),
('Fajitas', 'Tortillas', 4), -- Each
('Falafel', 'Chickpeas', 2), -- Cups
('Falafel', 'Cumin', 1), -- Teaspoons
('Falafel', 'Garlic', 2),
('Falafel', 'Onion', 1),
('Falafel', 'Parsley', 1), -- Cups
('Fish and Chips', 'Beer', 1), -- Cans
('Fish and Chips', 'Flour', 1), -- Cups
('Fish and Chips', 'Potatoes', 3),
('Fish and Chips', 'White fish fillets', 4), -- Fillets
('Gazpacho', 'Bell pepper', 1),
('Gazpacho', 'Cucumber', 1),
('Gazpacho', 'Garlic', 1),
('Gazpacho', 'Olive oil', 1), -- Tablespoons
('Gazpacho', 'Red onion', 1),
('Gazpacho', 'Tomatoes', 3),
('Gazpacho', 'Vinegar', 1), -- Tablespoons
('Goulash', 'Beef', 2), -- 100g units
('Goulash', 'Bell peppers', 2),
('Goulash', 'Onions', 2),
('Goulash', 'Paprika', 2), -- Teaspoons
('Goulash', 'Tomatoes', 2),
('Greek Salad', 'Cucumber', 1),
('Greek Salad', 'Feta cheese', 1), -- Cups
('Greek Salad', 'Kalamata olives', 1), -- Cups
('Greek Salad', 'Olive oil', 2), -- Tablespoons
('Greek Salad', 'Red onion', 1),
('Greek Salad', 'Tomatoes', 3),
('Hamburgers', 'Cheese', 4), -- Slices
('Hamburgers', 'Ground beef', 2), -- 100g units
('Hamburgers', 'Hamburger buns', 4), -- Each
('Hamburgers', 'Lettuce', 4), -- Leaves
('Hamburgers', 'Onion', 1),
('Hamburgers', 'Tomato', 1),
('Hot and Sour Soup', 'Bamboo shoots', 1), -- Cups
('Hot and Sour Soup', 'Chicken broth', 2), -- Cups
('Hot and Sour Soup', 'Rice vinegar', 1), -- Tablespoons
('Hot and Sour Soup', 'Shiitake mushrooms', 1), -- Cups
('Hot and Sour Soup', 'Soy sauce', 1), -- Tablespoons
('Hot and Sour Soup', 'Tofu', 1), -- Block
('Hummus', 'Chickpeas', 2), -- Cups
('Hummus', 'Garlic', 2),
('Hummus', 'Lemon juice', 2), -- Tablespoons
('Hummus', 'Olive oil', 1), -- Tablespoons
('Hummus', 'Tahini', 2), -- Tablespoons
-- Continue for each recipe similarly
-- Continuation of recipes_ingredients INSERT statements
('Indian Curry', 'Chicken', 2), -- 100g units
('Indian Curry', 'Coconut milk', 1), -- Cups
('Indian Curry', 'Curry powder', 2), -- Teaspoons
('Irish Coffee', 'Brown sugar', 2), -- Tablespoons
('Irish Coffee', 'Coffee', 1), -- Cups
('Irish Coffee', 'Cream', 1), -- Tablespoons
('Irish Coffee', 'Irish whiskey', 1), -- Shots
('Irish Stew', 'Beef stock', 2), -- Cups
('Irish Stew', 'Carrots', 2),
('Irish Stew', 'Lamb shoulder', 2), -- 100g units
('Irish Stew', 'Onions', 2),
('Irish Stew', 'Potatoes', 3),
('Italian Biscotti', 'Almonds', 1), -- Cups
('Italian Biscotti', 'Flour', 2), -- Cups
('Italian Biscotti', 'Sugar', 1), -- Cups
('Jambalaya', 'Andouille sausage', 2), -- Links
('Jambalaya', 'Bell peppers', 2),
('Jambalaya', 'Chicken', 2), -- 100g units
('Jambalaya', 'Rice', 2), -- Cups
('Jambalaya', 'Shrimp', 200), -- Grams
('Japanese Cheesecake', 'Cream cheese', 1), -- Cups
('Japanese Cheesecake', 'Eggs', 3),
('Japanese Cheesecake', 'Sugar', 1), -- Cups
('Japanese Curry', 'Beef', 2), -- 100g units
('Japanese Curry', 'Carrots', 2),
('Japanese Curry', 'Curry powder', 2), -- Teaspoons
('Japanese Curry', 'Onion', 1),
('Japanese Curry', 'Potatoes', 2),
('Jerk Chicken', 'Chicken thighs', 4), -- 100g units
('Jerk Chicken', 'Green onions', 1), -- 100g units
('Jerk Chicken', 'Jerk seasoning', 1), -- Teaspoons
('Jerk Chicken', 'Scotch bonnet peppers', 2), -- Peppers
('Jerk Chicken', 'Thyme', 1), -- Tablespoons
('Kaiserschmarrn', 'Butter', 2), -- Tablespoons
('Kaiserschmarrn', 'Eggs', 3),
('Kaiserschmarrn', 'Flour', 1), -- Cups
('Kaiserschmarrn', 'Milk', 1), -- Cups
('Kaiserschmarrn', 'Sugar', 2), -- Tablespoons
('Kebab', 'Bell peppers', 2),
('Kebab', 'Kebab spices', 1), -- Tablespoons
('Kebab', 'Lamb', 2), -- 100g units
('Kebab', 'Onions', 2),
('Kebab', 'Yogurt', 1), -- Cups
('Key Lime Pie', 'Condensed milk', 1), -- Cups
('Key Lime Pie', 'Graham cracker crust', 1), -- Pieces
('Key Lime Pie', 'Lime juice', 3), -- Tablespoons
('Kimchi Fried Rice', 'Cooked rice', 2), -- Cups
('Kimchi Fried Rice', 'Eggs', 2),
('Kimchi Fried Rice', 'Kimchi', 1), -- Cups
('Kimchi Fried Rice', 'Onion', 1),
('Kimchi Fried Rice', 'Sesame oil', 1), -- Tablespoons
('Kimchi Stew', 'Garlic', 2),
('Kimchi Stew', 'Kimchi', 1), -- Cups
('Kimchi Stew', 'Onion', 1),
('Kimchi Stew', 'Pork belly', 1), -- 100g units
('Kimchi Stew', 'Tofu', 1); -- Block
-- Further continuation as required
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Lamb Tagine', 'Cinnamon', 1), -- Teaspoons
('Lamb Tagine', 'Dried apricots', 1), -- Cups
('Lamb Tagine', 'Garlic', 2),
('Lamb Tagine', 'Lamb shoulder', 2), -- 100g units
('Lamb Tagine', 'Onions', 2),
('Lasagna', 'Lasagna noodles', 6), -- Pieces
('Lasagna', 'Marinara sauce', 2), -- Cups
('Lasagna', 'Ricotta cheese', 2), -- Cups
('Lobster Bisque', 'Brandy', 1), -- Shots
('Lobster Bisque', 'Carrots', 2),
('Lobster Bisque', 'Celery', 2), -- Stalks
('Lobster Bisque', 'Lobster', 1), -- 100g units
('Lobster Bisque', 'Onion', 1),
('Lobster Bisque', 'Tomato paste', 1), -- Tablespoons
('Macaron', 'Almond flour', 1), -- Cups
('Macaron', 'Egg whites', 3),
('Macaron', 'Granulated sugar', 1), -- Cups
('Mapo Tofu', 'Doubanjiang (fermented bean paste)', 1), -- Tablespoons
('Mapo Tofu', 'Garlic', 2),
('Mapo Tofu', 'Green onion', 1), -- 100g units
('Mapo Tofu', 'Ground pork', 1), -- 100g units
('Mapo Tofu', 'Tofu', 1), -- Block
('Moussaka', 'Bechamel sauce', 2), -- Cups
('Moussaka', 'Eggplant', 2),
('Moussaka', 'Ground lamb', 2), -- 100g units
('Moussaka', 'Onion', 2),
('Moussaka', 'Tomatoes', 3),
('Nachos', 'Cheddar cheese', 1), -- Cups
('Nachos', 'Ground beef', 2), -- 100g units
('Nachos', 'Jalapenos', 3), -- Peppers
('Nachos', 'Salsa', 1), -- Cups
('Nachos', 'Tortilla chips', 2), -- Ounces
('Nasi Goreng', 'Chicken', 2), -- 100g units
('Nasi Goreng', 'Cooked rice', 2), -- Cups
('Nasi Goreng', 'Eggs', 2),
('Nasi Goreng', 'Garlic', 2),
('Nasi Goreng', 'Kecap Manis (sweet soy sauce)', 2), -- Tablespoons
('Nasi Goreng', 'Shallots', 2),
('Nougat', 'Almonds', 1), -- Cups
('Nougat', 'Egg whites', 2),
('Nougat', 'Honey', 1), -- Tablespoons
('Nougat', 'Sugar', 2), -- Cups
('Okonomiyaki', 'Bacon', 4), -- Slices
('Okonomiyaki', 'Cabbage', 2), -- Cups
('Okonomiyaki', 'Eggs', 2),
('Okonomiyaki', 'Flour', 1), -- Cups
('Okonomiyaki', 'Okonomiyaki sauce', 2), -- Tablespoons
('Osso Buco', 'Carrots', 2),
('Osso Buco', 'Celery', 2), -- Stalks
('Osso Buco', 'Onion', 2),
('Osso Buco', 'Tomatoes', 2), -- 100g units
('Osso Buco', 'Veal shanks', 2), -- 100g units
('Osso Buco', 'White wine', 1), -- Glasses
('Oysters Kilpatrick', 'Bacon', 4), -- Slices
('Oysters Kilpatrick', 'Butter', 2), -- Tablespoons
('Oysters Kilpatrick', 'Oysters', 12), -- Medium size
('Oysters Kilpatrick', 'Parsley', 1), -- Tablespoons
('Oysters Kilpatrick', 'Worcestershire sauce', 1), -- Tablespoons
('Paella', 'Bell peppers', 2),
('Paella', 'Chicken', 2), -- 100g units
('Paella', 'Rice', 2), -- Cups
('Paella', 'Saffron', 1), -- Teaspoons
('Paella', 'Seafood mix', 2), -- 100g units
('Peking Duck', 'Cucumbers', 2),
('Peking Duck', 'Duck', 1), -- Whole duck
('Peking Duck', 'Green onions', 2), -- 100g units
('Peking Duck', 'Hoisin sauce', 2), -- Tablespoons
('Pierogi', 'Cheese', 1), -- Cups
('Pierogi', 'Egg', 2),
('Pierogi', 'Flour', 2), -- Cups
('Pierogi', 'Onion', 2),
('Pierogi', 'Potato', 3),
('Quesadilla', 'Cheese', 1), -- Cups
('Quesadilla', 'Chicken', 2), -- 100g units
('Quesadilla', 'Green peppers', 2),
('Quesadilla', 'Onion', 1),
('Quesadilla', 'Tortillas', 4), -- Each
('Quiche Lorraine', 'Bacon', 3), -- Slices
('Quiche Lorraine', 'Eggs', 3),
('Quiche Lorraine', 'Pastry crust', 1);
-- Continue adding other recipes similarly

-- Inserting remaining ingredients for Quinoa Salad
INSERT INTO recipes_ingredients (recipeName, ingredientName, quantity) VALUES
('Quinoa Salad', 'Cherry tomatoes', 1), -- Cups
('Quinoa Salad', 'Cucumber', 1),
('Quinoa Salad', 'Feta cheese', 1), -- Cups
('Quinoa Salad', 'Lemon juice', 2), -- Tablespoons
('Quinoa Salad', 'Olive oil', 2), -- Tablespoons
('Quinoa Salad', 'Quinoa', 1), -- Cups
('Quinoa Salad', 'Red onion', 1),

-- Ramen ingredients
('Ramen', 'Chicken broth', 2), -- Cups
('Ramen', 'Eggs', 2),
('Ramen', 'Green onions', 1), -- 100g units
('Ramen', 'Ramen noodles', 2), -- Packages
('Ramen', 'Sesame oil', 1), -- Tablespoons
('Ramen', 'Soy sauce', 1), -- Tablespoons

-- Ratatouille ingredients
('Ratatouille', 'Bell peppers', 2),
('Ratatouille', 'Eggplant', 1),
('Ratatouille', 'Garlic', 2),
('Ratatouille', 'Onion', 1),
('Ratatouille', 'Tomato', 3),
('Ratatouille', 'Yellow squash', 1),
('Ratatouille', 'Zucchini', 1),

-- Risotto ingredients
('Risotto', 'Arborio rice', 1), -- Cups
('Risotto', 'Butter', 2), -- Tablespoons
('Risotto', 'Chicken stock', 3), -- Cups
('Risotto', 'Onion', 1),
('Risotto', 'Parmesan cheese', 1), -- Cups
('Risotto', 'White wine', 1), -- Cups

-- Samosa ingredients
('Samosa', 'Cumin seeds', 1), -- Teaspoons
('Samosa', 'Garam masala', 1), -- Teaspoons
('Samosa', 'Green peas', 1), -- Cups
('Samosa', 'Pastry dough', 2), -- Pieces
('Samosa', 'Potatoes', 3),

-- Shepherd's Pie ingredients
('Shepherds Pie', 'Carrots', 2),
('Shepherds Pie', 'Ground lamb', 2), -- 100g units
('Shepherds Pie', 'Onion', 1),
('Shepherds Pie', 'Peas', 1), -- Cups
('Shepherds Pie', 'Potatoes', 3),

-- Sushi ingredients
('Sushi', 'Fresh fish (various)', 2), -- 100g units
('Sushi', 'Nori sheets', 5), -- Sheets
('Sushi', 'Rice vinegar', 2), -- Tablespoons
('Sushi', 'Soy sauce', 1), -- Tablespoons
('Sushi', 'Sushi rice', 2), -- Cups
('Sushi', 'Wasabi', 1), -- Teaspoons

-- Tabbouleh ingredients
('Tabbouleh', 'Bulgur', 1), -- Cups
('Tabbouleh', 'Lemon juice', 2), -- Tablespoons
('Tabbouleh', 'Mint', 1), -- Cups
('Tabbouleh', 'Olive oil', 2), -- Tablespoons
('Tabbouleh', 'Parsley', 2), -- Cups
('Tabbouleh', 'Tomatoes', 2),

-- Tacos ingredients
('Tacos', 'Cheddar cheese', 1), -- Cups
('Tacos', 'Corn tortillas', 4), -- Each
('Tacos', 'Ground beef', 2), -- 100g units
('Tacos', 'Lettuce', 2), -- Leaves
('Tacos', 'Onion', 1),
('Tacos', 'Tomatoes', 2),

-- Tiramisu ingredients
('Tiramisu', 'Eggs', 3),
('Tiramisu', 'Espresso', 1), -- Cups
('Tiramisu', 'Ladyfingers', 12), -- Each
('Tiramisu', 'Mascarpone cheese', 1), -- Cups
('Tiramisu', 'Sugar', 1), -- Cups

-- Udon Soup ingredients
('Udon Soup', 'Dashi broth', 2), -- Cups
('Udon Soup', 'Green onions', 1), -- 100g units
('Udon Soup', 'Mirin', 1), -- Tablespoons
('Udon Soup', 'Mushrooms', 1), -- Cups
('Udon Soup', 'Soy sauce', 1), -- Tablespoons
('Udon Soup', 'Udon noodles', 2), -- Packages

-- Ukrainian Borscht ingredients
('Ukrainian borscht', 'Beetroot', 3),
('Ukrainian borscht', 'Cabbage', 1), -- Cups
('Ukrainian borscht', 'Carrots', 2),
('Ukrainian borscht', 'Onions', 2),
('Ukrainian borscht', 'Potatoes', 3),
('Ukrainian borscht', 'Tomato paste', 1), -- Tablespoons

-- Umbrian Lentil Stew ingredients
('Umbrian Lentil Stew', 'Carrots', 2),
('Umbrian Lentil Stew', 'Celery', 2), -- Stalks
('Umbrian Lentil Stew', 'Lentils', 2), -- Cups
('Umbrian Lentil Stew', 'Onion', 1),
('Umbrian Lentil Stew', 'Tomatoes', 2),

-- Vegetable Terrine ingredients
('Vegetable Terrine', 'Carrots', 2),
('Vegetable Terrine', 'Eggplant', 1),
('Vegetable Terrine', 'Gelatin', 1), -- Tablespoons
('Vegetable Terrine', 'Zucchini', 1),

-- Venison Stew ingredients
('Venison Stew', 'Beef stock', 2), -- Cups
('Venison Stew', 'Carrots', 2),
('Venison Stew', 'Onions', 2),
('Venison Stew', 'Potatoes', 3),
('Venison Stew', 'Venison', 2), -- 100g units

-- Vietnamese Pho ingredients
('Vietnamese Pho', 'Beef brisket', 2), -- 100g units
('Vietnamese Pho', 'Fish sauce', 1), -- Tablespoons
('Vietnamese Pho', 'Ginger', 1), -- Tablespoons
('Vietnamese Pho', 'Onion', 1),
('Vietnamese Pho', 'Rice noodles', 2), -- Cups
('Vietnamese Pho', 'Star anise', 2), -- Whole

-- Waldorf Salad ingredients
('Waldorf Salad', 'Apples', 2),
('Waldorf Salad', 'Celery', 2), -- Stalks
('Waldorf Salad', 'Lemon juice', 1), -- Tablespoons
('Waldorf Salad', 'Mayonnaise', 1), -- Cups
('Waldorf Salad', 'Walnuts', 1), -- Cups

-- Welsh Rarebit ingredients
('Welsh Rarebit', 'Beer', 1), -- Cans
('Welsh Rarebit', 'Bread', 2), -- Slices
('Welsh Rarebit', 'Cheddar cheese', 2), -- Slices
('Welsh Rarebit', 'Mustard', 1), -- Tablespoons
('Welsh Rarebit', 'Worcestershire sauce', 1), -- Tablespoons

-- Wiener Schnitzel ingredients
('Wiener Schnitzel', 'Breadcrumbs', 1), -- Cups
('Wiener Schnitzel', 'Eggs', 2),
('Wiener Schnitzel', 'Flour', 1), -- Cups
('Wiener Schnitzel', 'Lemon', 1),
('Wiener Schnitzel', 'Veal cutlets', 2), -- 100g units

-- Xiaolongbao ingredients
('Xiaolongbao', 'Flour', 2), -- Cups
('Xiaolongbao', 'Ginger', 1), -- Tablespoons
('Xiaolongbao', 'Green onions', 1), -- 100g units
('Xiaolongbao', 'Ground pork', 2), -- 100g units
('Xiaolongbao', 'Soy sauce', 1), -- Tablespoons

-- Xinjiang Lamb Skewers ingredients
('Xinjiang Lamb Skewers', 'Cumin seeds', 1), -- Teaspoons
('Xinjiang Lamb Skewers', 'Garlic powder', 1), -- Teaspoons
('Xinjiang Lamb Skewers', 'Lamb', 2), -- 100g units
('Xinjiang Lamb Skewers', 'Paprika', 1), -- Teaspoons
('Xinjiang Lamb Skewers', 'Salt', 1); -- Teaspoons
