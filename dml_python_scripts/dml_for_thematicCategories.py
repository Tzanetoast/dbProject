import sqlite3
import random

thematic_categories = [
    "thematic_category_1",
    "thematic_category_2",
    "thematic_category_3",
    "thematic_category_4",
    "thematic_category_5",
    "thematic_category_6",
    "thematic_category_7"
]

conn = sqlite3.connect('../example.db')
cursor = conn.cursor()

# Insert thematic categories with descriptions
for category in thematic_categories:
    cursor.execute('INSERT OR IGNORE INTO thematicCategories (name, description) VALUES (?, ?)', (category, f'Description for {category}'))

# Fetch all recipe names
cursor.execute("SELECT name FROM recipes")
recipes = [x[0] for x in cursor.fetchall()]

for recipe in recipes:
    number_of_thematic_categories_for_recipe = random.choice([1, 2, 3])
    thematic_categories_for_recipe = random.sample(thematic_categories, number_of_thematic_categories_for_recipe)

    for thematic_category_for_recipe in thematic_categories_for_recipe:
        cursor.execute("""
            INSERT OR IGNORE INTO recipes_thematicCategory (recipeName, thematicCategoryName)
            VALUES (?, ?)
        """, (recipe, thematic_category_for_recipe))

conn.commit()
cursor.close()
conn.close()

